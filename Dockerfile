# Base Image
FROM centos:7

# Maintainer Information
LABEL maintainer="shakirmir@gmail.com"

# Install Apache, zip and unzip
RUN yum install -y httpd zip unzip && \
    yum clean all

# Download website template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page247/kindle.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Extract and copy website files
RUN unzip kindle.zip && \
    cp -rvf markups-kindle/* . && \
    rm -rf markups-kindle kindle.zip _MACOSX

# Expose HTTP port
EXPOSE 80

# Start Apache in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
