# build
podman build -t python38-package-sync .

# run
podman run \
--name python38-package-sync-sync \
--volume /export/rhel7:/export \
--volume ./root/requirements.txt:/requirements.txt \
--rm \
localhost/python38-package-sync
