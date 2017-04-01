{% from "transmission/map.jinja" import transmission as transmission with context %}

include:
  - transmission.install
  - transmission.config
  - transmission.service
