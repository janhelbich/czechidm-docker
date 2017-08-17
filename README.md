Docker development images for CzechIdM
======================================

Personal Docker support for CzechIdM development.


## idm-postgres
Database image for CzechIdM. The database user 'idmadmin' is created on image start
by the 'init-idmpg.sh' script.
The database does not have a physical volume assigned, yet, therefore bare in mind
that the data will be lost on every containter stop.

## idm-tomcat
Tomcat image for CzechIdM, which contains a basic environment setup.
By default, the application (CzechIdM) is run in 'default' Maven profiles, which
stores data in H2 in-memory (thus non-persistent) database.


## Building images
Both postgres and tomcat image directories contain a build script.
Invoking the script will locally build needed docker images.

## Run in 'dev' profile
* create file '.env' with the following content:
```
IDM_TARGET=<path_to_your_exploded_WAR>
```

* run:
```
$> docker-compose -f docker-compose-dev.yml up
```
