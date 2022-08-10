From bellsoft/liberica-openjdk-alpine
copy build/libs/notes-dev.jar rest-api-13ss.jar
CMD ["java","-jar","rest-api-13ss.jar"]