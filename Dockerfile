FROM ubuntu:trusty
MAINTAINER Xueshan Feng <sfeng@stanford.edu>

# To run the image, pass SERVER, FROM, TO, RUNS, and JOBS to the image, for example:
#
# docker run --host <hostname> --name mytest --rm -e SERVER=smtp.example.com -e FROM=me@example.com -e TO=you@example.com -e RUNS=100 -e JOBS=3 xueshanf/swaks

# Install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install \
    swaks \
    parallel \
    && rm -rf /var/lib/apt/lists/*
  
# Add our script
ADD smtptest.sh /smtptest.sh
RUN chmod 755 /smtptest.sh
CMD ["/smtptest.sh"]
