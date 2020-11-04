# kibana
docker run --name kibana -e ELASTICSEARCH_HOSTS=http://192.168.0.82:9200 -e I18N_LOCALE=zh-CN -p 5601:5601 docker.elastic.co/kibana/kibana:6.8.12
