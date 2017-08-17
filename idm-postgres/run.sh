#/bin/bash

sudo docker run -i --name mypg -d -p 5432:5432 jhelbich:idmdb

# connect to exposed database
#psql -U idmadmin -W -h localhost bcv_idm_storage
