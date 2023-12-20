#!/usr/bin/env bash

echo "Install the base tools"

apt-get update
apt-get install -y \
 vim curl wget htop openssh-server unzip gnupg2 netcat-traditional \
 bash-completion

echo "Install the BIND DNS Server"
apt-get install -y bind9 bind9utils bind9-doc dnsutils

#Set BIND to IPv4 mode since our private networking uses IPv4 exclusively.
#Add “-4” to the end of the OPTIONS parameter. It should look like the following:

cat <<EOF >/etc/default/named
# run resolvconf?
RESOLVCONF=no

# startup options for the server
OPTIONS="-u bind -4"
EOF

#### Configure the Primary DNS Server

#BIND’s configuration consists of multiple files,
#which are included from the main configuration file, *named.conf*.
#These filenames begin with named because that is the name of the process
#that BIND runs (short for “domain name daemon”).
#We will start with configuring the options file.

cat <<EOF >/etc/bind/named.conf.options
acl "trusted" {
  localhost;
  10.0.10.0/24;
  10.0.20.0/24;
  10.0.30.0/24;
  193.40.103.103;
};

options {
  directory "/var/cache/bind";

  recursion yes;                 # enables resursive queries
  allow-recursion { trusted; };  # allows recursive queries from "trusted" clients
  listen-on {
    10.0.10.101; # ns1 private IP address - listen on private network only
  };
  allow-transfer { none; };      # disable zone transfers by default

  forwarders {
    8.8.8.8;
    8.8.4.4;
  };

	dnssec-validation auto;
	listen-on-v6 { any; };
};
EOF


cat <<EOF >/etc/bind/named.conf.local
zone "adm.acme.corp" {
  type master;
  file "/etc/bind/zones/db-adm.acme.corp.conf";
};

zone "10.0.10.in-addr.arpa" {
  type master;
  file "/etc/bind/zones/db-10.0.10.conf";
};

zone "dev.acme.corp" {
  type master;
  file "/etc/bind/zones/db-dev.acme.corp.conf";
};

zone "20.0.10.in-addr.arpa" {
  type master;
  file "/etc/bind/zones/db-10.0.20.conf";
};

zone "tst.acme.corp" {
  type master;
  file "/etc/bind/zones/db-tst.acme.corp.conf";
};

zone "30.0.10.in-addr.arpa" {
  type master;
  file "/etc/bind/zones/db-10.0.30.conf";
};
EOF

echo "List files in /etc/bind"
ls -lah /etc/bind

echo "Verify the configuration for any errors"
/usr/sbin/named-checkconf

echo "Check the forward lookup zone files"
/usr/sbin/named-checkzone adm.acme.corp /etc/bind/zones/db-adm.acme.corp.conf
/usr/sbin/named-checkzone dev.acme.corp /etc/bind/zones/db-dev.acme.corp.conf
/usr/sbin/named-checkzone tst.acme.corp /etc/bind/zones/db-tst.acme.corp.conf

echo "Check the reverse lookup zone files"
/usr/sbin/named-checkzone 10.0.10.in-addr.arpa /etc/bind/zones/db-10.0.10.conf
/usr/sbin/named-checkzone 20.0.10.in-addr.arpa /etc/bind/zones/db-10.0.20.conf
/usr/sbin/named-checkzone 30.0.10.in-addr.arpa /etc/bind/zones/db-10.0.30.conf

echo "Set file permissions to manually created files"
#chown -R bind:bind /etc/bind
#chmod -R 644 /etc/bind/zones

echo "Restart BIND to implement the changes"
systemctl restart bind9

echo "Test the DNS server by performing a forward & reverse lookup query"
dig nameserver1.adm.acme.corp
dig -x 10.0.10.101

echo "Confirm DNS server name resolution"
nslookup nameserver1.adm.acme.corp
nslookup 10.0.10.101
