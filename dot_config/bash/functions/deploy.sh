function deployProductive() {
  local SERVER=$WORK_SERVER
  local USER=jetty

  rsync -avP $WORK_SHOP_JAR_LOCAL $SERVER:./
  rsync -avP $WORK_ADMIN_JAR_LOCAL $SERVER:./
  ssh $SERVER "sudo service admin stop"
  ssh $SERVER "sudo service shop stop"
  ssh $SERVER "sudo cp ./shop.jar $WORK_SHOP_JAR_REMOTE"
  ssh $SERVER "sudo cp ./admin.jar $WORK_ADMIN_JAR_REMOTE"
  ssh $SERVER "sudo chown -R $USER:$USER /var/lib/nrs"
  ssh $SERVER "sudo service admin start"
  ssh $SERVER "sudo service shop start"
}

function deployProductiveAdmin() {
  local SERVER=$WORK_SERVER
  local USER=jetty

  rsync -avP $WORK_ADMIN_JAR_LOCAL $SERVER:./
  ssh $SERVER "sudo service admin stop"
  ssh $SERVER "sudo cp ./admin.jar $WORK_ADMIN_JAR_REMOTE"
  ssh $SERVER "sudo chown -R $USER:$USER /var/lib/nrs"
  ssh $SERVER "sudo service admin start"
}
