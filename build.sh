echo "rebuilding and running, check buildlog.log for details"
echo "" > buildlog.log
echo "stopping old container"
docker stop mailpile_con >> buildlog.log
echo "removing old container"
docker rm mailpile_con >> buildlog.log
echo "rebuilding klinisk_api_img"
docker build --rm -t mailpile_img . >> buildlog.log
echo "running klinisk_api_con as daemon, port 5000 forwarded!!!"
docker run -d -p 5000:5000 --name klinisk_api_con klinisk_api_img >> buildlog.log
echo "finnished"
docker run -d --name mailpile_con -p 33411:33411 mailpile_test_img

