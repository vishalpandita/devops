FROM tomcat:7.0
COPY target/*.war /usr/local/tomcat/webapps/
