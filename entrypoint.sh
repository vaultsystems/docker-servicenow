#!/bin/bash
cat << EOF > /glide/nodes/sample_16000/conf/glide.db.properties
glide.db.name = sample_16000
glide.db.rdbms = mysql
glide.db.url = jdbc:mysql://$DB_PORT_3306_TCP_ADDR:$DB_PORT_3306_TCP_PORT/
glide.db.user = $DB_ENV_MYSQL_USER
glide.db.password = $DB_ENV_MYSQL_PASSWORD
EOF

cat << EOF > /glide/nodes/sample_16000/conf/glide.properties
# glide.properties (for DB related properties, use glide.db.properties)

glide.proxy.host = $URL
glide.proxy.path = /
glide.servlet.port = 16000
EOF

export JAVA_HOME=/usr
cd /glide/nodes/sample_16000
./startup.sh
exec ./tlog.sh
