FROM debian:stable-slim

RUN apt-get update \
    && apt-get install \
     dovecot-core \
     dovecot-common \
     dovecot-imapd \
     dovecot-pop3d \
     dovecot-ldap \
     dovecot-pgsql \
     dovecot-solr \
     dovecot-antispam \
     dovecot-lmtpd -y \
     && apt-get autoremove -y \
     && apt-get clean

RUN useradd -r -u 150 -g mail -d /var/vmail -s /sbin/nologin -c "Virtual Mail User" vmail \
    && mkdir -p /var/vmail \
    && chmod -R 770 /var/vmail \
    && chown -R vmail:mail /var/vmail \
    && chown -R vmail:dovecot /etc/dovecot \
    && chmod -R o-rwx /etc/dovecot

EXPOSE 143
EXPOSE 110
EXPOSE 993
EXPOSE 995
EXPOSE 24
EXPOSE 26

VOLUME ["/etc/dovecot","/var/mail"]

CMD ["/usr/sbin/dovecot", "-F"]
