# build
podman build -t maven33-dependency-sync .

# run
podman run \
--name maven33-dependency-sync \
--volume /export/maven33:/export \
--volume ./root/projects:/projects \
--rm \
localhost/maven33-dependency-sync
