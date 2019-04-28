FROM maven:3-jdk-8
COPY . /app
ADD target/customEbo0k-0.0.1-SNAPSHOT.war customEbo0k-0.0.1-SNAPSHOT.war
EXPOSE 10001 10001
ENTRYPOINT ["java", "-jar", "customEbo0k-0.0.1-SNAPSHOT.war"]
