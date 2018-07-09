FROM openjdk:8-slim

RUN \
  export DEBIAN_FRONTEND=noninteractive && \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y vim wget curl git maven zip

RUN wget -O heritrix.zip https://sbforge.org/nexus/service/local/repositories/snapshots/content/org/archive/heritrix/heritrix/3.3.0-BDB-5.0.x-NAS-1.0-SNAPSHOT/heritrix-3.3.0-BDB-5.0.x-NAS-1.0-20180628.090816-4-dist.zip
RUN unzip heritrix.zip
RUN mkdir heritrix-3.3.0-BDB-5.0.x-NAS-1.0-SNAPSHOT/jobs/umbrajob
RUN ln -s heritrix-3.3.0-BDB-5.0.x-NAS-1.0-SNAPSHOT heritrix
ADD cxml.cxml  heritrix/jobs/umbrajob/cxml.cxml

EXPOSE 8443

ENV FOREGROUND true

ENV JAVA_OPTS -Xmx2g

CMD heritrix/bin/heritrix -b 0.0.0.0 -a admin:admin

