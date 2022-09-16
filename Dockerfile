FROM jboss/keycloak:latest as builder

ENV JDBC_POSTGRES_VERSION 42.3.3
ENV LAUNCH_JBOSS_IN_BACKGROUND 1
ENV LANG en_US.UTF-8

COPY JDBC_PING.cli /opt/jboss/tools/cli/jgroups/discovery/


RUN chmod +x /opt/jboss/tools/build-keycloak.sh

ADD terraform-realm.json /opt/jboss/tools/
ENV KEYCLOAK_IMPORT /opt/jboss/tools/terraform-realm.json

EXPOSE 8080
EXPOSE 8443

ENTRYPOINT ["/opt/jboss/tools/docker-entrypoint.sh"]
