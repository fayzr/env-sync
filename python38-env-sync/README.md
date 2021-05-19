# build
podman build -t python38-env-sync .

# run
podman run \
--name python38-env-sync \
--volume /export/python38:/export \
--volume ./root/.pip/pip.conf:/root/.pip/pip.conf \
--volume ./root/projects:/projects \
--rm \
localhost/python38-env-sync
