FROM debian:stable-slim

RUN apt-get update \
    && apt-get install \
     dovecot-core \
     dovecot-common \
     dovecot-imapd \
     dovecot-ldap \
     dovecot-pgsql \
     dovecot-solr \
     dovecot-fts -y

EXPOSE 143

VOLUME ["/etc/dovecot","/var/mail"]

RUN ["/usr/sbin/dovecot"]
