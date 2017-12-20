
set DM_GW_BASE_URI=http://localhost:8080
set DM_STORE_BASE_URI=http://localhost:8083
set IDAM_USER_BASE_URI=http://localhost:8081
set IDAM_S2S_BASE_URI=http://localhost:8082
REM set GRADLE_OPTS="" #jenkins var we need

docker-compose down
docker-compose -f docker-compose.yml -f docker-compose-test.yml pull
docker-compose -f docker-compose.yml -f docker-compose-test.yml build
docker-compose up -d --build

echo "Waiting for the docker to warm up"
REM timeout 130
curl --retry-connrefused --retry-delay 140 --retry 1 ${DM_STORE_BASE_URI}/health

idam.bat
gradlew.bat clean test --info
REM docker-compose -f docker-compose.yml -f docker-compose-test.yml run -e GRADLE_OPTS document-management-store-integration-tests

start build/reports/tests/test/index.html



docker-compose down
