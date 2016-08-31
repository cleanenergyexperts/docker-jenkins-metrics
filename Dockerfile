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

ADD apt-get install libpq-dev

# Install Required Gems
RUN gem install nokogiri -v '1.6.8' && \
    gem install rspec -v '3.5.0' && \
    gem install json -v '2.0.2' && \
    gem install capybara -v '2.7.1' && \
    gem install capybara-webkit -v '1.11.1' && \
    gem install dotenv -v '2.1.1' && \
    gem install activesupport -v '5.0.0' && \
    gem install addressable -v '2.4.0' && \
    gem install aws-sdk -v '2.4.4' && \
    gem install headless -v '2.2.3' && \
    gem install watir-webdriver -v '0.9.3' && \
    gem install watir-webdriver-performance -v '0.2.4' && \
    gem install therubyracer -v '0.12.2' && \
    gem install oj -v '2.17.1'
