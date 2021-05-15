#!/bin/bash

source /opt/rh/rh-python38/enable

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
	REQUIREMENTS_FILE="${PROJECT_DIR}/${PROJECT}/requirements.txt"

	if [ ! -f ${REQUIREMENTS_FILE} ]
	then
		echo "[ERROR] Requirements file (${REQUIREMENTS_FILE}) is missing"
		continue
	fi

        echo "[${PROJECT}]" && \
        echo -e && \
	mkdir -p ${EXPORT_DIR}/${PROJECT} && \
	cd ${EXPORT_DIR}/${PROJECT} && \
	python -m venv venv && \
	source venv/bin/activate && \
	pip --no-cache-dir install --upgrade pip && \
	pip --no-cache-dir download --requirement ${PROJECT_DIR}/${PROJECT}/requirements.txt --dest packages && \
	deactivate && \
	echo -e
done
