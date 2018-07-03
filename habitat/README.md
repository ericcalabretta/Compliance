# Compliance with InSpec as a Habitat package

## Description
The plan treats Compliance as another application you'll manage with Habitat. The plan installs InSpec and will run InSpec with whatever profiles you specify and whatever increment you specify and report the results back to Chef Automate. By default, InSpec will run the linux-baseline & the linux-patch-baseline every hour. 

## Prep 
1. Create an API token for Automate (also already have an Automate instances somewhere)
2. install the linux-baseline & linux-patch-baseline to your Automate Asset Store or whatever profiles you want to use. 

## How to use (commands need approprate privleges -aka sudo): 
Start the Habiat Supervisor in the background if it's not already running. You need to hit 'enter' when it's finished to get a command prompt again.  

1. Override the place holder settings in the default.toml by creating a compliance.toml You must at least overide the URL and Token. You can overide any setting found in the default.toml like interval or profiles

```toml
[reporter]
url = "https://FQDNofAutomate/data-collector/v0"
token = "token"

[compliance]
server = "https://FQDNofAutomate"
token = "token"
```

2. Start the Habitat Supervisor, Apply the compliance.toml you created and start the complinace service 

```bash
# Start the Supervisor if it's not already running
# the & runs in the background - you may need to hit "enter" to get a command prompt again 

hab sup run &
# Apply the configuration from the compliance.toml   
# $(date +%s) just inserts the current time any unique number will work 

hab config apply compliance.default $(date +%s) compliance.toml

# Load the compliance service 
hab svc load eric/compliance

# Check to see the service is loaded
hab svc status 
```

Now you can go to automate and see the node reporting to the Automate Compliance tab. 

You can also view information about your services using the Habitat Supervisor API. I recommend using something the parse the JSON like the JSONView Chrome extension 

```url
FQDNofNode:9631/services/compliance/default
```
