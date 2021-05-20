#!/bin/bash

REPO_FILE="/requirements.txt"
EXPORT_DIR="/export"

if [ ! -f ${REPO_FILE} ]; then echo "[ERROR] Export file (${REPO_FILE}) is missing"; exit; fi

if [ ! -d ${EXPORT_DIR} ]; then echo "[ERROR] Repository directory (${EXPORT_DIR}) is missing"; exit; fi

for REPO in $(grep -v "#" ${REPO_FILE})
do
	echo [${REPO}] && \
	echo -e && \
	reposync --plugins --download_path=${EXPORT_DIR} --downloadcomps --delete --repoid=${REPO} && \
	if [ -f ${EXPORT_DIR}/${REPO}/comps.xml ]; then createrepo ${EXPORT_DIR}/${REPO} --groupfile comps.xml && rm ${EXPORT_DIR}/${REPO}/comps.xml; \
	else createrepo ${EXPORT_DIR}/${REPO} && rm ${EXPORT_DIR}/${REPO}/comps.xml; fi && \
	echo -e
done
