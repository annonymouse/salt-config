{% if grains['os'] == 'Ubuntu' %}
mypkgs:
    pkg.installed:
         - refresh: []
         - pkgs:
           - vim
           - git
           - screen
           - build-essential 
{% endif %}
