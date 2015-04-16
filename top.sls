base:
    'os:Ubuntu':
        - match: grain
        - desktop
        - spotify
        - chrome
        - docker
        - vagrant-latest
    'os:MacOS':
        - match: grain
        - desktop
file_roots:
    base:
        - .
