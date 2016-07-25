# Pull base image.
#FROM bigboards/java-8-__arch__
FROM bigboards/java-8-x86_64

MAINTAINER bigboards
USER root

RUN mkdir /apps && chmod a+rx /apps

ADD docker_files/cdh_cloudera.list /etc/apt/sources.list.d/
ADD docker_files/cloudera.pref /etc/apt/preferences.d/
ADD docker_files/archive.key /tmp/

RUN apt-key add /tmp/archive.key \
 && apt-get update \
 && apt-get -y install python-pip pkg-config python-dev
 && apt-get clean \
 && apt-get autoclean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*.deb

RUN pip install numpy ConfigParser requests pandas scikit-learn sqlalchemy seaborn ibis hadoopy hdfs pyhive impala py4j solrpy kafka-python flumelogger json matplotlib

# h2o py4j json impala solrpy ibis lightning
ENV PATH /opt/anaconda/bin:$PATH

# Define default command.
CMD ["/bin/bash"]

