curl -s -H "Content-Type: application/json" -d "{ \"email\":\"test@TEST.COM\", \"forename\":\"test@TEST.COM\",\"surname\":\"test@TEST.COM\",\"password\":\"123\"}" http://localhost:8081/testing-support/accounts
cls
curl -s -X POST -H "Authorization: Basic dGVzdEBURVNULkNPTToxMjM=" http://localhost:8081/oauth2/authorize
