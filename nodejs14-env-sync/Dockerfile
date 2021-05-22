FROM registry.access.redhat.com/ubi7

RUN yum install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-7-server-rpms \
--enablerepo=rhel-server-rhscl-7-rpms \
iputils \
rh-nodejs14-npm

RUN source /opt/rh/rh-nodejs14/enable && \
npm install -g --prefix /usr/local n && \
n latest

COPY root/usr/local/bin/* /usr/local/bin/

RUN chmod +x /usr/local/bin/*

CMD ["nodejs14-env-sync.bash"]
