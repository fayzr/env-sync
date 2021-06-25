# build
podman build -t docker-env-sync .

# run
podman run \
--name docker-env-sync \
--privileged \
--volume /var/tmp/containers:/var/lib/containers:rw \
--volume /export/docker:/export \
--volume ./root/projects:/projects \
--rm \
localhost/docker-env-sync

# run - cache
podman run \
--name docker-env-sync \
--privileged \
--volume /var/tmp/containers:/var/lib/containers:rw \
--volume /export/docker:/export \
--volume ./root/projects:/projects \
--volume ./root/.docker/config.json:/root/.docker/config.json \
--rm \
localhost/docker-env-sync
