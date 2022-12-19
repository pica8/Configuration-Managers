# Salt modules

## top.sls
It is main file. It enables salt modules for nodes.
For example, it enables pica8_config salt module for sanfansico-113 and sanfansico-114 nodes
```yaml
base:
    'sanfansico-113':
        - pica8_config
    'sanfansico-114':
        - pica8_config
```
You can use '\*' in name of servers:

```yaml
base:
    'sanfansico-*':
        - pica8_config
```

## pica8_config
The salt module uploads pica config:
```yaml
config:
  file.managed:
    - name: /pica/config/salt_pica.conf
    - source: salt://pica8_config/files/{{ grains['localhost'] }}_pica.conf
```
```yaml {{ grains['localhost'] }}``` equals hostname of minion server. For example, it equals sanfansico-113 for sanfansico-113 server. The block uploads config ./files/sanfansico-113 to /pica/config/salt_pica.conf on sanfansico-113 server.

Afterwards salt applies the config:
```yaml
  cmd.run:
    - name: |
        /pica/bin/cli -c "configure;load override /pica/config/salt_pica.conf"
    - cwd: /
    - watch:
      - file: /pica/config/salt_pica.conf
```
