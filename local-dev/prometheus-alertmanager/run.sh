#!/usr/bin/env bash

docker rm $(docker ps -aq --filter name=alertmanager)

docker run \
    --name="alertmanager" \
    --read-only \
    -p 9093:9093 \
    --expose 9093 \
    -v alertmanager_data:/alertmanager:rw \
    -v alertmanager.yml:/etc/alertmanager/:ro \
    quay.io/prometheus/alertmanager
    --config.file=/etc/alertmanager/alertmanager.yml \
    --storage.path=/alertmanager \
    --mesh.listen-address="" \
    --web.external-url=https://your.domain.tld/alertmanager
