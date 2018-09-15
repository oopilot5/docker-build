

echo 'yes' | sh test.sh

docker pull ubuntu:16.04

docker build -t test .
docker run --name x11 -d --privileged -v `pwd`:/home/test -p 122:22 test
