echo "rebuilding and running, check buildlog.log for details"
echo "" > buildlog.log
echo "stopping old container"
docker stop mailpile_con >> buildlog.log
echo "removing old container"
docker rm mailpile_con >> buildlog.log
echo "rebuilding klinisk_api_img"
docker build --rm -t mailpile_img . >> buildlog.log
echo "running mailpile_con as daemon, port 5000 forwarded!!!"
docker run -d --name mailpile_con -v /root/mailpile_data:/mailpile-data/.local/share/Mailpile -p 33411:33411 mailpile_img
echo "finnished"

