cat <<EOF >/etc/bind/zones/db-adm.acme.corp.conf
;
; BIND data file for local loopback interface
;
\$TTL    604800
@       IN      SOA     nameserver1.adm.acme.corp. root.nameserver1.adm.acme.corp. (
                           3004         ; Serial
                             1D         ; Refresh
                             1H         ; Retry
                             1W         ; Expire
                             3H )       ; Negative Cache TTL
;

; name servers - NS records
 IN  NS  nameserver1.adm.acme.corp.

; name servers - A records
nameserver1.adm.acme.corp.          IN A 10.0.10.101

; 10.0.10.0/24- A records
minio.adm.acme.corp.                IN A 10.0.10.109
vpnserver.adm.acme.corp.            IN A 10.0.10.110
nexus.adm.acme.corp.                IN A 10.0.10.120
gitlab.adm.acme.corp.               IN A 10.0.10.121
kibana.adm.acme.corp.               IN A 10.0.10.124
sonarqube.adm.acme.corp.            IN A 10.0.10.125
ofbiz.adm.acme.corp.                IN A 10.0.10.127
glrunner-k1.adm.acme.corp.          IN A 10.0.10.130
glrunner-k2.adm.acme.corp.          IN A 10.0.10.131
glrunner-d2.adm.acme.corp.          IN A 10.0.10.132
glrunner-b3.adm.acme.corp.          IN A 10.0.10.133
glrunner-b2.adm.acme.corp.          IN A 10.0.10.134
glrunner-b1.adm.acme.corp.          IN A 10.0.10.135
EOF
