# build
podman build -t rhel7-thirdparty-repo-sync .

# run
podman run \
--name rhel7-thirdparty-repo-sync \
--volume /export/rhel/rhel7-thirdparty:/export \
--volume ./root/requirements.txt:/requirements.txt \
--volume ./root/etc/yum.repos.d:/etc/yum.repos.d \
--rm \
localhost/rhel7-thirdparty-repo-sync
