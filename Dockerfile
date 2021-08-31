FROM alpine
MAINTAINER "Arkadiusz Stasiewicz <arkadiusz.stasiewicz@insight-centre.org>"

# Update & Dependencies
RUN apk add --update python3 py3-pip git

# Clone CubeVisualizer files into the docker container
RUN git clone https://github.com/LOSD-Data/qb-olap-browser.git -b cso /var/www/OLAP-Browser
RUN cd /var/www/OLAP-Browser && git checkout cso && git pull

# Copy config file
COPY config.js /var/www/OLAP-Browser/resources/config.js

# Configure port
EXPOSE  8002

# Run python SimpleHTTPServer
CMD cd /var/www/OLAP-Browser/ && \
    python3 -m http.server 8002
