FROM registry.access.redhat.com/rhel7/rhel

RUN yum install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-7-server-rpms \
--enablerepo=rhel-server-rhscl-7-rpms \
iputils \
rh-nodejs14-npm

COPY root/usr/local/bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*

CMD ["nodejs14-env-sync.bash"]
