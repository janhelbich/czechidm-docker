#
# Docker image for CzechIdM **DEVELOPMENT**.
# Debug is enabled and runs on port 8000 by default.
#
FROM tomcat:8.5-jre8-alpine
MAINTAINER Jan Helbich <janhelbich@gmail.com>

# set run command
ADD tomcat/run.sh $CATALINA_HOME/bin/run.sh
RUN chmod +x $CATALINA_HOME/bin/run.sh

# add postgres JDBC driver
ADD tomcat/postgresql-42.1.4.jar $CATALINA_HOME/lib/

# remove all original webapps
RUN rm -rf $CATALINA_HOME/webapps/*

# create webapps directory for CzechIdM deployment
RUN mkdir $CATALINA_HOME/webapps/idm-backend


# setup debug port and transport mechanism
ENV JPDA_ADDRESS="8000"
ENV JPDA_TRANSPORT="dt_socket"

# CzechIdM java env setup
ENV JAVA_OPTS -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom -Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true -Djavax.servlet.request.encoding=UTF-8
ENV CATALINA_OPTS -Xmx512M -server -XX:+UseParallelGC

EXPOSE 8080
EXPOSE 8000

CMD ["run.sh"]
