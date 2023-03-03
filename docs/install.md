# Fieldsets Pipeline Installation Guide
This section covers details on how to get started with the fieldsets pipeline.

*TL;DR*

```
git clone --recurse-submodules git@github.com:Fieldsets/fieldsets-pipeline.git
cd fieldsets-pipeline
git submodule foreach git pull origin main
cp ./env.example ./.env (make appropriate corrections to file. additional example envs found in [./config/docker](./config/docker/)
docker-compose up -d --build
```

## System Requirements.
Before we begin, you must have the following installed locally on your machine. Follow the links below for directions on how to get setup on your current environment.

- [docker compose](https://docs.docker.com/compose/install/)
- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Mac OS
Using the terminal execute the following steps
- Install Xcode
    - `xcode-select --install`
- Install homebrew
    - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
- Disable homebrew analytics
    - `brew analytics off`
- Install git
    - `brew install git`
- Install docker-compose
    - `brew install docker-compose`
- Run caffeinate to prevent sleep on first run
    - `caffeinate`

### Linux (Debian based)
- Install git
    - `sudo apt install docker`
- Install git
    - `sudo apt install git`

## Install Steps
Once you have install git and docker-compose, the first step is to clone the `fieldsets-pipeline` repository and all of it's submodules into your local environment. This pipeline has 2 submodules minimally required to run. The [postgres database container](https://github.com/Fieldsets/docker-postgres) and a [localized scripting container](https://github.com/Fieldsets/fieldsets-local) that helps run whatever scripts are needed by the pipeline project. By default, this pipeline will run using all variables from all integrations that are active in production even if the containers are not running. Before getting started, it may be best to look in the [docker config sub-directory](./config/docker/) and utilize the dotenv, gitmodule & compose override files found there in place of the top level files used to run the pipeline in full.

```
git clone --recurse-submodules https://github.com/fieldsets/fieldsets-pipeline.git
```

Next we need head to our repository directory and make sure we have the latest versions of our submodules. You can update them in with the following commands:

```
cd fieldsets-pipeline
git submodule foreach git pull origin main
```

While the enviroment will boot with default options, you should make a copy of the example env file and change any configuration parameters (like postgres version or the path of your private key). This is unnecessary as the project will run with the default values set in the `docker-compose.yml` file, but the project will have little functionality out side of creating a local postgres environment for you. If you are looking for a fieldsets database instance to run on EC2, you may want to look at [Fieldsets's docker postgres](https://github.com/Fieldsets/docker-postgres) repository.

The example env contains all the variables used to configure our full pipeline, so every project (including yours!) that is integrated into the Fieldsets Automated Pipeline, has it's environment variables added to the [env.example file](../env.example).  Depending on what you are looking to do, it is likely that many of these variables will be empty for your application or not defined. You can omit or change these variables to help with current deployments. Defaults will be filled in using values defined in the docker-compose file for any omitted values.

Subsets of fieldsets-pipeline project dotenv files can be found in [config/docker/](../config/docker/). A full explantion of environment variables can also be found [here](./env-vars.md).

*NOTE:* Other versions of PostgreSQL have not been tested outside of v12 & v13. The philosophy behind upgrades is to do it after it has established thorough adoption by the community.

```
cp ./env.example ./.env
```

Now lets get the environment running!

For our remote data stores to work, we will need credentials for our production and clone servers.

Once docker-compose is installed and you have cloned this repository as instructed above, you can get the entire environment up and running with the following command:

```docker compose up -d```

That's it! You should be up and running. The first docker build may take a while as it imports data remotely and can vary depending on network speed and your local environment hardware. If you'd like to view what is happening on the install you can track the output logs of the container that does all the heavy lifting with the following command:

```docker compose logs -f fieldsets-local```

or simply check everything

```docker compose logs -f```

If you see a log entry of a container `exited with code 0` that means everything has run succssfully. Anyother exit code besides `0` means something went wrong somewhere along the line. You you have set `ENABLE_TERMINAL=true` you won't see an `exit with code 0` message when a container completes. You should simply see the final message output by the container's entrypoint script.

When you are done using the environment you can halt the environment using the command:

```docker compose stop```

If you'd like to detach volumes (without deleting them), you can also use the command.

```docker compose down```