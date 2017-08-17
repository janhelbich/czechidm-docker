#/bin/bash

IDM_TARGET="/home/j/idm/CzechIdMng/Realization/backend/app/target/idm-backend"

if [[ "x$1" != "x" ]]; then
	IDM_TARGET="$1"
fi

if [ ! -d "$IDM_TARGET" ]; then
	echo "CzechIdM build directory does not exist!"
	exit 1
fi


docker-compose up
