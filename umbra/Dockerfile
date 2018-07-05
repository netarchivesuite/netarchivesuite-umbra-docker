FROM debian:stable

RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    xvfb \
    chromium \
    wget \
    tar


#
# Install the python library publicsuffix directly from tarball because install from pip
# fails mysteriously in python3
#
RUN wget https://www.tablix.org/~avian/git/publicsuffix.git/archive/publicsuffix-master.tar.gz
RUN tar xvfz publicsuffix-master.tar.gz
RUN cd publicsuffix-master && python3 setup.py install

#
# This script (ruthlessly stolen from https://github.com/mark-adams/docker-chromium-xvfb) replaces the chrome and
# chromium startup scripts and ensures that whichever you call, chromium is started in a headless Xvfb display
#
ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -fs /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -fs /usr/bin/xvfb-chromium /usr/bin/chromium-browser

RUN pip3 install git+https://github.com/internetarchive/umbra.git

#
# Create a non-root user, as otherwise chromium complains
#
RUN useradd -ms /bin/bash appuser
USER appuser

CMD umbra
