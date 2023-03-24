#!/usr/bin/env bash

KNIFE_POD=""
findPod() {
    KNIFE_POD=$(kubectl get pods|grep -i Running|grep knife|cut -d\  -f 1)
}
waitForPod() {
    local pod=""
    while [ "$KNIFE_POD." == "." ]; do
        findPod $1
        echo "waiting for busybox pod to be ready..."        
        sleep 1
    done;
    echo "pod $KNIFE_POD ready"
}
waitForPod knife

echo "copy to demo..."
kubectl exec $KNIFE_POD -- rm -rf /srv/demo /srv/public
kubectl cp ./public $KNIFE_POD:/srv/
kubectl exec $KNIFE_POD -- mv /srv/public /srv/demo
