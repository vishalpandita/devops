FROM tomcat:8.0-alpine
ADD $HOME/.m2/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD [“catalina.sh”, “run”]
