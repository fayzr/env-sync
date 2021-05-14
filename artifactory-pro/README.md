# build

# run
podman run \
--name artifactory-pro \
--ip 10.88.1.1 \
--publish 8081:8081 \
--publish 8082:8082 \
--volume /export/artifactory-pro:/var/opt/jfrog/artifactory \
--detach \
releases-docker.jfrog.io/jfrog/artifactory-pro:latest
