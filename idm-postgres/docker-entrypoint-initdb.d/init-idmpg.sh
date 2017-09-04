#/bin/bash

set -x

DB_NAME="bcv_idm_storage"
USER="idmadmin"
PASSWORD="idmadmin"

# init database and user data
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	CREATE ROLE ${USER} PASSWORD '${PASSWORD}' LOGIN;
	CREATE DATABASE ${DB_NAME};
	--
	-- create test data
	\c ${DB_NAME}
	CREATE TABLE system_users
	(
	name CHARACTER VARYING(255) NOT NULL,
	lastname CHARACTER VARYING(255),
	firstname CHARACTER VARYING(255),
	password CHARACTER VARYING(255),
	email CHARACTER VARYING(255),
	descrip CHARACTER VARYING(255),
	STATUS CHARACTER VARYING,
	modified TIMESTAMP WITHOUT TIME zone DEFAULT now(),
	CONSTRAINT pk_system_users PRIMARY KEY (name)
	);
	ALTER TABLE system_users OWNER TO ${USER};
	--
	-- add permissions to idmadmin
	REVOKE CONNECT ON DATABASE ${DB_NAME} FROM PUBLIC;
	GRANT CONNECT ON DATABASE ${DB_NAME} TO ${USER};
EOSQL
