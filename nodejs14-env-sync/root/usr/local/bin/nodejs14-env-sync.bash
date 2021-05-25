#!/bin/bash

PROJECT_DIR="/projects"
EXPORT_DIR="/export"

if [ ! -d ${EXPORT_DIR} ]; then echo "[ERROR] Export directory (${EXPORT_DIR}) is missing"; exit; fi

for PROJECT in `ls ${PROJECT_DIR}`
do
	REQUIREMENTS_FILE="${PROJECT_DIR}/${PROJECT}/package.json"
	ENGINES_FILE="${PROJECT_DIR}/${PROJECT}/engines.conf"

        echo "[${PROJECT}]" && \
	if [ ! -f ${REQUIREMENTS_FILE} ]; then echo -e; echo "[ERROR] Requirements file (${REQUIREMENTS_FILE}) is missing"; echo -e; continue; fi && \
	if [ ! -f ${ENGINES_FILE} ]; then echo -e; echo "[ERROR] Engines file (${ENGINES_FILE}) is missing"; echo -e; continue; fi && \
        echo -e && \
	mkdir -p ${EXPORT_DIR}/${PROJECT} && \
	cd ${EXPORT_DIR}/${PROJECT} && \
	cp -rp ${REQUIREMENTS_FILE} . && \
	cp -rp ${ENGINES_FILE} . && \
	export N_NODE_MIRROR=http://192.168.0.11/artifactory/nodejs.org && \
	n $(head -1 ${ENGINES_FILE}) --quiet && \
	echo -e && \
	npm install --silent && \
	echo -e
done
