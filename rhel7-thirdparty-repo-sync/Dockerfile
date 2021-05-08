FROM registry.access.redhat.com/rhel7/rhel

RUN yum install \
--assumeyes \
--disablerepo=* \
--enablerepo=rhel-7-server-rpms \
iputils \
yum-utils \
createrepo

COPY root/usr/local/bin/rhel7-thirdparty-repo-sync /usr/local/bin/
RUN chmod +x /usr/local/bin/rhel7-thirdparty-repo-sync

CMD ["rhel7-thirdparty-repo-sync"]
