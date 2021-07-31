# Introduction
Roon Server in a self contained Ubuntu run time.

## Getting Started
1. Clone this repository to your preferred Roon folder: (e.g. /opt/roon)

```bash
export ROON_HOME=/opt/roon
git clone https://github.com/Ez2Raven/roonserver.git $ROON_HOME
```

2. Within docker-compose.yaml, modify the timezone for your region
```yaml
environment:
      - TZ="Asia/Singapore"
```

3. Start Roon Server using docker-compose
```bash
docker-compose up
```

## Updating Roon Server
TBD

## Credits
Thanks to content on https://community.roonlabs.com/t/docker-images-for-roon/13040/66

* [Steef de Bruijn](https://community.roonlabs.com/u/Steef_de_Bruijn)
* [Herwarth_Heitmann](https://community.roonlabs.com/u/Herwarth_Heitmann)