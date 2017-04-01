{% from "transmission/map.jinja" import transmission with context %}

transmission_packages:
  pkg.installed:
    - pkgs: {{ transmission.packages }}