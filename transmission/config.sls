{% from "transmission/map.jinja" import transmission with context %}
{% import_json "transmission/defaults.json" as defaults %}

{% set config = salt['pillar.get']('transmission:settings', defaults, merge=True) %}

include:
  - transmission

transmission_config:
  file.serialize:
    - name: {{ transmission.config }}
    - dataset: {{ config|yaml }}
    - formatter: JSON
    - require:
      - pkg: transmission_packages
      - module: transmission_service_stop
    - watch_in:
      - module: transmission_service_start
