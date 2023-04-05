# Fieldsets Plugins

You can utilize the relative `./plugins` directory to load any plugins. Plugins are loaded using the `${FIELDSETS_PLUGINS_PATH}` environment variable which defaults to the relative directory `./plugins`.

If you want to use a specialized set of plugins for a container in the Fieldsets framework, you can load the plugins into the relative `./plugins` directory of that container's `Dockerfile` and create a top level `docker-compose.override.yml` that mounts the `fieldsets-plugins` volume to a container specific plugin directory.


## Plugin Events
There are 2 plugin events; the `build_plugins` and `init_plugins` events.

- `build_plugins` is called during the docker build stage as a RUN command in a docker filer. This allows plugins to modify containers themselves in their own layer and allows you to build your own custom image using plugins.
- `init_plugins` is run after all the containers have started, but before framework init scripts are fired. This allows us to makesure plugin initscripts can be copied to containers.
- 