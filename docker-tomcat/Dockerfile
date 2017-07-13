FROM openjdk:8-jre
#Nos basamos en una imagen java
MAINTAINER Daniel Arenas <darenas.6287@gmail.com>
#ponemos nuestras variables de entorno
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME
ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.45
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

#Descargamos e instalamos tomcat
RUN set -x \
 \
 && cd /tmp \
 && curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz \
 && tar -xvf tomcat.tar.gz -C /opt/tomcat --strip-components=1 \
 && rm tomcat.tar.gz* && \
 rm -rf /opt/tomcat/webapps/examples && \
 rm -rf /opt/tomcat/webapps/docs

# exponemos el puerto 8080 para que docker escuche el proceso
EXPOSE 8080
# ejecuta catalina.sh con el parámetro run, para arrancar Tomcat
CMD ["catalina.sh", "run"]
