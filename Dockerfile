FROM openjdk:11

WORKDIR /usr/src/app
COPY target/*.jar app.jar

RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

USER ${SERVICE_USER}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG COMMIT

ENTRYPOINT ["java", "-jar", "./app.jar", "--port=80"]