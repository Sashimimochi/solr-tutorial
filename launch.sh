#!/bin/bash

set -eu

if [ ! -d "mysql/data/ldgourmet/" ]; then
    make csv
fi

docker-compose up -d
while [ `curl -LI http://localhost:8080/solr -o /dev/null -w '%{http_code}\n' -s` -ne 200 ]; do
    sleep 60 # wait launch services
done

# Install DataImportHandler
# [WARNING] DIH for Solr9 is not released Officially, so use personaly maked.
# https://github.com/rohitbemax/dataimporthandler/pull/33
REPO_URL="https://raw.githubusercontent.com/nightvixen/dataimporthandler/branch_9x/repo"
docker-compose exec solr_node1 bin/solr package add-repo data-import-handler ${REPO_URL}
docker-compose exec solr_node1 bin/solr package list-available
docker-compose exec solr_node1 bin/solr package install data-import-handler
docker-compose exec solr_node1 server/scripts/cloud-scripts/zkcli.sh -zkhost zookeeper1:2181 -cmd upconfig -confdir /opt/solr/server/solr/configsets/ldgourmet/conf -confname ldgourmet_conf
curl "http://localhost:8080/solr/admin/collections?action=CREATE&name=ldgourmet&collection.configName=ldgourmet_conf&numShards=1&replicationFactor=1&maxShardsPerNode=1"
docker-compose exec solr_node1 bin/solr package deploy data-import-handler -y -collections ldgourmet
curl "localhost:8080/solr/admin/collections?action=RELOAD&name=ldgourmet"

# Full-Import data
sleep 30
curl "http://localhost:8080/solr/ldgourmet/dataimport?command=full-import&entity=tutorial"
