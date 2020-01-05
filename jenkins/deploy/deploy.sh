#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /opt/prod /tmp/.auth prod-user@192.168.1.119:/tmp/.auth
scp -i /opt/prod ./jenkins/deploy/publish.sh prod-user@prod.machine:/tmp/publish.sh
ssh -i /opt/prod prod-user@prod.machine "/tmp/publish.sh"
