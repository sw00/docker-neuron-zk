FROM nixos/nix

RUN nix-env -iA cachix -f https://cachix.org/api/v1/install
RUN cachix use srid

RUN nix-env -if https://github.com/srid/neuron/archive/master.tar.gz

VOLUME /data
ADD entrypoint.sh .
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
