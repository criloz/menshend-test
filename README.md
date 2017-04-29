Menshend Cli
========

### Global Commands
| Name, shorthand | Description |
| ------ | -----|
| --version, -v | Get binary version |
| --help, -v | Shows a list of commands or help for one command |

##### Usage
```menshend [global-command]```

### Commands

#### <i class="icon-angle-right"/>port-forward

##### Description
```Create secure tunnels, this command is adapted from the chisel project https://github.com/jpillora/chisel```

##### Usage
```menshend port-forward [command options] [arguments...]```

#### Options
| Name, shorthand | Default | Description |
| ------ | ------ | -----|
| --server, -s  |  | Full http(s) url of the service under the Menshend space wanted to be tunneled, ip addresses are not allowed [$PORT_FORWARD_ENDPOINT]|
| --port, -p | | [local-host]:<local-port> |
| --token, -t | | vault token [$VAULT_TOKEN] |
| --keepalive, -k |   | An optional keepalive interval. Since the underlying transport is HTTP, in many instances we'll be traversing through proxies, often these proxies will close idle connections. You mustspecify a time with a unit, for example '30s' or '2m'. Defaultsto '0s' (disabled) (default: 0s) |
| --verbose, -v| | Verbose debug |

##### Examples
 Tunneling a mongo database, locate in some of the laboratories of the example.com organization to the localhost
 >-  make mongo available on localhost:27017
     menshend port-forward   --server https://mongo.ml-lab.example.com  --port 27017
> -  ... mongo ... localhost:3000
     menshend port-forward  --server https://mongo.ml-lab.example.com  --port 3000
> - ... mongo ... 192.168.0.5:3000
     menshend port-forward  --server https://labs.example.com  --port 192.168.0.5:3000

#### <i class="icon-angle-right"/>admin, adminServices

##### Description
```Add/update/delete services```

##### Usage
```menshend admin subcommand [subcommand options] [arguments...]```

#### Subcommands
| Name |  Description |
| ------ | -----|
| get, read  | Return service definition |
| delete, remove, del, eliminate, erase | Delete a service |
| upsert, save, apply, update, put, write, upload, add, replace, create, post | Create or update a service |

#### Subcommand options
| Name, shorthand | Description | Env var |
| ------ | -----| ----- |
| --role, -r | role/namespace/group of services | [$MD_ROLE] |
| --subdomain, -s | service subdomain | |
| --token, -t | vault token | [$VAULT_TOKEN] |
| --filename, -f | Filename, or URL to files that contains the configuration to apply| |
| --output value, -o value| Output format json or yaml | [$MD_OUTPUT] |
|--api, -a |Baseurl of the menshend api | [$MD_ADDRESS] |

#### <i class="icon-angle-right"/> server, run, start

##### Description
```Run menshend server```

##### Usage
```menshend server [command options] [arguments...]```

#### Options
| Name, shorthand | Default | Description | Env var |
| ------ | ------ | -----| -----|
| --port, -p | 8787 | Bind port| |
| --config, -c | | config file | [$MENSHEND_CONFIG_FILE] |
| --address, -a | "0.0.0.0" | Bind address  | |
