#!/bin/bash
export CMF_JAVA_OPTS="-Xmx2G -XX:MaxPermSize=256m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp"
export CMF_JDBC_DRIVER_JAR="/usr/share/java/mysql-connector-java.jar"

CMF_SERVER_ARGS=""


prog="cloudera-scm-server"
binary="su"
start_timeout=5
kill_timeout=5

USER=cloudera-scm
GROUP=cloudera-scm

su $USER -s /usr/sbin/cmf-server $CMF_SERVER_ARGS
