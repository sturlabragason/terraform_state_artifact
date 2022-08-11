terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

resource "random_id" "random" {
  keepers = {
   random_id = "${var.run_id}"
  }
  byte_length = 8
}

variable "run_id" {
  type = string
}