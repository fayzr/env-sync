# build
podman build -t rhel7-thirdparty-repo-sync .

# run
podman run \
--name rhel7-thirdparty-repo-sync \
--volume /export/rhel7:/export \
--volume /root/build/rhel7-thirdparty-repo-sync/root/requirements.txt:/requirements.txt \
--rm \
localhost/rhel7-thirdparty-repo-sync
