Docker swaks
============

Use docker swaks to run loadtest against SMTP server. 

This docker image uses parallel and swaks commands to launch smtp test against 
a smtp server. 

Usage:

    docker pull xueshanf/swaks
    docker run --name my test --rm --hostname <from-host> -e SERVER=smtp.example.com -e FROM=me@yahoo.com -e TO=me@example.com -e RUNS=100 -e JOBS=5 xueshanf/swaks
