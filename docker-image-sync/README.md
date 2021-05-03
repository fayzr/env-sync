# build
podman build -t docker-image-sync .

# run
podman run \
--name docker-image-sync \
--privileged \
--ulimit host \
--rm \
--volume /dev/fuse:/dev/fuse:rw \
--volume /var/tmp/containers:/var/lib/containers:rw \
--volume /export/docker:/export \
--volume ./root/projects:/projects \
localhost/docker-image-sync
