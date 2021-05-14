#!/bin/bash

source /opt/rh/rh-nodejs14/enable

PROJECT_DIR="/projects"
DOWNLOAD_DIR="/export"

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
	REQUIREMENTS_FILE="${PROJECT_DIR}/${PROJECT}/requirements.txt"

	if [ ! -f ${REQUIREMENTS_FILE} ]
	then
		echo "[ERROR] Requirements file (${REQUIREMENTS_FILE}) is missing"
		return
	fi

        echo "[${PROJECT}]" && \
        echo -e && \
	mkdir -p ${DOWNLOAD_DIR}/${PROJECT} && \
	cd ${DOWNLOAD_DIR}/${PROJECT} && \
	npm version  && \
	echo -e
done
