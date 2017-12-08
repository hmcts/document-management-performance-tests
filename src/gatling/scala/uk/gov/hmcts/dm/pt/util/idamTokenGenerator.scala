package uk.gov.hmcts.dm.pt.util

import java.util.Base64

import io.restassured.RestAssured._

object idamTokenGenerator {

  def generateUserToken() : String = {
    return generateUserToken("test@TEST.COM:123")
  }

  def generateUserToken(userPass : String) : String = {
    val authHeader = "Basic " + new String(Base64.getEncoder.encode(userPass.getBytes()))
    val token : String = given()
      .header("Authorization", authHeader)
      .post(Environments.idamUser)
      .body()
      .path("access-token")

//    println(s"------------------------------------------------------------- $token")

    return s"Bearer $token"
  }

  def generateS2SToken() : String = {

    val serviceToken = given()
      .post(Environments.idamS2S)
      .asString()

    //    var serviceToken: ServiceTokenGenerator = new CachedServiceTokenGenerator(new HttpComponentsBasedServiceTokenGenerator(HttpClients.createDefault(), DevEnvironment.localIdamS2S, "emGw", new GoogleTotpAuthenticator(), "JBVJJC4EL23MGS6D"), 3600)
    //    var serviceToken: ServiceTokenGenerator = new CachedServiceTokenGenerator(new HttpComponentsBasedServiceTokenGenerator(HttpClients.createDefault(), DevEnvironment.localIdamS2S, "sscs", new GoogleTotpAuthenticator(), "AAAAAAAAAAAAAAAA"), 3600)

//    println(" ----------------------------------------- "+ serviceToken)

    serviceToken
  }

}
