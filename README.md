Place the servicenow application zip file here, e.g.
    glide-helsinki-03-16-2016__patch0-hotfix1-05-16-2016_05-16-2016_1044.zip

Then run
    docker build -t servicenow .
    docker run -d --name sn -p 80:16000 --link db:db --security-opt seccomp:unconfined servicenow

docker run --name servicenow-db -d -v /tmp/mysql:/glide/mysql/data -e MYSQL_USER=servicenow -e MYSQL_PASSWORD=abcdef servicenow-db
docker run -d --security-opt seccomp:unconfined --name servicenow -p 1600:16000 --link servicenow-db:db servicenow
