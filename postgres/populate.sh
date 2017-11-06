#!/bin/bash

curl -L -O http://cl.ly/173L141n3402/download/example.dump
createdb pgguide -U postgres
pg_restore --no-owner --dbname pgguide example.dump -U postgres