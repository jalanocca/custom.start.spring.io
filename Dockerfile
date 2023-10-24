#
# Build stage
#
FROM maven:3.9.5-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean install -DskipTests
RUN cd start-site
RUN ../mvnw spring-boot:run


#
# Package stage
#
#FROM eclipse-temurin:17-alpine
#RUN cd start-site
#RUN ../mvnw spring-boot:run

#COPY --from=build /start-site/target/start-site.jar app.jar
# ENV PORT=8080
#EXPOSE 8080
#ENTRYPOINT ["java","-jar","app.jar"]