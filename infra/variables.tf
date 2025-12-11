variable "region" {
  type    = string
  default = "us-east-1"
}

variable "container_image" {
  type = string
  description = "Docker image for the SimpleTimeService"
}
