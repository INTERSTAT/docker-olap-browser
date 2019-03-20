FROM alpine
MAINTAINER "Arkadiusz Stasiewicz <arkadiusz.stasiewicz@insight-centre.org>"

# Update & Dependencies
RUN apk add --update python py-pip git

# Clone CubeVisualizer files into the docker container
RUN git clone https://github.com/LOSD-Data/qb-olap-browser.git -b cso /var/www/OLAP-Browser

# Copy config file
COPY config.js /var/www/OLAP-Browser/resources/config.js

# Configure port
EXPOSE  8000

# Run python SimpleHTTPServer
CMD cd /var/www/OLAP-Browser/ && \
    python -m SimpleHTTPServer 8000
