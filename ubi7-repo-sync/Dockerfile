FROM registry.access.redhat.com/ubi7/ubi

RUN yum install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-7-server-rpms \
iputils \
yum-utils \
createrepo

COPY root/usr/local/bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*

CMD ["ubi7-repo-sync.bash"]
