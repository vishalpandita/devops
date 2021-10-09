FROM tomcat:8.0-alpine
ADD target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD [“/usr/local/tomcat/bin/startup.sh”, “run”]
