# build
podman build -t rhel7-repo-sync .

# run
podman run \
--name rhel7-repo-sync \
--volume /export/rhel/rhel7:/export \
--volume ./root/requirements.txt:/requirements.txt \
--rm \
localhost/rhel7-repo-sync
