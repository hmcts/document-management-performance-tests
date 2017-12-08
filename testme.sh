#!/bin/sh
#local mode
export EM_BASE_URI=http://localhost:8080
export IDAM_USER_BASE_URI=http://localhost:8081
export IDAM_S2S_BASE_URI=http://localhost:8082

#docker mode
export EM_BASE_URI=http://em-api-gateway-web:8080
export IDAM_USER_BASE_URI=http://idam-api:8080
export IDAM_S2S_BASE_URI=http://service-auth-provider-api:8080

docker-compose down
docker-compose -f docker-compose.yml -f docker-compose-test.yml pull
docker-compose -f docker-compose.yml -f docker-compose-test.yml build
docker-compose up -d --build
#wget --retry-connrefused --tries=120 --waitretry=1 -O /dev/null http://localhost:8080/health
echo "Waiting 30s for the docker to warm up" && sleep 30s
./idam.sh
#mvn clean scala:testCompile gatling:execute -DdmApiGw=$EM_BASE_URI -DidamUser=$IDAM_USER_BASE_URI -DidamS2S=$IDAM_S2S_BASE_URI
docker-compose -f docker-compose.yml -f docker-compose-test.yml run -e EM_BASE_URI -e IDAM_USER_BASE_URI -e IDAM_S2S_BASE_URI performance-test

sensible-browser target/gatling/results/*/index.html
xdg-open target/gatling/results/*/index.html
open target/gatling/results/*/index.html
docker-compose down
