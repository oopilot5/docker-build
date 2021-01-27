

echo 'yes' | sh test.sh

## ubuntu 16.04 dev
docker pull ubuntu:16.04

docker build -t ubuntu16.04:dev .
docker run --name u16 -d --privileged -v `pwd`:/home/test -p 122:22 ubuntu16.04:dev

## ubuntu 18.04 dev
docker pull ubuntu:18.04

docker build -t ubuntu18.04:dev .
docker run --name u18 -d --privileged -v `pwd`:/home/test -p 222:22 ubuntu18.04:dev
