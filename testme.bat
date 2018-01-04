set DM_BASE_URI=http://localhost:8080
set DM_STORE_BASE_URI=http://localhost:8083
set IDAM_USER_BASE_URI=http://localhost:8081
set IDAM_S2S_BASE_URI=http://localhost:8082

docker-compose down
docker-compose -f docker-compose.yml -f docker-compose-test.yml pull
docker-compose -f docker-compose.yml -f docker-compose-test.yml build
docker-compose up -d --build

echo "Waiting 60s for the docker to warm up"
timeout 150
curl -s -H "Content-Type: application/json" -d "{ \"email\":\"test@TEST.COM\", \"forename\":\"test@TEST.COM\",\"surname\":\"test@TEST.COM\",\"password\":\"123\"}" http://localhost:8081/testing-support/accounts
curl -s -X POST -H "Authorization: Basic dGVzdEBURVNULkNPTToxMjM=" http://localhost:8081/oauth2/authorize

curl --retry-connrefused --retry-delay 100 --retry 2 ${DM_STORE_BASE_URI}/health

call "idam.bat"
call "gradlew.bat" clean gatlingRun
REM call "gradlew.bat" clean gatlingRun
#docker-compose -f docker-compose.yml -f docker-compose-test.yml run performance-test

start build/reports/gatling/*/index.html

docker-compose down

