# Pipeline Environment Variables
The Fieldsets Pipeline Repository is an wrapper of other docker containers. The environment variables it required to run a pipeline derived container will vary on the projects integrated to each pipeline project.

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
| FIELDSETS_LOCAL_NETWORK_SUBNET | `172.28.0.0/24` | *any valid ipv4 Class A range address* | all | The address range subnet which containers can communicate under |

## Multi-container Variables
| **Variable** | **Default Value** | **Valid Values** | **Projects** | **Description** |
| :----------- | :---------------- | :--------------- | :----------- | :-------------- |
| POSTGRES_VERSION | `14` | *any valid major version number* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li><li>[docker-genie](https://github.com/Fieldsets/docker-genie)</li></ul> | PostgreSQL Major Release Version. |
| POSTGRES_USER | `postgres` | *any string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li><li>[docker-genie](https://github.com/Fieldsets/docker-genie)</li></ul> | PostgreSQL DB username |
| POSTGRES_PASSWORD | `fieldsets` | *any string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li><li>[docker-genie](https://github.com/Fieldsets/docker-genie)</li></ul> | PostgreSQL DB user password |
| POSTGRES_HOST | `172.28.0.7` | *any valid ipv4 address or DNS host string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li><li>[docker-genie](https://github.com/Fieldsets/docker-genie)</li></ul> | Address of PostgreSQL host. May be external or containerized address. |
| POSTGRES_PORT | `5432` | *any integer* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li><li>[docker-genie](https://github.com/Fieldsets/docker-genie)</li></ul> | PostgreSQL port for connection |
| POSTGRES_DB | `fieldsets` | *any string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li><li>[docker-genie](https://github.com/Fieldsets/docker-genie)</li></ul> | PostgreSQL database name |
| ENABLE_TERMINAL | `false` | `true` or `false` | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-genie](https://github.com/Fieldsets/docker-genie)</li></ul> | Sets variable withing docker compose file `tty: ${ENABLE_TERMINAL}`. Allows for pseudo tty. |
| SSH_HOST | `NULL` | *any valid ipv4 address or DNS host string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | If running environment locally, SSH_HOST creates a tunnel for FDWs |
| VBDB_USER | `NULL` | *any string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | Username to connect to a Fieldsets `fieldsets` instance |
| VBDB_PASSWORD | `NULL` | *any string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | User password to connect to a Fieldsets `fieldsets` instance |
| VBDB_HOST | `NULL` | *any valid ipv4 address or DNS host string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | Host address of a Fieldsets `fieldsets` instance |
| VBDB_PORT | `5432` | *any integer* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | Port number of a Fieldsets `fieldsets` instance |
| VBDB_TUNNEL_PORT | `5433` | *any integer* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres) | If `${SSH_HOST}` is defined, use this port for a jump server tunnel |
| FIELDSETSPHI_USER | `NULL` | *any string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | Username to connect to a Fieldsets `fieldsets` instance |
| FIELDSETSPHI_PASSWORD | `NULL` | *any string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | User password to connect to a Fieldsets `fieldsets` instance |
| FIELDSETSPHI_HOST | `NULL` | *any valid ipv4 address or DNS host string* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | Host address of a Fieldsets `fieldsets` instance |
| FIELDSETSPHI_PORT | `5432` | *any integer* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | Port number of a Fieldsets `fieldsets` instance |
| FIELDSETSPHI_TUNNEL_PORT | `5434` | *any integer* | <ul><li>[fieldsets-local](https://github.com/Fieldsets/fieldsets-local)</li><li>[docker-postgres](https://github.com/Fieldsets/docker-postgres)</li></ul> | If `${SSH_HOST}` is defined, use this port for a jump server tunnel |

## Postgres Container Variables
| **Variable** | **Default Value** | **Valid Values** | **Projects** | **Description** |
| :----------- | :---------------- | :--------------- | :----------- | :-------------- |
| POSTGRES_CONFIG_PATH | `./config/postgres/` | *any valid path* | [docker-postgres](https://github.com/Fieldsets/docker-postgres) | Location of Dockerfile. |

## Fieldsets Local Variables
| **Variable** | **Default Value** | **Valid Values** | **Projects** | **Description** |
| :----------- | :---------------- | :--------------- | :----------- | :-------------- |
| FIELDSETS_LOCAL_SRC_PATH | `./src/` | *any relative path string* | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | Mounts this path to `/fieldsets` within container |
| FIELDSETS_LOCAL_CONFIG_PATH | `./config/local/` | *any relative path string*  | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | Location of Dockerfile. |
| FIELDSETS_LOCAL_HOST | `172.28.0.6` | *any valid ipv4 address* | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | Allows external containers to access this container vi local ip address. |
| SSH_PORT | `22` | *any integer* | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | Port number of Fieldsets jump server |
| SSH_USER | `NULL` | *any string* | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | Username for Fieldsets jump server login |
| SSH_KEY_PATH | `~/.ssh/id_rsa` | *any valid file path* | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | RSA key file path |
| CLICKHOUSE_ENABLED | `false` | Disabled by default. | [fieldsets-local](https://github.com/Fieldsets/fieldsets-local) | Enable to use column store data tables |

## Genie Container Variables
| **Variable** | **Default Value** | **Valid Values** | **Projects** | **Description** |
| :----------- | :---------------- | :--------------- | :----------- | :-------------- |
| SYSTEM_MEMORY | `24` | *any integer* followed by an `M` or `G` | [docker-genie](https://github.com/Fieldsets/docker-genie) | Maximum memory available to container |
| GENIE_HOST | `172.28.0.8` | *any valid ipv4 address or DNS host string* | [docker-genie](https://github.com/Fieldsets/docker-genie) | Host address of current genie instance |
| GENIE_VERSION | `latest` | *any string* | [docker-genie](https://github.com/Fieldsets/docker-genie) | Genie version of instance |
| GENIE_PATH | `./config/genie/src/genie/` | *any valid path* | [docker-genie](https://github.com/Fieldsets/docker-genie) | location of the [genie submodule](https://github.com/Fieldsets/genie) |
| GENIE_CONFIG_PATH | `./config/genie/` | *any valid path* | [docker-genie](https://github.com/Fieldsets/docker-genie)| Location of Dockerfile. |
| SALMON_VERSION | `latest` | *any string* | [docker-genie](https://github.com/Fieldsets/docker-genie) | Salmon release version |
| ENSEMBL_VERSION | `101` | *any valid major version number* | [docker-genie](https://github.com/Fieldsets/docker-genie) | Ensembl release version |
| GENOME_VERSION | `GRCh38` | *any valid ensembl genome id string* | [docker-genie](https://github.com/Fieldsets/docker-genie)| Human genome version |
| GENIE_CATALOG_ID | `4` | *any integer* | [docker-genie](https://github.com/Fieldsets/docker-genie) | Valid id from table `fieldsets.human_gene_catalog` |
| GENIE_MISSING_DATA_PATH | `/files/` | *any valid path* | [docker-genie](https://github.com/Fieldsets/docker-genie) | Container location where to mount local genie `data/` directory |
| GENIE_MISSING_TRANSCRIPTS_METADATA_FILENAME | `missing-transcripts-metadata.txt` |  *any valid filename* | [docker-genie](https://github.com/Fieldsets/docker-genie) | Name of delimited file to use for external transcripts |
| GENIE_MISSING_GENES_METADATA_FILENAME | `missing-genes-metadata.txt` | *any valid filename* | [docker-genie](https://github.com/Fieldsets/docker-genie) | Name of delimited file to use for external genes |
| GENIE_MISSING_TRANSCRIPT_SEQUENCES_FILENAME | `missing-transcripts.fasta` | *any valid filename* | [docker-genie](https://github.com/Fieldsets/docker-genie) | external missing transcript `fasta` file |
| GENIE_VBDB_SCHEMA | `public` | *any valid PostgreSQL schema name* | [docker-genie](https://github.com/Fieldsets/docker-genie) | DB schema containing populated `flowcell`, `sample`, `batch`, `analysis` and `execution` tables |
| SAMPLE_NAME | `NULL` | *any valid sample name string* | [docker-genie](https://github.com/Fieldsets/docker-genie) | Sample name to quantify |
| BATCH_NAME | `NULL` | *any valid batch name string* | [docker-genie](https://github.com/Fieldsets/docker-genie) | Batch name to quantify |
| FORCE_BUILD | `false` | `true` or `false` | [docker-genie](https://github.com/Fieldsets/docker-genie) | Rebuild the Salmon index |
| SKIP_S3_SYNC | `false` | `true` or `false` | [docker-genie](https://github.com/Fieldsets/docker-genie) | Don't interact with S3 (no push or pull) |
| GENIE_BUILD_INDEX_ONLY | `false` | `true` or `false` | [docker-genie](https://github.com/Fieldsets/docker-genie) | Don't quantify single sample. Only build the index. |
| S3_FASTQ_STORAGE_PATH | `s3://bioinfo-prod-fieldsets/inputs/` | *any valid s3 bucket URL* | [docker-genie](https://github.com/Fieldsets/docker-genie) | S3 bucket where Sample data is pulled from |
| S3_INDEX_STORAGE_PATH | `s3://bioinfo-test-fieldsets/genie/` | *any valid s3 bucket URL* | [docker-genie](https://github.com/Fieldsets/docker-genie) | S3 bucket to push compiled salmon index |
| AWS_CREDENTIALS_PATH | `~/.aws/` | *any valid path* | [docker-genie](https://github.com/Fieldsets/docker-genie) | Local AWS credential path. Not needed if below AWS variables are defined |
| AWS_ACCESS_KEY_ID | `NULL` | *any string* | [docker-genie](https://github.com/Fieldsets/docker-genie) | | AWS Access key |
| AWS_SECRET_ACCESS_KEY | `NULL` | *any string* | [docker-genie](https://github.com/Fieldsets/docker-genie) | AWS secret key |
| AWS_DEFAULT_REGION | `us-east-1` | *any valid AWS region string* | [docker-genie](https://github.com/Fieldsets/docker-genie) | Region to run AWS container |

## Unused Variables
| **Variable** | **Default Value** | **Valid Values** | **Projects** | **Description** |
| :----------- | :---------------- | :--------------- | :----------- | :-------------- |
| CLICKOUSE_VERSION | `22` | *any valid major version number* | none | Clickhouse major release version |
| CLICKHOUSE_CONFIG_PATH | `./config/clickhouse/` | *any valid path* | none | | Location of Dockerfile. |
| CLICKHOUSE_USER | `default` | *any string* | none | ClickHouse DB username |
| CLICKHOUSE_PASSWORD | `fieldsets` | *any string* | none | ClickHouse DB user password |
| CLICKHOUSE_HOST | `172.28.0.5` | *any valid ipv4 address or DNS host string* | none | Address of ClickHouse host. May be external or containerized address.
| CLICKHOUSE_PORT | `8123` |  *any integer* | none | ClickHouse port for connection |
| CLICKHOUSE_DB | `fieldsets` | *any string* | none | ClickHouse DB name |
| MIGRATION_BATCH_SIZE | `0` | *any integer* or `false` | none | Migrate partial data set. Will limit row number migrated of any data set. |
| MIGRATION_PIPELINE_DATA_SET | `all` | `all` or `current` | none | Grab one current version data or all.
