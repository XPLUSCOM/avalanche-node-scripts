#!/bin/bash

nodeVersion() {
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "id"     :1,
        "method" :"info.getNodeVersion"
    }' -H 'content-type:application/json;' 127.0.0.1:9650/ext/info | jq
}

nodeIp() {
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "id"     :1,
        "method" :"info.getNodeIP"
    }' -H 'content-type:application/json;' 127.0.0.1:9650/ext/info | jq
}

nodeId() {
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "id"     :1,
        "method" :"info.getNodeID"
    }' -H 'content-type:application/json;' 127.0.0.1:9650/ext/info | jq
}

isBootstrapped() {
    curl -X POST --data '{
            "jsonrpc":"2.0",
            "id"     :1,
            "method" :"info.isBootstrapped",
            "params": {
            "chain":"X"
        }
    }' -H 'content-type:application/json;' 127.0.0.1:9650/ext/info | jq
}

health() {
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "id"     :1,
        "method" :"health.health"
    }' -H 'content-type:application/json;' 127.0.0.1:9650/ext/health | jq
}

case "$1" in
    help)
        echo "
options:
help    Show this description
version Show Node version
nodeId  Get Node ID
nodeIp  Get Node IP
status  Show bootstrap status
health  Show Node health status
        "
        ;;
    version)
        nodeVersion
        ;;
    nodeIp)
        nodeIp
        ;;
    nodeId)
        nodeId
        ;;
    status)
        isBootstrapped
        ;;
    health)
        health
        ;;
    *) echo "Unknown command" ;;
esac
