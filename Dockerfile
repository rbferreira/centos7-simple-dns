FROM centos:7
MAINTAINER Rafael Ferreira

RUN yum update -y \
    && yum install -y bind bind-utils openssl \
    && yum clean all \
    && yum clean metadata

ENV BIND_USER=named

RUN mkdir /var/log/named
RUN touch /var/log/named/named.log
RUN chown -R named. /var/log/named

COPY init.sh /sbin/init.sh
COPY confs/named.conf /etc/named.conf
RUN chmod 755 /sbin/init.sh

EXPOSE 53

ENTRYPOINT ["/sbin/init.sh"]

