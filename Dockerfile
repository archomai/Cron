
FROM    ubuntu:17.10
RUN     apt-get -y update
RUN     apt-get -y install cron && \
        apt-get -y install supervisor

COPY    root                    /var/spool/cron/crontabs/
COPY    supervisor-cron.conf    /etc/supervisor/conf.d/
RUN     chmod 600 /var/spool/cron/crontabs/root
RUN     touch /var/log/cron.log
CMD     supervisord -n
