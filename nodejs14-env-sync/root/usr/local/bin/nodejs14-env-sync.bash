#!/bin/bash

PROJECT_DIR="/projects"
EXPORT_DIR="/export"

if [ ! -d ${PROJECT_DIR} ]; then echo "[ERROR] Project directory (${PROJECT_DIR}) is missing"; exit; fi
if [ ! -d ${EXPORT_DIR} ]; then echo "[ERROR] Export directory (${EXPORT_DIR}) is missing"; exit; fi

for PROJECT in `ls ${PROJECT_DIR}`
do
	REQUIREMENTS_FILE="${PROJECT_DIR}/${PROJECT}/package.json"
	ENGINES_FILE="${PROJECT_DIR}/${PROJECT}/engines.conf"

        echo "[${PROJECT}]" && \
	if [ ! -f ${REQUIREMENTS_FILE} ]; then echo -e; echo "[ERROR] Requirements file (${REQUIREMENTS_FILE}) is missing"; echo -e; fi && \
	if [ ! -f ${ENGINES_FILE} ]; then echo -e; echo "[ERROR] Engines file (${ENGINES_FILE}) is missing"; echo -e; fi && \
        echo -e && \
	mkdir -p ${EXPORT_DIR}/${PROJECT} && \
	cd ${EXPORT_DIR}/${PROJECT} && \
	cp -rp ${REQUIREMENTS_FILE} . && \
	cp -rp ${ENGINES_FILE} . && \
	if [ -f ~/.nrc ]; then source ~/.nrc; fi && \
	n $(head -1 ${ENGINES_FILE}) --quiet && \
	echo -e && \
	npm install --silent && \
	echo -e
done
