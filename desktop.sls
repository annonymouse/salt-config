mypkgs:
    pkg.installed:
        - pkgs:
            - vim
            - git
            - screen
            - build-essential
            - ubuntu-restricted-extras
            - network-manager-openvpn
            - network-manager-openvpn-gnome
            - traceroute
            - nmap
            - virtualbox
            - pidgin
            - wget
            - gstreamer1.0
        - refresh: []
packer:
    archive.extracted:
        - name: /usr/local/sbin/
        - source: https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip
        - source_hash: sha256=8fab291c8cc988bd0004195677924ab6846aee5800b6c8696d71d33456701ef6
        - archive_format: zip
        - if_missing: /usr/local/sbin/packer
set_wireshark_priv:
    pkg.installed:
        - name: wireshark
        - refresh: []
    cmd.run:
        - name: setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap
        - unless: getcap /usr/bin/dumpcap | grep 'cap_net_admin,cap_net_raw+eip'
        - require:
            - pkg: wireshark
