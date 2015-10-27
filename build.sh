echo "rebuilding and running, check buildlog.log for details"
echo "" > buildlog.log
echo "stopping old container"
docker stop mailpile_con >> buildlog.log
echo "removing old container"
docker rm mailpile_con >> buildlog.log
echo "rebuilding mailpile_img"
docker build --rm -t mailpile_img . >> buildlog.log
echo "running mailpile_con as daemon, port 39411 forwarded!!!"
docker run -d --name mailpile_con -v /var/mailpile:/var/mailpile -p 33411:33411 mailpile_img
echo "finnished"

