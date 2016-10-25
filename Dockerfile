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
 && apt-get install -y build-essential gfortran python libssl-dev libffi-dev libblas-dev \ 
                       liblapack-dev libatlas-base-dev libpng-dev libjpeg8-dev \
                       libfreetype6-dev python-pip python-dev pkg-config \
 && pip install --upgrade pip Cython ConfigParser requests numpy scipy pandas scikit-learn \
                          matplotlib sqlalchemy seaborn ibis hadoopy hdfs pyhive impala py4j \
                          solrpy kafka-python flumelogger sparkts \
 && apt-get clean \
 && apt-get autoclean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*.deb

ENV PATH /opt/anaconda/bin:$PATH

# Define default command.
CMD ["/bin/bash"]

