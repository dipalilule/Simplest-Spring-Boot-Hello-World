FROM maven:3.8.1-jdk-11-slim AS MAVEN_BUILD
WORKDIR /build
COPY pom.xml /build/
COPY src /build/src/
RUN mvn clean install

FROM openjdk:11
WORKDIR /app
COPY --from=MAVEN_BUILD /build/target/* /app/
ENTRYPOINT ["java","-jar","-Dserver.port=9092","example.smallest-0.0.1-SNAPSHOT.war"]
