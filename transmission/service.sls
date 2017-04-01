{% from "transmission/map.jinja" import transmission with context %}

include:
  - transmission.install

transmission_service:
  service.running:
    - name: {{ transmission.service }}
    - enable: True
    - require:
      - sls: transmission.install

# The following states are inert by default and can be used by other states to
# trigger a restart or reload as needed.
transmission_service_stop:
  module.wait:
    - name: service.stop
    - m_name: {{ transmission.service }}

transmission_service_start:
  module.wait:
    - name: service.start
    - m_name: {{ transmission.service }}

transmission_service_reload:
  module.wait:
    - name: service.reload
    - m_name: {{ transmission.service }}

transmission_service_restart:
  module.wait:
    - name: service.restart
    - m_name: {{ transmission.service }}
