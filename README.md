# Introduction
Roon Server in a self contained Ubuntu run time.

## Getting Started
1. Pull docker image to your host machine.
```bash
docker pull ez2raven/roon-server:latest
```
2. Create the necessary folders for Roon

```bash
# I prefer to store my apps in a /opt
EXPORT $ROON_HOME=/opt/roon

mkdir -p \ 
$ROON_HOME/data \ 
$ROON_HOME/music \
$ROON_HOME/app \
$ROON_HOME/backup:/backup \
$ROON_HOME/asound.state:/var/lib/alsa/asound.state 
```
3. Download docker-compose.yaml into your host's Roon Folder
```bash
cd $ROON_HOME

git clone https://github.com/Ez2Raven/roonserver.git
docker-compose up
```

4. Within docker-compose.yaml, modify the timezone for your region
```yaml
environment:
      - TZ="Asia/Singapore"
```

5. Start Roon Server
```bash
docker-compose up
```

## Updating Roon Server
1. Stop the Roon Server

```bash
docker-compose stop roon-server
```

2. Remove the Roon Server Directory
```bash
rm -r $ROON_HOME/app/RoonServer
```

3. Restarting Roon Server Container will download the latest tar
```bash
docker-compose up
```

## Customization
Here's some of the changes, you may consider for your specific needs 

### Music Playback
Since I'm running a headless Roon Server, there's no need to map audio devices to the container.
You may map them in docker-compose.yaml if required.
```yaml
version: "3.8"
services:
  roon-server:
    # ... omitted for brevity
    devices:
      - /dev/snd/<Your Sound Device 1>
      - /dev/snd/<Your Sound Device 2>
```

## Credits
Thanks to content on https://community.roonlabs.com/t/docker-images-for-roon/13040/66

* [Steef de Bruijn](https://community.roonlabs.com/u/Steef_de_Bruijn)
* [Herwarth_Heitmann](https://community.roonlabs.com/u/Herwarth_Heitmann)