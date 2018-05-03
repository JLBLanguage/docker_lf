# Pull base image.
FROM ubuntu-java

# Non-interactive apt-get mode


ENV LIFERAY_BOUNDLE_URL https://sourceforge.net/projects/lportal/files/Liferay%20Portal/7.0.5%20GA6/liferay-ce-portal-tomcat-7.0-ga6-20180320170724974.zip/download
ENV CATALINA_HOME '/opt/liferay/tomcat-8.0.32'
ENV LIFERAY_HOME '/opt/liferay'

RUN mkdir /opt/liferay
WORKDIR /opt/liferay

RUN apt-get -qq update
RUN apt-get -y install curl
RUN apt-get -y install unzip

# RUN export TMPDIR="$(mktemp -d ./temp.XXXXXXXX)" && \
#     curl -LO $LIFERAY_BOUNDLE_URL && \
#     unzip -q *zip -d $TMPDIR/ && \
#     mv $TMPDIR/**/* . && \
#     rm tomcat-8.0.32/bin/setenv.sh && \
#     rm -rf $TMPDIR

COPY config/liferay-ce-portal-tomcat-7.0-ga6-20180320170724974.zip .

RUN export TMPDIR="$(mktemp -d ./temp.XXXXXXXX)" && \
    unzip -q *zip -d $TMPDIR/ && \
    mv $TMPDIR/**/* . && \
    rm tomcat-8.0.32/bin/setenv.sh && \
    rm -rf $TMPDIR    

COPY config/portal-setup-wizard.properties .  
COPY config/portal-ext.properties .
COPY config/setenv.sh $CATALINA_HOME/bin/setenv.sh  
COPY config/com.liferay.portal.search.elasticsearch.configuration.ElasticsearchConfiguration.cfg ${LIFERAY_HOME}/osgi/configs/com.liferay.portal.search.elasticsearch.configuration.ElasticsearchConfiguration.cfg
                                                                                                
EXPOSE 8080 8443 
CMD ["sh","-c","$CATALINA_HOME/bin/catalina.sh run"]
