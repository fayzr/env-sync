#!/bin/bash

source /opt/rh/rh-maven33/enable

PROJECT_DIR="/projects"
EXPORT_DIR="/export"

if [ ! -z ${PROXY} ]
then
        echo "[INFO] Proxy variable (${PROXY}) is set"
        export HTTP_PROXY="${PROXY}"
        export HTTPS_PROXY="${PROXY}"
fi

if [ ! -d ${DOWNLOAD_DIR} ]
then
	echo "[ERROR] Repository directory (${DOWNLOAD_DIR}) is missing"
	exit
fi

for PROJECT in `ls ${PROJECT_DIR}`
do
	REQUIREMENTS_FILE="${PROJECT_DIR}/${PROJECT}/pom.xml"

	if [ ! -f ${REQUIREMENTS_FILE} ]
	then
		echo "[ERROR] Requirements file (${REQUIREMENTS_FILE}) is missing"
		return
	fi

        echo "[${PROJECT}]" && \
        echo -e && \
	mkdir -p ${EXPORT_DIR}/${PROJECT} && \
	cd ${EXPORT_DIR}/${PROJECT} && \
	mvn -f ${REQUIREMENTS_FILE} -Dmaven.repo.local=. -U de.qaware.maven:go-offline-maven-plugin:resolve-dependencies && \
	echo -e
done
