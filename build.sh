echo "rebuilding and running, check buildlog.log for details"

echo "removing all untagged docker images"
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
echo "" > buildlog.log
echo "stopping old container"
docker stop mailpile_con >> buildlog.log
echo "removing old container"
docker rm mailpile_con >> buildlog.log
echo "rebuilding mailpile_img"
docker build --rm -t mailpile_img . >> buildlog.log
echo "running mailpile_con as daemon, port 80 forwarded!!!"
docker run -d --name mailpile_con -v /var/mailpile:/root/.local/share/Mailpile -p 80:33411 mailpile_img
echo "finnished"
