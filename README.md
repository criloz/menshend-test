Menshend Cli
========

## How to run this example

You need to set your env var `VAULT_TOKEN` with the respective vault token id, in this example the default token id is `myroot`, if you want to use other token id change the `VAULT_DEV_ROOT_TOKEN_ID` in `.vault.env` file, and also set your env var `VAULT_TOKEN` with the same value.

## Global Commands
| Name, shorthand | Description |
| ------ | -----|
| --version, -v | Get binary version |
| --help, -v | Shows a list of commands or help for one command |

##### Usage
```menshend [global-command]```

## Commands

### <i class="icon-angle-right"/>port-forward

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

### <i class="icon-angle-right"/>admin, adminServices

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

#### Example File Config (terminal.yml)
```
api: http://menshend.lab.local:8787/v1
kind: AdminService
spec:
  secretPaths:
  - secret/menshend/roles/admin/terminal.
  meta:
    roleId: admin
    # spark will be accessible on  https://spark.lab.example.com/v1?md-role=secret-lab
    subDomain: terminal.
    name: terminal
    description: web terminal.
    logo: http://icons.iconarchive.com/icons/alecive/flatwoken/64/Apps-Terminal-Pc-104-icon.png
    tags:
    - admin
    - toolds
    longDescription:
      remote:
        url: https://raw.githubusercontent.com/paradoxxxzero/butterfly/master/README.md
  resolver:
    yaml:
      content: |
        baseUrl: http://localhost:9090
  strategy:
    proxy: {}
```

### <i class="icon-angle-right"/> server, run, start

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

#### Example config file (menshend server -c menshend.yml)
```
Uris:
  BaseUrl: http://yourdomain.com
hashKey: yourHashKey
blockKey: yourBlockKey
Space:
  Name: Genos
  Logo: http://orig01.deviantart.net/3585/f/2015/344/1/f/one_punch_man_genos_render_2_by_ayakayukihiro-d9jnh9e.png
  Description: Nebtex Laboratory
```
