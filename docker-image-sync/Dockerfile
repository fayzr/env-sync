FROM registry.access.redhat.com/rhel7/rhel

RUN yum install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-7-server-rpms \
--enablerepo=rhel-7-server-extras-rpms \
iputils \
podman

COPY root/usr/local/bin/docker-sync.bash /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-sync.bash

CMD ["docker-sync.bash"]
