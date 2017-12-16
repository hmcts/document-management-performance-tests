package uk.gov.hmcts.dm.pt.util

object Environments {

  val dmApiGw : String = scala.util.Properties.envOrElse("DM_GW_BASE_URI","localhost:8080")
  val dmStoreApp : String = scala.util.Properties.envOrElse("DM_STORE_BASE_URI","localhost:8083")
  val idamUser : String = scala.util.Properties.envOrElse("IDAM_USER_BASE_URI","localhost:8081") + "/oauth2/authorize"
  val idamS2S : String = scala.util.Properties.envOrElse("IDAM_S2S_BASE_URI","localhost:8082") + "/testing-support/lease"


  val users: String = scala.util.Properties.envOrElse("NUMBER_OF_USERS", "500")
  val maxResponseTime: String = scala.util.Properties.envOrElse("MAX_RES_TIME", "3000000") // in milliseconds
}
