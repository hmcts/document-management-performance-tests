FROM java:8-jdk

RUN mkdir -p tests
COPY . tests

ENTRYPOINT echo "GRADLE VAR = $GRADLE_OPTS \n" && wget --retry-connrefused --tries=120 --waitretry=1 -O /dev/null http://document-management-store:8080/health && cd tests && ./gradlew $GRADLE_OPTS clean gatlingRun --info;
