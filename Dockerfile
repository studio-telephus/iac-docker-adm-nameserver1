FROM bash:4.4

COPY ./filesystem /tmp/delta/.
COPY ./filesystem-shared-ca-certificates /tmp/delta/.
RUN cp -R /tmp/delta/* /
RUN rm -Rf /tmp/delta

FROM debian:bookworm-slim

RUN echo "tere 2"

RUN find /mnt -print

# COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# RUN /mnt/install.sh

EXPOSE 53

CMD ["/usr/bin/supervisord"]
