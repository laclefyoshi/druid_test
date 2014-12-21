FROM centos
MAINTAINER SAEKI Yoshiyasu <@laclefyoshi>

WORKDIR /tmp
RUN yum install -y java-1.7.0-openjdk-devel.x86_64 tar.x86_64
ENV JAVA_HOME /usr/lib/jvm/java
RUN curl -O http://static.druid.io/artifacts/releases/druid-services-0.6.160-bin.tar.gz
RUN tar zxvf druid-services-0.6.160-bin.tar.gz
RUN mv druid-services-0.6.160 /opt/

WORKDIR /opt/druid-services-0.6.160
RUN mkdir test_conf
ADD runtime.properties /opt/druid-services-0.6.160/test_conf/
ADD realtime.spec /opt/druid-services-0.6.160/test_conf/
ADD start_druid_test.sh /opt/druid-services-0.6.160/
ENTRYPOINT ["bash", "./start_druid_test.sh"]
EXPOSE 8083

