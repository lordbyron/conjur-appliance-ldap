# conjur-appliance-ldap

Add ldap authentication to conjur-appliance. Users must already exist in t conjur before you can auth as them.

Build based on conjurinc/conjur-appliance:45
This assumes you can get your own conjur-authn-ldap_0.2.0-6-gdf76418_amd64.deb (or similar). The file in this repo is fake.

To run:

$ docker run -d -p 443:443 -e "LDAP_URI=ldap://example.com" -e "LDAP_BASE=DC=com,DC=example" -e "LDAP_BINDDN=CN=XXXX,DC=com,DC=example" -e 'LDAP_BINDPW=XXXXXXX' 5ecc9fe90152
$ docker exec ... evoke configure master ...
$ conjur init -h conjur-dns ...
$ export CONJUR_AUTHN_URL=https://conjur-dns/api/authn-ldap
$ conjur authn login $USER
