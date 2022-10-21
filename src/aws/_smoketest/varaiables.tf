variable "aws_access_key" {
  description = "The aws_access_key of the _instance"
  type        = string
}
variable "aws_secret_key" {
  description = "The aws_secret_key of the _instance"
  type        = string
}
variable "container_name" {
  description = "The name of the _instance"
  type        = string
  default     = ""
}
variable "location" {
  description = "The location of the _instance"
  type        = string
  default     = "eastus"
}
variable "region" {
  description = "The name of the _instance"
  type        = string
  default     = "us-east-1"
}
variable "storageaccount_name" {
  description = "The name of the _instance"
  type        = string
  default     = ""
}
variable "subscription_id" {
  description = "The subscription_id of the _instance"
  type        = string
  default     = ""
}