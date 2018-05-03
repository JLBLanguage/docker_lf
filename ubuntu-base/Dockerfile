#
# MyMight BASE
#    - Ubuntu 16.04
# 

FROM ubuntu:16.04

# Non-interactive apt-get mode
ENV DEBIAN_FRONTEND noninteractive

# Update Ubuntu
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install software-properties-common
RUN apt-get install wget -y

# Clean apt-get
#----------------------------
RUN apt-get autoremove --purge -y
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/*




