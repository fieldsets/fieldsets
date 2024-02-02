# Fieldsets Plugins

You can utilize the relative `./plugins` directory to load any plugins. Plugins are loaded using the `${FIELDSETS_PLUGINS_PATH}` environment variable which defaults to the relative directory `./plugins`.

If you want to use a specialized set of plugins for a container in the Fieldsets framework, you can load the plugins into the relative `./plugins` directory of that container's `Dockerfile` and create a top level `docker-compose.override.yml` that mounts the `fieldsets-plugins` volume to a container specific plugin directory.


## Plugin Event Phases
There are 3 plugin events;

- `init` is run after all the containers have finished building, but before framework init scripts are fired. This event only happens the first time containers are started immediately after docker finished building.
- `config` is run after the init phase and is run on every startup.
- `run` This phase happens after all init scripts have run and is run on every container startup.