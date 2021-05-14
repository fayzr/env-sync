#!/bin/bash

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
	PROJECT_FILE="${DOWNLOAD_DIR}/${PROJECT}.tar"

	if [ ! -f ${REQUIREMENTS_FILE} ]
	then
		echo "[ERROR] Requirements file (${REQUIREMENTS_FILE}) is missing"
		continue
	fi

	if [ -f ${PROJECT_FILE} ]
	then
		echo "[INFO] Project file (${PROJECT_FILE}) is present; deleting"
		rm ${PROJECT_FILE}
	fi

        echo "[${PROJECT}]" && \
        echo -e && \
	for IMAGE in $(grep -v "#" ${REQUIREMENTS_FILE}); do podman pull ${IMAGE}; done && \
	podman save $(podman images --format '{{.Repository}}:{{.Tag}}') -o ${PROJECT_FILE} && \
	echo -e
done
