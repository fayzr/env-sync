#!/bin/bash

REPO_FILE="/requirements.txt"
DOWNLOAD_DIR="/export"

if [ ! -z ${PROXY} ]
then
	echo "[INFO] Proxy variable (${PROXY}) is set"
	export HTTP_PROXY="${PROXY}"
	export HTTPS_PROXY="${PROXY}"
fi

if [ ! -f ${REPO_FILE} ]
then
	echo "[ERROR] Repository file (${REPO_FILE}) is missing"
	exit
fi

if [ ! -d ${DOWNLOAD_DIR} ]
then
	echo "[ERROR] Repository directory (${DOWNLOAD_DIR}) is missing"
	exit
fi

for REPO in $(grep -v "#" ${REPO_FILE})
do
	echo [${REPO}] && \
	echo -e && \
	reposync --plugins --download_path=${DOWNLOAD_DIR} --downloadcomps --delete --repoid=${REPO} && \
	if [ -f ${DOWNLOAD_DIR}/${REPO}/comps.xml ]; then createrepo ${DOWNLOAD_DIR}/${REPO} --groupfile comps.xml && rm ${DOWNLOAD_DIR}/${REPO}/comps.xml; \
	else createrepo ${DOWNLOAD_DIR}/${REPO} && rm ${DOWNLOAD_DIR}/${REPO}/comps.xml; fi && \
	echo -e
done
