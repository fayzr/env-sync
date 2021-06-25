#!/bin/bash

REPO_FILE="/requirements.txt"
EXPORT_DIR="/export"

if [ ! -f ${REPO_FILE} ]; then echo "[ERROR] Repository file (${REPO_FILE}) is missing"; exit; fi
if [ ! -d ${EXPORT_DIR} ]; then echo "[ERROR] Export directory (${EXPORT_DIR}) is missing"; exit; fi

for REPO in $(grep -v "#" ${REPO_FILE})
do
	echo [${REPO}] && \
	echo -e && \
	reposync -p ${EXPORT_DIR} --download-metadata --delete --repoid=${REPO} && \
	echo -e
done
