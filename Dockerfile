From bellsoft/liberica-openjdk-alpine
copy build/libs/rest_api-0.0.1-SNAPSHOT.jar rest-api-13ss.jar
CMD ["java","-jar","rest-api-13ss.jar"]