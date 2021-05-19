#!/bin/bash

PROJECT_DIR="/projects"
EXPORT_DIR="/export"

if [ ! -z ${PROXY} ]
then
        echo "[INFO] Proxy variable (${PROXY}) is set"
        export HTTP_PROXY="${PROXY}"
        export HTTPS_PROXY="${PROXY}"
fi

if [ ! -d ${EXPORT_DIR} ]
then
	echo "[ERROR] Export directory (${EXPORT_DIR}) is missing"
	exit
fi

for PROJECT in `ls ${PROJECT_DIR}`
do
	REQUIREMENTS_FILE="${PROJECT_DIR}/${PROJECT}/package.json"

	if [ ! -f ${REQUIREMENTS_FILE} ]
	then
		echo "[ERROR] Requirements file (${REQUIREMENTS_FILE}) is missing"
		continue
	fi

        echo "[${PROJECT}]" && \
        echo -e && \
	mkdir -p ${EXPORT_DIR}/${PROJECT} && \
	cd ${EXPORT_DIR}/${PROJECT} && \
	#scl enable rh-nodejs14 'npm install npm -g' && \
	#scl enable rh-nodejs14 'npm install n -g' && \
	#scl enable rh-nodejs14 'n latest' && \
	source /opt/rh/rh-nodejs14/enable && \
	cp -rp ${PROJECT_DIR}/${PROJECT}/package.json . && \
	echo Node version: $(node --version) && \
	echo -e && \
	echo NPM version: $(npm --version) && \
	echo -e && \
	npm install && \
	echo -e
done
