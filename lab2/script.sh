docker run -d --rm -p 8080:80 --name web nginx

docker build . -t test
docker run --rm --name my test &

docker stop web
docker stop my