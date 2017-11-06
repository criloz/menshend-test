#!/bin/bash

export VAULT_TOKEN=myroot
export VAULT_ADDR=http://127.0.0.1:8200

vault mount database

vault write database/config/pgdev \
    plugin_name=postgresql-database-plugin \
    connection_url="postgresql://postgres:postgres@postgres_dev:5432/pgguide?sslmode=disable" \
    allowed_roles="pg_dev_full_access"

vault write database/roles/pg_dev_full_access \
    db_name=pgdev \
    creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; \
     grant all privileges on SCHEMA public TO \"{{name}}\";" \
    default_ttl="24h" \
    max_ttl="48h"

vault write database/config/pgprod \
    plugin_name=postgresql-database-plugin \
    connection_url="postgresql://postgres:postgres@postgres_prod:5432/pgguide?sslmode=disable" \
    allowed_roles="pg_prod_full_access,pg_prod_onlyread"

vault write database/roles/pg_prod_full_access \
    db_name=pgprod \
    creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; \
     grant all privileges on SCHEMA public TO \"{{name}}\";" \
    default_ttl="1h" \
    max_ttl="2h"

vault write database/roles/pg_prod_onlyread \
    db_name=pgprod \
    creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; \
    GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";" \
    default_ttl="5h" \
    max_ttl="10h"

menshend admin add -f sampleServices/elasticsearch.yml
menshend admin add -f sampleServices/kibana.yml
menshend admin add -f sampleServices/mongo.yml
menshend admin add -f sampleServices/pg-dev.yml
menshend admin add -f sampleServices/pg-prod.yml
menshend admin add -f sampleServices/portainer.yml