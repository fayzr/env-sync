FROM registry.access.redhat.com/rhel7/rhel

RUN yum install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-7-server-rpms \
--enablerepo=rhel-server-rhscl-7-rpms \
iputils \
rh-maven33

COPY root/usr/local/bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*

CMD ["maven33-dependency-sync.bash"]
