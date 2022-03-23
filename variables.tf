variable "dbname" {
  type = string
  description = "Cosmos DB name"
}

variable "res_group" {
  type = map
  default = {
    "name" = "subscribe-cosmos-test"
    "location" = "EAST US 2"
  }
}