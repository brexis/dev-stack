## Requirements
See [Requirements](Requirements.md) file.

## Intallation
With Curl
```
curl -o- https://raw.githubusercontent.com/brexis/dev-stack/master/install.sh | bash
```

Or Wget

```
wget -qO- https://raw.githubusercontent.com/brexis/dev-stack/master/install.sh | bash
```

## Setting up
Add this to your `.bashrc`
```
export STACK_HOME=$HOME/.stack
export PATH=$STACK_HOME/bin:$PATH
```

## Configuration
Update the settings file
```
nano ~/.stack/config/settings.yml
```

## Setup environment
```
stack setup
```

## Configuration
```
stack configure
```

## Services
### Elasticsearch
```
sudo service elasticsearch start
sudo service elasticsearch stop
```

### Minio
```
sudo service minio start
sudo service minio stop
```

### Mailhog
```
sudo service mailhog start
sudo service mailhog stop
```

### Chrome remote desktop

* Get an auth code by going to https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/chromoting%20https://www.googleapis.com/auth/googletalk%20https://www.googleapis.com/auth/userinfo.email&redirect_uri=https://talkgadget.google.com/talkgadget/blank&response_type=code&client_id=440925447803-avn2sj1kc099s0r7v62je5s339mu0am1.apps.googleusercontent.com&access_type=offline&approval_prompt=force (note the client ID is from chromium) and once allowed (on the blank page), the authorization will be the code= parameter of the URL.
* On the headless machine run:

$ /opt/google/chrome-remote-desktop/start-host --code="MY_AUTH_CODE" \
    --redirect-url=https://talkgadget.google.com/talkgadget/blank \
    --name="MY_REMOTE_NAME"
* Pick a PIN and use it to connect later.

### Install Mate
[https://jerrygamblin.com/2016/10/19/ubuntu-remote-desktop-on-digital-ocean/](https://jerrygamblin.com/2016/10/19/ubuntu-remote-desktop-on-digital-ocean/)

```
sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt-get install --no-install-recommends ubuntu-mate-core ubuntu-mate-desktop -y
sudo apt-get install mate-core mate-desktop-environment mate-notification-daemon -y

echo mate-session> ~/.xsession
sudo cp ~/.xsession /etc/skel
```

### Add aliases

Update the aliases file at `$HOME/.stack/config/aliases`. Add yur aliases and run:

```
stack configure
```
