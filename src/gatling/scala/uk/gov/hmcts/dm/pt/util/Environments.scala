package uk.gov.hmcts.dm.pt.util

object Environments {

  val defaultDmApiGw : String = "localhost:8080"
  val defaultIdamUser : String = "localhost:8081"
  val defaultIdamS2S : String = "localhost:8082"

  val dmApiGw : String = System.getProperty("dmApiGw",defaultDmApiGw)
  val idamUser : String = System.getProperty("idamUser",defaultIdamUser) + "/oauth2/authorize"
  val idamS2S : String = System.getProperty("idamS2S",defaultIdamS2S) + "/testing-support/lease"


  val users: String = scala.util.Properties.envOrElse("numberOfUsers", "500")
  val maxResponseTime: String = scala.util.Properties.envOrElse("maxResponseTime", "3000000") // in milliseconds
}
