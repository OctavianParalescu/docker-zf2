# Docker and Zend Framework 2

Here you'll find a `Dockerfile` and some configurations to run
your Zend Framework 2 applications within a docker container.  

Although this image has configurations for production environments included,
it's main purpose is to quickly start developing a ZF2 application.  
If you decide to use this image for setting up a production environment, be sure to excessively test if
your application runs without problems in this environment and also change the exposed port
in the Dockerfile from 8085 (or whatever port you used for your app on dev) to 80.

## Features
* PHP 5.5 including multiple extensions (see Dockerfile)
* Apache 2.4 including mod_rewrite
* Config for DEV and PROD (*not recommended*) usage
  * DEV
    * xdebug configured with remote_connect_back
  * PROD
    * opcache with recommended settings for performance
    * xdebug extension disabled by default

## Running your ZF2 application in Docker

### New project
```bash
cd /home/user/new-zf2-app
composer create-project --stability="dev" zendframework/skeleton-application .
sudo docker run -d -p 8085:80 -v $(pwd):/zf2-app octavianparalescu/docker-zf2
```

Now visit http://localhost:8085 and check out your running
Zend Skeleton Application.

### Existing project
```bash
cd /home/user/your-zf2-app
sudo docker run -d -p 8085:80 -v $(pwd):/zf2-app octavianparalescu/docker-zf2
```

### Using Docker for Windows
Docker for Windows should run like Docker for Mac or Linux. The difference in this case
would be that you should replace the env var "$(pwd)" in the docker run command with the
counterpart in Windows "%cd%" and also remove the "sudo" part.

### Options / environment variables to fine tune the config
```bash
docker run \
    -e DOCKER_ZF2_ENV="DEV" \ # DEV|PROD copies dev or prod config to /etc (default:DEV)
    -e PHP_MODS_DISABLE="xdebug sqlite" # explicitly disable php modules (space separated list of modules)
    -e PHP_MODS_ENABLE="mysql opcache" # explicitly enable php modules (space separated list of modules)
```

## Contributing
Feel free to open issues or fork and create a PR. This is as well forked from https://github.com/maglnet/docker-zf2
which is a bit outdated.


## License
docker-zf2 is licensed under the MIT license.
See the included LICENSE file.
