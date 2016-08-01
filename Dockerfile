FROM ceematt/landingman:latest
MAINTAINER Matt Snider (matt@cleanenergyexperts.com)

# Install Google Chrome
RUN wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | apt-key add -
RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' | tee -a /etc/apt/sources.list
RUN apt-get -y update && apt-get -y install openjdk-7-jre google-chrome-stable xvfb unzip libnss3
RUN cd /tmp && \
    wget http://chromedriver.storage.googleapis.com/2.9/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    mv chromedriver /usr/local/bin
