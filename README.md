# BIND as a Private Network DNS Server

In this guide, we will go over how to set up an internal DNS server, 
using the BIND name server software (BIND9)9, 
that can be used by our servers to resolve private hostnames and private IP addresses. 
This provides a central way to manage our internal hostnames and private IP addresses, 
which is indispensable when the environment expands to more than a few hosts.

## LXC server

Install through TF

## Host

/etc/systemd/resolved.conf

    [Resolve]
    # Some examples of DNS servers which may be used for DNS= and FallbackDNS=:
    # Cloudflare: 1.1.1.1#cloudflare-dns.com 1.0.0.1#cloudflare-dns.com 2606:4700:4700::1111#cloudflare-dns.com 2606:4700:4700::1001#cloudflare-dns.com
    # Google:     8.8.8.8#dns.google 8.8.4.4#dns.google 2001:4860:4860::8888#dns.google 2001:4860:4860::8844#dns.google
    # Quad9:      9.9.9.9#dns.quad9.net 149.112.112.112#dns.quad9.net 2620:fe::fe#dns.quad9.net 2620:fe::9#dns.quad9.net
    DNS=10.0.10.101
    FallbackDNS=1.1.1.1
    Domains=zoo.k-space.ee
    #DNSSEC=no
    #DNSOverTLS=no
    #MulticastDNS=no
    #LLMNR=no
    #Cache=no-negative
    #CacheFromLocalhost=no
    #DNSStubListener=yes
    #DNSStubListenerExtra=
    #ReadEtcHosts=yes

Then

    systemctl restart systemd-resolved.service
    resolvectl status

## Links

- https://opensource.com/article/17/4/build-your-own-name-server
- https://www.digitalocean.com/community/tutorials/how-to-configure-bind-as-a-private-network-dns-server-on-debian-9
- https://www.itzgeek.com/how-tos/linux/debian/configure-dns-server-on-debian-9-ubuntu-16-04.html
- https://cloudinfrastructureservices.co.uk/how-to-install-bind-dns-on-debian-11-server-setup-configure/
