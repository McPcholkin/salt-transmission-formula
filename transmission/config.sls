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
      - service: transmission_service
    - watch_in:
      - cmd: transmission_service_reload
