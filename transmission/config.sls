{% from "transmission/map.jinja" import transmission with context %}

include:
  - transmission

transmission_config:
  file.serialize:
    - name: {{ transmission.config }}
    - dataset: {{ transmission.settings|yaml }}
    - formatter: json
    - user: {{ transmission.user }}
    - group: {{ transmission.group }}
    - mode: 600
    - makedirs: True
    - require:
      - pkg: transmission_packages
      - service: transmission_service
    - watch_in:
      - cmd: transmission_service_reload

transmission_download_dir:
  file.directory:
    - name: {{ transmission.settings.get('download-dir') }}
    - user: {{ transmission.user }}
    - group: {{ transmission.group }}
    - mode: 775
    - makedirs: True

transmission_incomplete_dir:
  file.directory:
    - name: {{ transmission.settings.get('incomplete-dir') }}
    - user: {{ transmission.user }}
    - group: {{ transmission.group }}
    - mode: 775
    - makedirs: True
