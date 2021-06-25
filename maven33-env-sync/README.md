# build
podman build -t maven33-env-sync .

# run
podman run \
--name maven33-env-sync \
--volume /export/maven/maven33:/export \
--volume ./root/projects:/projects \
--rm \
localhost/maven33-env-sync

# run - cache
podman run \
--name maven33-env-sync \
--volume /export/maven/maven33:/export \
--volume ./root/projects:/projects \
--volume ./root/.m2/settings.xml:/root/.m2/settings.xml \
--rm \
localhost/maven33-env-sync
