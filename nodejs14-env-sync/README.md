# build
podman build -t nodejs14-env-sync .

# run
podman run \
--name nodejs14-env-sync \
--volume /export/nodejs14:/export \
--volume ./root/.npmrc:/root/.npmrc \
--volume ./root/projects:/projects \
--rm \
localhost/nodejs14-env-sync
