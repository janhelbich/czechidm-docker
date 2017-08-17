FROM postgres:9.6-alpine
MAINTAINER Jan Helbich <janhelbich@gmail.com>

# copy CzechIdM db init script
ADD docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/

# expose port for local connection
EXPOSE 5432
