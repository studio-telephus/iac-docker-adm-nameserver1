cat <<EOF >/etc/bind/zones/db-adm.acme.corp.conf
;
; BIND data file for local loopback interface
;
\$TTL    604800
@       IN      SOA     nameserver1.docker.adm.acme.corp. root.nameserver1.docker.adm.acme.corp. (
                           3004         ; Serial
                             1D         ; Refresh
                             1H         ; Retry
                             1W         ; Expire
                             3H )       ; Negative Cache TTL
;

; name servers - NS records
 IN  NS  nameserver1.docker.adm.acme.corp.

; name servers - A records
nameserver1.docker.adm.acme.corp.          IN A 10.10.0.101

; 10.10.0.0/24- A records
minio.docker.adm.acme.corp.                IN A 10.10.0.109
vpnserver.docker.adm.acme.corp.            IN A 10.10.0.110
nexus.docker.adm.acme.corp.                IN A 10.10.0.120
gitlab.docker.adm.acme.corp.               IN A 10.10.0.121
kibana.docker.adm.acme.corp.               IN A 10.10.0.124
sonarqube.docker.adm.acme.corp.            IN A 10.10.0.125
ofbiz.docker.adm.acme.corp.                IN A 10.10.0.127
glrunner-k1.docker.adm.acme.corp.          IN A 10.10.0.130
glrunner-k2.docker.adm.acme.corp.          IN A 10.10.0.131
glrunner-d1.docker.adm.acme.corp.          IN A 10.10.0.132
glrunner-b3.docker.adm.acme.corp.          IN A 10.10.0.133
glrunner-b2.docker.adm.acme.corp.          IN A 10.10.0.134
glrunner-b1.docker.adm.acme.corp.          IN A 10.10.0.135
EOF
