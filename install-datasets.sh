echo "Checking Elasticsearch Status..."
until curl -s elasticsearch:9200
do
  sleep 1
done

echo "Checking Elasticsearch Cluster State..."
until curl -s elasticsearch:9200/_cluster/health | jq -e '.status == "green"'
do
  sleep 1
done

evtx2es --host elasticsearch --port 9200 --index winlogbeat-evtx EVTX-ATTACK-SAMPLES
