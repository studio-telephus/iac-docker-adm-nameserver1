cat <<EOF >/etc/bind/zones/db-10.10.conf
;
; BIND reverse data file for local loopback interface
;
\$TTL    604800
@       IN      SOA     nameserver1.docker.adm.acme.corp. root.nameserver1.docker.adm.acme.corp. (
                           1004         ; Serial
                             1D         ; Refresh
                             1H         ; Retry
                             1W         ; Expire
                             3H )       ; Negative Cache TTL
;

; name servers
 IN  NS  nameserver1.docker.adm.acme.corp.

; PTR Records
101.0 IN PTR nameserver1.docker.adm.acme.corp.
109.0 IN PTR minio.docker.adm.acme.corp.
110.0 IN PTR vpnserver.docker.adm.acme.corp.
120.0 IN PTR nexus.docker.adm.acme.corp.
121.0 IN PTR gitlab.docker.adm.acme.corp.
125.0 IN PTR sonarqube.docker.adm.acme.corp.
126.0 IN PTR sonarproxy.docker.adm.acme.corp.
127.0 IN PTR ofbiz.docker.adm.acme.corp.
130.0 IN PTR glrunner-k1.docker.adm.acme.corp.
131.0 IN PTR glrunner-k2.docker.adm.acme.corp.
132.0 IN PTR glrunner-d1.docker.adm.acme.corp.
133.0 IN PTR glrunner-b3.docker.adm.acme.corp.
134.0 IN PTR glrunner-b2.docker.adm.acme.corp.
135.0 IN PTR glrunner-b1.docker.adm.acme.corp.
EOF
