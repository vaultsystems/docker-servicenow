Place the servicenow application zip file here, e.g.

    glide-helsinki-03-16-2016__patch0-hotfix1-05-16-2016_05-16-2016_1044.zip

To build:

    docker build -t servicenow .
    
Before running it, you can create a mySQL container (not explained here) and link it to ServiceNow

    docker run -d --security-opt seccomp:unconfined --name servicenow -p 1600:16000 --link servicenow-db:db servicenow
