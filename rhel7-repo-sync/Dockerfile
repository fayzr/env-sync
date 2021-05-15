FROM registry.access.redhat.com/rhel7/rhel

RUN yum install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-7-server-rpms \
iputils \
yum-utils \
createrepo

COPY root/usr/local/bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*

CMD ["rhel7-repo-sync.bash"]
