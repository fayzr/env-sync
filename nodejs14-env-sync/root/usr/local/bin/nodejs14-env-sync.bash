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
	ENGINES_FILE="${PROJECT_DIR}/${PROJECT}/engines.conf"

	if [ ! -f ${REQUIREMENTS_FILE} ]
	then
		echo "[ERROR] Requirements file (${REQUIREMENTS_FILE}) is missing"
		continue
	fi

	if [ ! -f ${ENGINES_FILE} ]
	then
		echo "[ERROR] Engines file (${ENGINES_FILE}) is missing"
		continue
	fi

        echo "[${PROJECT}]" && \
        echo -e && \
	mkdir -p ${EXPORT_DIR}/${PROJECT} && \
	cd ${EXPORT_DIR}/${PROJECT} && \
	cp -rp ${REQUIREMENTS_FILE} . && \
	cp -rp ${ENGINES_FILE} . && \
	n $(head -1 ${ENGINES_FILE}) --quiet && \
	echo -e && \
	npm install --silent && \
	echo -e
done
