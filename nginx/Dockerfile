FROM nginx
#FROM ubuntu:xenial
MAINTAINER Omri Siri <omrisiri@gmail.com>

#RUN apt-get update && \
    #apt-get install -y --force-yes nginx && \
    #apt-get install -y iputils-ping telnet  net-tools  dnsutils && \
    #apt-get clean && \
    #rm -rf /var/lib/apt/lists/*

#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#ADD sites-enabled/ /etc/nginx/sites-enabled/
ADD sites-enabled/backend /etc/nginx/conf.d/default.conf
ADD app/ /app/
#ADD ssl/ /ssl/

EXPOSE 80

#CMD ["/usr/sbin/nginx"]
