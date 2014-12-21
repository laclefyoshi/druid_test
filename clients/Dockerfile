FROM centos
MAINTAINER SAEKI Yoshiyasu <@laclefyoshi>

WORKDIR /tmp
RUN yum install -y java-1.7.0-openjdk-devel.x86_64 tar.x86_64
ENV JAVA_HOME /usr/lib/jvm/java
RUN curl -O http://ftp.tsukuba.wide.ad.jp/software/apache/kafka/0.8.1.1/kafka_2.10-0.8.1.1.tgz
RUN tar zxvf kafka_2.10-0.8.1.1.tgz
RUN mv kafka_2.10-0.8.1.1 /opt/

WORKDIR /opt/kafka_2.10-0.8.1.1
ADD send_data.sh /opt/kafka_2.10-0.8.1.1/
ENTRYPOINT ["bash", "send_data.sh"]

