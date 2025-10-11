function mysqlLocal() {
  local LOCAL_MYSQL_USER=$(secret-tool lookup local_mysql user)
  local LOCAL_MYSQL_PASSWORD=$(secret-tool lookup local_mysql password)

  mariadb --skip-ssl -h${LOCAL_MYSQL_HOST} -u${LOCAL_MYSQL_USER} -p${LOCAL_MYSQL_PASSWORD} ${LOCAL_MYSQL_DB}
}

function mysqlProductive() {
  local WORK_MYSQL_USER=$(secret-tool lookup work_mysql user)
  local WORK_MYSQL_PASSWORD=$(secret-tool lookup work_mysql password)
  
  ssh ${WORK_MYSQL_RELAY} -f -L3307:${WORK_MYSQL_HOST}:3306 sleep 5;  mariadb --skip-ssl -h127.0.0.1 -P3307 -u${WORK_MYSQL_USER} -p${WORK_MYSQL_PASSWORD} ${WORK_MYSQL_DB}
}
