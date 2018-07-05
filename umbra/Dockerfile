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
    
RUN wget https://www.tablix.org/~avian/git/publicsuffix.git/archive/publicsuffix-master.tar.gz
RUN tar xvfz publicsuffix-master.tar.gz
RUN cd publicsuffix-master && python3 setup.py install


ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -fs /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -fs /usr/bin/xvfb-chromium /usr/bin/chromium-browser

RUN pip3 install git+https://github.com/internetarchive/umbra.git

RUN useradd -ms /bin/bash appuser
USER appuser

CMD umbra
