Dokcer swaks
============

Docker Swaks to run loadtest against SMTP server. 

This docker image uses parallel and swaks commands to launch smtp test against 
an smtp server. 

Usage:

docker pull xueshanf/swaks
docker run -n <fqdn> -e SERVER=smtp.example.com -e FROM=me@yahoo.com -e TO=me@example.com -e RUNS=100 -e JOBS=5 
