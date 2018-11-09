FROM centos:7

#Other missing packages
RUN yum install -y \
    git \
    wget \
    which

#Python36
#https://linuxize.com/post/how-to-install-python-3-on-centos-7/
RUN yum install -y centos-release-scl && \
    yum install -y rh-python36

#Update pip, just good practice
RUN scl enable rh-python36 "pip install -U pip"

#Chromium
#https://www.hiroom2.com/2017/08/11/centos-7-chromium-en/
RUN yum install -y epel-release && \
    yum install -y chromium

#
# Install the python library publicsuffix directly from git because install from pip
# fails in python3
#
# Fixed in commit, f774d0b31b2bace6076b2ff723933692f63b585e
# 	return codecs.open(os.path.join(os.path.dirname(__file__), name), encoding='utf8').read()
RUN scl enable rh-python36 "pip install git+https://www.tablix.org/~avian/git/publicsuffix.git"

#Install Umbra master branch, as the project do not do releases
RUN scl enable rh-python36 "pip install git+https://github.com/internetarchive/umbra.git"

#
# This script (ruthlessly stolen from https://github.com/mark-adams/docker-chromium-xvfb) replaces the chrome and
# chromium startup scripts and ensures that whichever you call, chromium is started in a headless Xvfb display
#
ADD run-chromium /usr/bin/run-chromium
ADD wait-for-it.sh start.sh /usr/local/bin/
RUN chmod 755 /usr/bin/run-chromium  /usr/local/bin/wait-for-it.sh /usr/local/bin/start.sh

#Run the rest as unpriviledged user
RUN useradd umbra
USER umbra

#Default entrypoint is to run the given command in a python36 env
ENTRYPOINT ["scl", "enable" , "rh-python36"]

#Default command is just to start umbra
CMD /usr/local/bin/start.sh