# dreamhost-dns-updater

Make sure that the following values are in your containers environment:

1. `DREAMHOST_API_KEY`
2. `DOMAIN_NAMES`

For DOMAIN_NAMES they should be separated by a `colon`

Example for `DOMAIN_NAMES` would be

`DOMAIN_NAMES=test.example.com:subdomain.example.com:example.com`

Note: This is designed to update the DNS to be your public IP from whever this is run ... such as in a homelab for instance :) 

References:
```
https://help.dreamhost.com/hc/en-us/articles/216944818-API-Apps
https://github.com/gsiametis/dreampy_dns/
```
