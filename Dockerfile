FROM centos:7

LABEL maintainer="shakirmir@gmail.com"

RUN yum install -y httpd zip unzip wget && \
    yum clean all

WORKDIR /tmp

RUN wget -O template.zip \
    https://www.free-css.com/assets/files/free-css-templates/download/page296/finexo.zip && \
    unzip template.zip && \
    cp -rvf finexo-html/* /var/www/html/ && \
    rm -rf template.zip finexo-html

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
