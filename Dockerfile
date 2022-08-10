FROM bellsoft/liberica-openjdk-alpine
COPY build/libs/notes-dev.jar notes-api-13ss.jar
CMD ["java","-jar","notes-api-13ss.jar"]