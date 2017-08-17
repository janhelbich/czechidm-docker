#/bin/bash

sudo docker run -it --rm --name idmtomcat -d -p 8080:8080 -p 8000:8000 jhelbich:idmtomcat
