function startNrsEnv() {
   docker start nrs-env-db-1
   docker start nrs-env-elasticsearch-1
   docker start nrs-env-kibana-1
   docker start nrs-env-smtp4dev-1
}

function stopNrsEnv() {
   docker stop nrs-env-db-1
   docker stop nrs-env-elasticsearch-1
   docker stop nrs-env-kibana-1
   docker stop nrs-env-smtp4dev-1
}
