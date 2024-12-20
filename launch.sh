#!/bin/bash

set -eu

collection="ldgourmet"
REPO_URL="https://raw.githubusercontent.com/SearchScale/dataimporthandler/master/repo"

if [ ! -d "mysql/data/${collection}/" ]; then
    make csv
fi

docker-compose up -d
while [ `curl -LI http://localhost:8080/solr -o /dev/null -w '%{http_code}\n' -s` -ne 200 ]; do
    sleep 60 # wait launch services
done

# Install DataImportHandler
if [ `docker-compose exec solr_node1 bin/solr package list-installed | grep data-import-handler | wc -l` -eq 0 ]; then
    echo "[INFO] install data-import-handler"
    docker-compose exec solr_node1 bin/solr package add-repo data-import-handler ${REPO_URL}
    docker-compose exec solr_node1 bin/solr package list-available
    docker-compose exec solr_node1 bin/solr package install data-import-handler
fi

echo "[INFO] upload config to zookeeper"
docker-compose exec solr_node1 server/scripts/cloud-scripts/zkcli.sh -zkhost zookeeper1:2181 -cmd upconfig -confdir /opt/solr/server/solr/configsets/${collection}/conf -confname ${collection}_conf

if [ `curl http://localhost:8080/solr/admin/collections?action=LIST | grep ${collection} | wc -l` -eq 1 ]; then
    echo "[INFO] delete collection"
    curl "http://localhost:8080/solr/admin/collections?action=DELETE&name=${collection}"
fi
echo "[INFO] create collection"
curl "http://localhost:8080/solr/admin/collections?action=CREATE&name=${collection}&collection.configName=${collection}_conf&numShards=1&replicationFactor=1&maxShardsPerNode=1"

if [ `docker-compose exec solr_node1 bin/solr package list-deployed -c ${collection} | grep data-import-handler | wc -l` -eq 0 ]; then
    echo "[INFO] deploy data-import-handler"
    docker-compose exec solr_node1 bin/solr package deploy data-import-handler -y -collections ${collection}
    curl "localhost:8080/solr/admin/collections?action=RELOAD&name=${collection}"
fi

# Full-Import data
sleep 30
echo "[INFO] full import data"
curl "http://localhost:8080/solr/${collection}/dataimport?command=full-import&entity=tutorial"
