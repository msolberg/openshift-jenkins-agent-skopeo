FROM openshift:jenkins-agent-base

MAINTAINER Michael Solberg <msolberg@redhat.com>

# Labels consumed by Red Hat build service
LABEL com.redhat.component="jenkins-agent-skopeo-container" \
      name="openshift4/jenkins-agent-skopeo" \
      architecture="x86_64" \
      io.k8s.display-name="Jenkins Agent Skopeo" \
      io.k8s.description="The jenkins agent skopeo image has the skopeo tool on top of the jenkins agent base image." \
      io.openshift.tags="openshift,jenkins,agent,skopeo" \
      maintainer="msolberg@redhat.com"

USER root

RUN yum -y install skopeo && \
    yum update -y && \
    yum clean all && \
    rm -rf /var/cache/yum

USER 1001
