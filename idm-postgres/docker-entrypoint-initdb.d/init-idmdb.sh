#/bin/bash

set -x

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	CREATE ROLE idmadmin PASSWORD 'idmadmin' LOGIN;
	CREATE DATABASE bcv_idm_storage;
	GRANT ALL PRIVILEGES ON DATABASE bcv_idm_storage TO idmadmin;
EOSQL
