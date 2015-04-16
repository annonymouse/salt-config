mypkgs:
    pkg.installed:
        - pkgs:
            - vim
            - git
{% if grains['os'] != 'MacOS' %}
# Screen distributed with osx
            - screen
# not in homebrew
            - keepassx
# Doesn't exist in homebrew
            - virtualbox
# Currently not building in homebrew
            - nmap
            - mosh
# Use adium instead
            - pidgin
{% endif %}
{% if grains['os_family'] == 'Debian' %}
            - build-essential
{% endif %}
{% if grains['os'] == 'Ubuntu' %}
            - ubuntu-restricted-extras
            - network-manager-openvpn
            - network-manager-openvpn-gnome
{% endif %}
            - wget
#            - gstreamer1.0*
{% if grains['kernel'] == 'Linux' %}
            - systemtap
            - traceroute
{% endif %}
        - refresh: []
packer:
{% if grains['kernel'] == 'Linux' %}
    archive.extracted:
        - name: /usr/local/sbin/
        - source: https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip
        - source_hash: sha256=8fab291c8cc988bd0004195677924ab6846aee5800b6c8696d71d33456701ef6
        - archive_format: zip
        - if_missing: /usr/local/sbin/packer
{% elif grains['os'] == 'MacOS' %}
    pkg.installed:
        - name: packer
        - taps: homebrew/binary
{% endif %}
set_wireshark_priv:
    pkg.installed:
        - name: wireshark
        - refresh: []
{% if grains['kernel'] == 'Linux' %}
    cmd.run:
        - name: setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap
        - unless: getcap /usr/bin/dumpcap | grep 'cap_net_admin,cap_net_raw+eip'
        - require:
            - pkg: wireshark
{% endif %}
