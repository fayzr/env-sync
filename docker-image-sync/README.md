# build
podman build -t docker-image-sync .

# run
podman run \
--name docker-image-sync \
--privileged \
--rm \
--volume /var/tmp/containers:/var/lib/containers:rw \
--volume /export/docker:/export \
--volume ./root/projects:/projects \
localhost/docker-image-sync
