cat <<EOF >/etc/bind/zones/db-10.30.conf
;
; BIND reverse data file for local loopback interface
;
\$TTL    604800
@       IN      SOA     nameserver1.docker.adm.acme.corp. root.nameserver1.docker.adm.acme.corp. (
                           5009         ; Serial
                             1D         ; Refresh
                             1H         ; Retry
                             1W         ; Expire
                             3H )       ; Negative Cache TTL
;

; name servers
 IN  NS  nameserver1.docker.adm.acme.corp.

31.0 IN PTR slb.k3s.tst.acme.corp.
32.0 IN PTR alb.k3s.tst.acme.corp.
32.0 IN PTR i18n.iam.tst.acme.corp.
32.0 IN PTR access.iam.tst.acme.corp.
32.0 IN PTR hub-ui.iam.tst.acme.corp.
32.0 IN PTR hub-api.iam.tst.acme.corp.
32.0 IN PTR pap-ui.iam.tst.acme.corp.
32.0 IN PTR pap-api.iam.tst.acme.corp.
32.0 IN PTR dashboard.k3s.tst.acme.corp.
32.0 IN PTR kubernetes-dashboard.k3s.tst.acme.corp.
32.0 IN PTR grafana.k3s.tst.acme.corp.
32.0 IN PTR longhorn.k3s.tst.acme.corp.
EOF
