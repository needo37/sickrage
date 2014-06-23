This is a Dockerfile setup for sickrage - https://www.sickrage.tv/forums/

To run:

docker run -d --name="sickrage" -v /path/to/sickrage/data:/config -v /path/to/downloads:/downloads -v /path/to/tv:/tv -v /etc/localtime:/etc/localtime:ro -p 8081:8081 needo/sickrage
