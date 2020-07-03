FROM debian:buster-slim
RUN apt-get update; apt-get install -y mariadb-client; apt-get clean
ENV DBHOST=db
ENV DBLOGIN=root
ENV DBPORT=3306
ENV DBPASS=""
ENV CRONH=2
ENV CRONM=0
VOLUME /backup
ADD backup_host.sh /
COPY ./entrypoint.sh /
COPY ./go-crond /usr/bin/go-crond
RUN chmod a+x /entrypoint.sh /usr/bin/go-crond /backup_host.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["go-crond", "/crontab"]

