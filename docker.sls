docker:
    cmd.run:
        - name: wget -qO- https://get.docker.com/ | sh
        - unless: docker -v
