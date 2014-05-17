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

    service elasticsearch start
}

work
