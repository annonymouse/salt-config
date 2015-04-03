{% if grains['os'] == 'Ubuntu' %}
    mypkgs:
        pkg.installed:
            - refresh: []
            - pkgs:
                - vim
                - git
                - screen
                - build-essential
                - ubuntu-restricted-extras
                - network-manager-openvpn
{% endif %}
