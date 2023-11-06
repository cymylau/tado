terraform {
  required_providers {
    tado = {
      source  = "gonzolino/tado"
      version = "1.0.6"
    }
  }
}

variable "tado_password" {
  type        = string
}

variable "tado_username" {
  type        = string
}


provider "tado" {
  username = "${var.tado_username}"
  password = "${var.tado_password}"
}


resource "tado_heating_schedule" "kitchen" {
  home_name = "My Home"
  zone_name = "Kitchen"

  mon_sun = [
    { heating = false, start = "00:00", end = "06:00" },
    { heating = true, temperature = 20.0, start = "06:00", end = "21:00" },
    { heating = false, start = "21:00", end = "00:00" },
  ]
}

