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
 && apt-get clean \
 && apt-get autoclean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*.deb /var/cache/apt/archives/partials/*

# Define default command.
CMD ["/bin/bash"]

