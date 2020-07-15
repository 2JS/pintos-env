#!bash
docker run -it --rm -v $PWD:/root/pintos lego3410/pintos:${1:-latest}
