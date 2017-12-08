FROM maven:3.3-jdk-8

RUN mkdir /tests
COPY . /tests

ENTRYPOINT echo "EM_BASE_URI=$EM_BASE_URI\nIDAM_USER_BASE_URI=$IDAM_USER_BASE_URI\nIDAM_BASE_URI=$IDAM_BASE_URI\n" && wget --retry-connrefused --tries=120 --waitretry=1  -O /dev/null http://document-management-store:8080/health && cd /tests && mvn clean scala:testCompile gatling:execute -DdmApiGw=$EM_BASE_URI -DidamUser=$IDAM_USER_BASE_URI -DidamS2S=$IDAM_S2S_BASE_URI
