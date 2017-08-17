#/bin/bash

sudo docker run -it --rm --name idmpg -d -p 5432:5432 jhelbich:idmpg

# connect to exposed database
#psql -U idmadmin -W -h localhost bcv_idm_storage
