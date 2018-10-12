{% from "transmission/map.jinja" import transmission with context %}

include:
  - transmission.install

transmission_service:
  service.running:
    - name: {{ transmission.service }}
    - enable: True
    - require:
      - sls: transmission.install

transmission_service_reload:
  cmd.wait:
    - name: invoke-rc.d transmission-daemon reload
