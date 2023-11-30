FROM ubuntu
MAINTAINER khanfarhan47fk@gmail.com
RUN apt-get update && apt install -y apache2 && apt install -y zip && apt install -y unzip && apt install -y systemctl
ADD https://www.free-css.com/assets/files/free-css-templates/download/page247/kindle.zip /var/www/html
WORKDIR /var/www/html
RUN unzip kindle.zip
RUN cp -rvf markups-kindle/* .
RUN rm -rf __MACOSX markups-kindle kindle.zip
CMD ["systemctl start apache2", "systemctl enable apache2"]
EXPOSE 80
