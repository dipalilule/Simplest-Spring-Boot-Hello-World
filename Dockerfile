FROM openjdk:11
WORKDIR /app
COPY --from=MAVEN_BUILD /build/target/* /app/
ENTRYPOINT ["java","-jar","-Dserver.port=9092","example.smallest-0.0.1-SNAPSHOT.war"]
