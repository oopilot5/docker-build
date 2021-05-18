

echo 'yes' | sh test.sh

## ubuntu 16.04 dev
docker pull ubuntu:16.04

docker build -t ubuntu16.04:dev .
docker run --name u16 -d --privileged -v `pwd`:/home/test -p 122:22 ubuntu16.04:dev

## ubuntu 18.04 dev
docker pull ubuntu:18.04

docker build -t ubuntu18.04:dev .
docker run --name u18 -d --privileged -v `pwd`:/home/test -p 222:22 ubuntu18.04:dev

"""
打包 ubuntu18.04_dev.tar 1.43G
加载后 1.5G

docker save ubuntu18.04-zh:dev > ubuntu18.04-zh_dev.tar 1.47G
加载后 1.54G

zxivs-vap-sipas-devel_latest.tar 6.35G 基于 ubuntu16.04-dev
"""