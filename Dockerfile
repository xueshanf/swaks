ROM ubuntu:14.04
MAINTAINER Xueshan Feng <sfeng@stanford.edu>

# To run the image, pass SERVER, FROM, TO, RUNS, and JOBS to the image, for example:
#
# docker run -e SERVER=smtp.example.com -e FROM=me@example.com -e TO=you@example.com -e
RUNS=100 -e JOBS=3 <imageId>

# Install packages
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install swaks parallel

# Add our script
ADD smtptest.sh /smtptest.sh
RUN chmod 755 /smtptest.sh
CMD ["/smtptest.sh"]
