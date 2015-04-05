{% if grains['osarch'] == "amd64" %}
chrome:
    pkg.installed:
        - sources:
            - google-chrome-stable: https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
{% endif %}
