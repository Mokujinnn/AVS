docker run -it -d --rm --name test-iso alpine sh

docker exec -it test-iso ps aux
docker exec test-iso echo -e "\n\n"
docker exec -it test-iso ipcs -s
docker exec test-iso echo -e "\n\n"
docker exec -it test-iso ip addr
docker exec test-iso echo -e "\n\n"
docker exec -it test-iso id
docker exec test-iso echo -e "\n\n"
docker exec -it test-iso mount
docker exec test-iso echo -e "\n\n"
docker exec -it test-iso hostname

docker stop test-iso

ps aux
echo "\n\n"
ipcs -s
echo "\n\n"
ip addr
echo "\n\n"
id
echo "\n\n"
mount
echo "\n\n"
hostname