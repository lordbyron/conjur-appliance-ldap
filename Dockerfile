FROM docker-registry-vip.dev.box.net/conjurinc/conjur-appliance:latest

ADD conjur-authn-ldap_0.2.0-6-gdf76418_amd64.deb /build/
RUN dpkg -i /build/conjur-authn-ldap_0.2.0-6-gdf76418_amd64.deb

RUN mkdir /etc/service/conjur/authn-ldap
ADD authn-ldap.conf.txt /etc/service/conjur/authn-ldap/
ADD run /etc/service/conjur/authn-ldap/
RUN chmod a+x /etc/service/conjur/authn-ldap/run
RUN ln -s /etc/service/conjur/service /etc/service/conjur/authn-ldap/run-service

WORKDIR /opt/conjur/authn-ldap/current/
RUN bundle install
RUN chmod a+r -R /var/lib/gems/2.0.0/gems

WORKDIR /
