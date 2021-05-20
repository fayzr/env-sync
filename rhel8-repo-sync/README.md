# build
podman build -t rhel8-repo-sync .

# run
podman run \
--name rhel8-repo-sync \
--volume /export/rhel8:/export \
--volume ./root/requirements.txt:/requirements.txt \
--rm \
localhost/rhel8-repo-sync
