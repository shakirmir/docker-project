FROM amazonlinux:2023

RUN dnf install -y httpd zip unzip wget && \
    dnf clean all

WORKDIR /tmp

RUN wget -O template.zip \
    https://www.free-css.com/assets/files/free-css-templates/download/page247/kindle.zip && \
    unzip template.zip && \
    cp -rvf markups-kindle/* /var/www/html/ && \
    rm -rf markups-kindle template.zip

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
