#!/bin/sh
export DM_BASE_URI=http://localhost:8080
export IDAM_USER_BASE_URI=http://localhost:8081
export IDAM_S2S_BASE_URI=http://localhost:8082

docker-compose down
docker-compose -f docker-compose.yml -f docker-compose-test.yml pull
docker-compose -f docker-compose.yml -f docker-compose-test.yml build
docker-compose up -d --build

echo "Waiting 60s for the docker to warm up" && sleep 60s
./idam.sh
./gradlew clean gatlingRun
#docker-compose -f docker-compose.yml -f docker-compose-test.yml run performance-test

sensible-browser build/reports/gatling/*/index.html
xdg-open build/reports/gatling/*/index.html
open build/reports/gatling/*/index.html

docker-compose down




