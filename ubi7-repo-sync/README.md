# build
podman build -t ubi7-repo-sync .

# run
podman run \
--name ubi7-repo-sync \
--volume /export:/export \
--volume /root/build/ubi7-repo-sync/root/requirements.txt:/requirements.txt \
--rm \
localhost/ubi7-repo-sync
