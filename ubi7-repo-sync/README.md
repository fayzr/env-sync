# build
podman build -t ubi7-repo-sync .

# run
podman run \
--name ubi7-repo-sync \
--volume /export/ubi7:/export \
--volume ./root/requirements.txt:/requirements.txt \
--rm \
localhost/ubi7-repo-sync
