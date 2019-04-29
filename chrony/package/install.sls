# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import chrony with context %}

chrony-package-install-pkg-installed:
  pkg.installed:
    - name: {{ chrony.package }}
