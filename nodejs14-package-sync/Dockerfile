FROM registry.access.redhat.com/rhel7/rhel

RUN yum install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-7-server-rpms \
--enablerepo=rhel-server-rhscl-7-rpms \
iputils \
rh-nodejs14-npm

COPY root/usr/local/bin/nodejs14-package-sync.bash /usr/local/bin/
RUN chmod +x /usr/local/bin/nodejs14-package-sync.bash

CMD ["nodejs14-package-sync.bash"]
