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
--volume ./root/.config/containers/registries.conf:/root/.config/containers/registries.conf \
--rm \
localhost/docker-env-sync
