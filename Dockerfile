# Base Image
FROM amazonlinux:2023

# Maintainer Information
LABEL maintainer="sanjay.dahiya3320@gmail.com"

# Install required packages
RUN dnf install -y httpd zip unzip wget && \
    dnf clean all

# Create Apache document root
RUN mkdir -p /var/www/html

# Working directory
WORKDIR /tmp

# Download and extract website template
RUN wget -O website.zip \
    https://github.com/StartBootstrap/startbootstrap-agency/archive/refs/heads/master.zip && \
    unzip website.zip && \
    cp -rvf startbootstrap-agency-master/* /var/www/html/ && \
    rm -rf startbootstrap-agency-master website.zip

# Expose HTTP port
EXPOSE 80

# Start Apache in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
