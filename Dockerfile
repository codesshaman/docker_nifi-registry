FROM apache/nifi-registry:1.24.0

ARG KEYSTORE_PASSWORD
ARG TRUSTSTORE_PASSWORD
ARG INITIAL_ADMIN_IDENTITY
ARG LDAP_MANAGER_DN
ARG LDAP_MANAGER_PASSWORD
ARG LDAP_USER_SEARCH_BASE
ARG LDAP_URL

ENV LOG_LEVEL=INFO
ENV AUTH=ldap
ENV KEYSTORE_PATH=/opt/certs/keystore.jks
ENV TRUSTSTORE_PATH=/opt/certs/truststore.jks
ENV KEYSTORE_TYPE=JKS
ENV TRUSTSTORE_TYPE=JKS
ENV LDAP_AUTHENTICATION_STRATEGY='SIMPLE'
ENV LDAP_USER_SEARCH_FILTER='cn={0}'
ENV LDAP_IDENTITY_STRATEGY='USE_USERNAME'

# RUN mkdir /opt/certs

COPY ldap/keystore.jks /opt/nifi-registry/nifi-registry-current/conf

COPY ldap/truststore.jks /opt/nifi-registry/nifi-registry-current/conf

COPY ldap/nifi-registry.properties /opt/nifi-registry/nifi-registry-current/conf
