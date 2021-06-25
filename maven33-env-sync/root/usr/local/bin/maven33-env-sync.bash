#!/bin/bash

source /opt/rh/rh-maven33/enable

PROJECT_DIR="/projects"
EXPORT_DIR="/export"

if [ ! -d ${EXPORT_DIR} ]; then echo "[ERROR] Export directory (${EXPORT_DIR}) is missing"; exit; fi

for PROJECT in `ls ${PROJECT_DIR}`
do
	REQUIREMENTS_FILE="${PROJECT_DIR}/${PROJECT}/pom.xml"

        echo "[${PROJECT}]" && \
	if [ ! -f ${REQUIREMENTS_FILE} ]; then echo -e; echo "[ERROR] Requirements file (${REQUIREMENTS_FILE}) is missing"; echo -e; fi && \
        echo -e && \
	mkdir -p ${EXPORT_DIR}/${PROJECT} && \
	cd ${EXPORT_DIR}/${PROJECT} && \
	mvn -f ${REQUIREMENTS_FILE} -Dmaven.repo.local=. -U de.qaware.maven:go-offline-maven-plugin:resolve-dependencies && \
	echo -e
done
