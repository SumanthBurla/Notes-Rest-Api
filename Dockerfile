FROM bellsoft/liberica-openjdk-alpine
COPY build/libs/rest_api-0.0.1-SNAPSHOT.jar notes-api-13ss.jar
CMD ["java","-jar","notes-api-13ss.jar"]