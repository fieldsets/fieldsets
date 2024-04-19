# Fieldsets Framework Environment Variables
The Fieldsets Repository is an wrapper of other docker containers. The environment variables it required to run a pipeline derived container will vary on the projects integrated to each pipeline project.

The table below lists all the variables utilized within Fieldsets's data pipeline and the projects they are intergrated with. For more details, you can check the environments section of each individual project's `README` or have a look at the project configuration documentataion found in [config/docker](../../config/docker/).

**NOTES:**
-  All PATH variables expect a trailing `/`
-  Variable tables organized by project usage with largest multi project variables listed first

## Universal Variables
| **Variable** | **Default Value** | **Valid Values** | **Projects** | **Description** |
| :----------- | :---------------- | :--------------- | :----------- | :-------------- |
| VERSION | `latest` | *any string* | all | Fieldsets pipeline version |
| ENVIRONMENT | `dev` | *any string* | all | Server environment |
| COMPOSE_PATH_SEPARATOR | `:` | `:` (mac/linux) or `;` (windows) | all | native docker compose variable. Do not change. |
| COMPOSE_FILE | `./docker-compose.yml:./config/postgres/docker-compose.yml` | A `:` separated string of relative docker compose file paths. | all | Make sure the top level compose file is first followed by any other partial of full compose files. |
| LOCAL_UID | `1000` | *any integer. Typically `1000` (linux) or `502` (mac)* | all | User id of host account. Use the command `id -u` to retrieve your user id. This allows you to write to containers w/o permission errors. |
| LOCAL_GID | `1000` | *any integer. Typically `1000` (linux) or `20` (mac)* | all | Group id of host account. Use the command `id -g` to retrieve the group id.
| TIMEZONE | `America/New_York` | *Any [valid timezone string](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)* | all | Timezone of the container host server |
| FIELDSETS_NETWORK_SUBNET | `172.28.0.0/24` | *any valid ipv4 Class A range address* | all | The address range subnet which containers can communicate under |
| FIELDSETS_SRC_PATH | `./src/` | *any relative path string* | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | Mounts this path to `/fieldsets` within container | love you daddy

## Multi-container Variables
| **Variable** | **Default Value** | **Valid Values** | **Projects** | **Description** |
| :----------- | :---------------- | :--------------- | :----------- | :-------------- |
| POSTGRES_VERSION | `15` | *any valid major version number* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | PostgreSQL Major Release Version. |
| POSTGRES_USER | `postgres` | *any string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | PostgreSQL DB username |
| POSTGRES_PASSWORD | `fieldsets` | *any string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | PostgreSQL DB user password |
| POSTGRES_HOST | `172.28.0.7` | *any valid ipv4 address or DNS host string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | Address of PostgreSQL host. May be external or containerized address. |
| POSTGRES_PORT | `5432` | *any integer* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | PostgreSQL port for connection |
| POSTGRES_DB | `fieldsets` | *any string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | PostgreSQL database name |
| ENABLE_TERMINAL | `false` | `true` or `false` | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li></ul> | Sets variable withing docker compose file `tty: ${ENABLE_TERMINAL}`. Allows for pseudo tty. |


## Postgres Container Variables
| **Variable** | **Default Value** | **Valid Values** | **Projects** | **Description** |
| :----------- | :---------------- | :--------------- | :----------- | :-------------- |
| POSTGRES_CONFIG_PATH | `./config/postgres/` | *any valid path* | [docker-postgres](https://github.com/Fieldsets/docker-postgres) | Location of Dockerfile. |

## ClickHouse Variables
| **Variable** | **Default Value** | **Valid Values** | **Projects** | **Description** |
| :----------- | :---------------- | :--------------- | :----------- | :-------------- |
| ENABLE_STORE | `false` | Disabled by default. | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | Enable to use column store data tables |
| CLICKHOUSE_VERSION | `24` | *any valid major version number* | none | Clickhouse major release version |
| CLICKHOUSE_CONFIG_PATH | `./config/clickhouse/` | *any valid path* | none | | Location of Dockerfile. |
| CLICKHOUSE_USER | `default` | *any string* | none | ClickHouse DB username |
| CLICKHOUSE_PASSWORD | `fieldsets` | *any string* | none | ClickHouse DB user password |
| CLICKHOUSE_HOST | `172.28.0.5` | *any valid ipv4 address or DNS host string* | none | Address of ClickHouse host. May be external or containerized address.
| CLICKHOUSE_PORT | `8123` |  *any integer* | none | ClickHouse port for connection |
| CLICKHOUSE_DB | `fieldsets` | *any string* | none | ClickHouse DB name |

## Fieldsets Local Variables
| **Variable** | **Default Value** | **Valid Values** | **Projects** | **Description** |
| :----------- | :---------------- | :--------------- | :----------- | :-------------- |
| FIELDSETS_SRC_PATH | `./src/` | *any relative path string* | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | Mounts this path to `/fieldsets` within container |
| FIELDSETS_LOCAL_CONFIG_PATH | `./config/local/` | *any relative path string*  | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | Location of Dockerfile. |
| FIELDSETS_LOCAL_HOST | `172.28.0.6` | *any valid ipv4 address* | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | Allows external containers to access this container vi local ip address. |
| SSH_PORT | `22` | *any integer* | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | Port number of Fieldsets jump server |
| SSH_USER | `NULL` | *any string* | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | Username for Fieldsets jump server login |
| SSH_KEY_PATH | `~/.ssh/` | *any valid file path* | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | RSA key file path |
