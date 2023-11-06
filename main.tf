terraform {
  required_providers {
    tado = {
      source  = "gonzolino/tado"
      version = "1.0.6"
    }
  }
}

variable "TADO_PASSWORD" {
  type        = string
  default    = "fake"
}

variable "TADO_USERNAME" {
  type        = string
  default     = "fake"
}


provider "tado" {
  username = "${var.TADO_PASSWORD}"
  password = "${var.TADO_USERNAME}"
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

