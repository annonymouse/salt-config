spotify-server:
    cmd.run:
        - name: echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list
        - creates: /etc/apt/sources.list.d/spotify.list
        - require_in:
            - pkg: spotify-client
spotify:
    cmd.run:
        - name: sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
        - unless: apt-key list | grep -I spotify
        - require_in:
            - pkg: spotify-client
    pkg.installed:
        - name: spotify-client
        - refresh: []

