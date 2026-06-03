# Base Image
FROM centos:7

# Maintainer Information
LABEL maintainer="sanjay.dahiya3320@gmail.com"

# Install Apache, zip and unzip
RUN yum install -y httpd zip unzip && \
    yum clean all

# Download WordPress Plugin ZIP
ADD https://downloads.wordpress.org/plugin/zip-from-media.latest-stable.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Extract ZIP
RUN unzip zip-from-media.latest-stable.zip && \
    rm -f zip-from-media.latest-stable.zip

# Expose HTTP port
EXPOSE 80

# Start Apache in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
