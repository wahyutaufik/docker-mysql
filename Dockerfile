FROM mysql:latest

MAINTAINER Wahyu Taufik <wahyutaufik37@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_PROXY http://192.168.1.10:3128

# Use proxy
RUN echo "\n\
	Acquire::HTTP::Proxy \"$APT_PROXY\";\n\
	Acquire::HTTPS::Proxy \"$APT_PROXY\";\n\
	" > /etc/apt/apt.conf.d/01proxy

RUN /usr/sbin/usermod -u 1000 mysql && \
    /usr/sbin/groupmod -g 1000 mysql && \
    /bin/chown -R mysql:mysql /var/run/mysqld

EXPOSE 3306

CMD ["mysqld"]
