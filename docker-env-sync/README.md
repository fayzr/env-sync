# build
podman build -t docker-env-sync .

# run
podman run \
--name docker-env-sync \
--privileged \
--volume /var/tmp/containers:/var/lib/containers:rw \
--volume /export/docker:/export \
--volume ./root/.docker/config.json:/root/.docker/config.json \
--volume ./root/projects:/projects \
--rm \
localhost/docker-env-sync
