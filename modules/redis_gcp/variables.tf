# Redis GCP module variables (INPUTS)
variable "size" {
  type        = number
  description = "Size, recommended for the start is 1Gb"
}

variable "name" {
  type        = string
  description = "Name (prefix)"
}

variable "network" {
  type        = string
  description = "Authorized network to use"
}
