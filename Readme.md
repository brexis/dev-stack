## Requirements
See [Requirements](Requirements) file.

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

## Setup environments
```
stack setup
```

## Confifures
```
stack configure
```
