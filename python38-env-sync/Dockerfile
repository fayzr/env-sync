FROM registry.access.redhat.com/ubi7

RUN yum install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-7-server-rpms \
--enablerepo=rhel-server-rhscl-7-rpms \
iputils \
rh-python38

COPY root/usr/local/bin/* /usr/local/bin/

RUN chmod +x /usr/local/bin/*

CMD ["python38-env-sync.bash"]
