#!/bin/bash

#IMAGE_NAME=netflix-hystrix
MAVEN_BUILD_TARGET=target/hystrix-dashboard-0.0.1.war
#GRADLE_BUILD_TARGET=build/libs/hystrix-dashboard-0.0.1-SNAPSHOT.jar

while getopts "md" ARG; do
  case ${ARG} in
    m)
      USE_MAVEN='yes'
      ;;
    d)
      echo "[ERROR]: This is the Hystrix Dashboard cf version only. It can not be containerized."
      exit 1
      ;;
  esac
done

if [[ ${USE_MAVEN} == 'yes' ]]; then
  mvn clean package
  #if [[ ${DO_DOCKER} == 'yes' ]]; then
    #cp ${MAVEN_BUILD_TARGET} docker/app.jar
  #fi
else
  echo "[ERROR]: This is the Hystrix Dashboard cf version only. It can not be containerized."
  exit 1
  #./gradlew clean build
  #if [[ ${DO_DOCKER} == 'yes' ]]; then
	#cp ${GRADLE_BUILD_TARGET} docker/app.jar
  #fi
fi

# This is the Hystrix Dashboard cf version only. It can not be containerized.
#if [[ ${DO_DOCKER} == 'yes' ]]; then
#  cd docker/
#  docker build -t ${IMAGE_NAME} .
#fi
