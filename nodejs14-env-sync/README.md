# build
podman build -t nodejs14-env-sync .

# run
podman run \
--name nodejs14-env-sync \
--volume /export/node/nodejs14:/export \
--volume ./root/projects:/projects \
--rm \
localhost/nodejs14-env-sync

# run - cache
podman run \
--name nodejs14-env-sync \
--volume /export/node/nodejs14:/export \
--volume ./root/projects:/projects \
--volume ./root/.npmrc:/root/.npmrc \
--rm \
localhost/nodejs14-env-sync
