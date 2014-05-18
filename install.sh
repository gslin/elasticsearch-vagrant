#!/bin/sh

work() {
    wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
    sed -i -e 's@http://archive.ubuntu.com@http://tw.archive.ubuntu.com@' /etc/apt/sources.list

    cat > /etc/apt/sources.list.d/elasticsearch.list <<EOF
deb http://packages.elasticsearch.org/elasticsearch/1.1/debian stable main
EOF

    apt-get update

    DEBIAN_FRONTEND=noninteractive apt-get -y install git vim-nox
    DEBIAN_FRONTEND=noninteractive apt-get -y install default-jre elasticsearch

    update-rc.d elasticsearch defaults 95 1

    /usr/share/elasticsearch/bin/plugin -i elasticsearch/marvel/latest
    /usr/share/elasticsearch/bin/plugin -i elasticsearch/kibana/latest

    # Security issue: http://bouk.co/blog/elasticsearch-rce/
    cat >> /etc/elasticsearch/elasticsearch.yml <<EOF
script.disable_dynamic: true
EOF

    service elasticsearch restart
}

work
