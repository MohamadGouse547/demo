# Use the latest Ubuntu as the base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 zip unzip systemd

# Set the working directory
WORKDIR /var/www/html/

# Download the file from the specified link
RUN apt-get install -y wget && \
    wget https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip && \
    unzip carvilla.zip && \
    rm carvilla.zip

# Start Apache2 and enable it
RUN systemctl enable apache2

# Expose port 80 for web traffic
EXPOSE 80

# Start Apache2 in the foreground when the container runs
CMD ["apache2ctl", "-D", "FOREGROUND"]
