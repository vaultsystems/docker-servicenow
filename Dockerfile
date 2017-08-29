FROM centos:6
LABEL maintainer="christoph.dwertmann@vaultsystems.com.au"
COPY glide-*.zip /opt
RUN useradd servicenow && yum install -y java-1.8.0-openjdk-devel glibc.i686 && \
java -jar /opt/*.zip --dst-dir /glide/nodes/sample_16000 install -n sample -p 16000 && \
chown -R servicenow:servicenow /glide/nodes/sample_16000 && yum clean all && rm /opt/*.zip
COPY entrypoint.sh /
CMD /entrypoint.sh
