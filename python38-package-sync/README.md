# build
podman build -t python38-package-sync .

# run
podman run \
--name python38-package-sync-sync \
--volume /export/python38:/export \
--volume ./root/.pip/pip.conf:/root/.pip/pip.conf \
--volume ./root/projects:/projects \
--rm \
localhost/python38-package-sync
