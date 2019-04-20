FROM docker.elastic.co/beats/metricbeat:7.0.0

# The file to monitor the host is different from the file to monitor docker services.ADD
# So we pass the filename at build time to choose the target (host or services) of the image built.
ARG METRICBEAT_FILE
COPY ${METRICBEAT_FILE} /usr/share/metricbeat/metricbeat.yml


USER root

ARG ELK_HOST
ARG STAT_IP
RUN sed -i -e "s/ELK_HOST/${ELK_HOST}/g" -e "s/STAT_IP/${STAT_IP}/g" /usr/share/metricbeat/metricbeat.yml
RUN yum -y install nc

RUN mkdir /var/log/metricbeat \
    && chown metricbeat /usr/share/metricbeat/metricbeat.yml \
    && chmod go-w /usr/share/metricbeat/metricbeat.yml \
    && chown metricbeat /var/log/metricbeat

USER metricbeat
