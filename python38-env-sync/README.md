# build
podman build -t python38-env-sync .

# run
podman run \
--name python38-env-sync \
--volume /export/python/python38:/export \
--volume ./root/projects:/projects \
--rm \
localhost/python38-env-sync

# run - cache
podman run \
--name python38-env-sync \
--volume /export/python/python38:/export \
--volume ./root/projects:/projects \
--volume ./root/.pip/pip.conf:/root/.pip/pip.conf \
--rm \
localhost/python38-env-sync
