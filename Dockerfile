FROM busybox

COPY . /etc/grafana/provisioning

CMD ["tail","-f","/etc/grafana/provisioning/datasources/prometheus.yml"]
