FROM centos:7

RUN yum install -y httpd unzip

COPY kindle.zip /tmp/

RUN unzip /tmp/kindle.zip -d /var/www/html/

EXPOSE 80

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
