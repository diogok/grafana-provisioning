# Grafana provisioning

My common grafana setup

## Features

Datasources:

- Prometheus (default)

Dashboards:

- Node Exporter
- Elasticsearch


## Usage

They all will require the Prometheus environment variables, as such:

```
PROMETHEUS_HOST=localhost
PROMETHEUS_PORT=9090
```

### Docker volumes from

You can run in docker, to provision:

```
docker run --name grafana-provisioning --volume /etc/grafana/provisioning diogok/grafana-provisio
docker run --name grafana -p 3000:3000 --volumes_from grafana-provisioning grafana/grafana:6.2.1
```

### Docker compose

```
version: "2"
services:
 prometheus:
    image: prom/prometheus:v2.8.1
    ports:
      - 9090:9090
  grafana-provision:
    image: diogok/grafana-provisioning:v0.0.1
    volumes:
      - /etc/grafana/provisioning
  grafana:
    image: "grafana/grafana:6.2.1"
    volumes_from:
      - grafana-provision
    environment:
      PROMETHEUS_HOST: prometheus
      PROMETHEUS_PORT: 9090
    ports:
      - 3000:3000
```

### Download artifacts

You can download a [release](https://github.com/diogok/grafana-provisioning/releases) and expando into your grafana `/etc/grafana/provisioning` folder.

## License

MIT
