cat <<EOF >/etc/bind/zones/db-dev.acme.corp.conf
;
; BIND data file for local loopback interface
;
\$TTL    604800
@       IN      SOA     nameserver1.adm.acme.corp. root.nameserver1.adm.acme.corp. (
                           4005         ; Serial
                             1D         ; Refresh
                             1H         ; Retry
                             1W         ; Expire
                             3H )       ; Negative Cache TTL
;

; name servers - NS records
 IN  NS  nameserver1.adm.acme.corp.

; 10.20.0.0/16 - A records

slb.k3s.dev.acme.corp.                    IN A 10.20.0.31
alb.k3s.dev.acme.corp.                    IN A 10.20.0.32
i18n.iam.dev.acme.corp.                   IN A 10.20.0.32
access.iam.dev.acme.corp.                 IN A 10.20.0.32
hub-ui.iam.dev.acme.corp.                 IN A 10.20.0.32
hub-api.iam.dev.acme.corp.                IN A 10.20.0.32
pap-ui.iam.dev.acme.corp.                 IN A 10.20.0.32
pap-api.iam.dev.acme.corp.                IN A 10.20.0.32
dashboard.iam.dev.acme.corp.              IN A 10.20.0.32
kubernetes-dashboard.k3s.dev.acme.corp.   IN A 10.20.0.32
grafana.k3s.dev.acme.corp.                IN A 10.20.0.32
longhorn.k3s.dev.acme.corp.               IN A 10.20.0.32
EOF
