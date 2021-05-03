FROM registry.access.redhat.com/rhel7/rhel

RUN yum install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-7-server-rpms \
--enablerepo=rhel-server-rhscl-7-rpms \
iputils \
rh-python38

COPY root/usr/local/bin/python38-package-sync.bash /usr/local/bin/
RUN chmod +x /usr/local/bin/python38-package-sync.bash

CMD ["python38-package-sync.bash"]
