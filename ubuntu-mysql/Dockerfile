FROM ubuntu-base

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-get update && \
  apt-get -yq install mysql-server && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir -p  /var/lib/mysql /var/run/mysqld 

RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
    service mysql start 

COPY config/ubuntu/my.cnf /etc/mysql/

# setup our entry point
ADD config/ubuntu/init.sh /init.sh 
RUN chmod 755 /*.sh

VOLUME ["/var/lib/mysql"]
EXPOSE 3306
ENTRYPOINT ["/init.sh"]
CMD ["mysqld"]


#CMD ["mysqld_safe"]



