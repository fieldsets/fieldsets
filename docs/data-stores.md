# Data Stores

The Fieldsets IAC Framework revolves around the concept of data stores.

## Data Store Types

Currently the frame work has 9 predefined data store types.

### Filter

Filters operate as traditional relational data tables. The fields stored as profile data are used to filter data and rely on foreign keys to other data stores to optimize access to corresponding data. Currently using Postgres data tables.

### Record

Records operate as time series data stores. Currently using Clickhouse MergeTree Table Engines.

### Sequence

Sequences are stored using positional data. Currently using Clickhouse MergeTree Table Engines.

### Vector

Vector tables are 1 to 1 relationship or mapping tables. Currently stored using Clickhouse Merge Tree Tables.

### Document

Documents are semi-structured data stores that can be indexed. Currently stored using Postgresql JSONB data types. TODO: Integrate MongoDB document storage.

### Message

Messages are build for write performance with minimal indexing. Logs and messages are similar. Currently using Postgresql Unlogged tables with JSONB data types. TODO: Integrate Kafka and Clickhouse Log storage.

### File

Files are structured or unstructured files stored on the filesystem. Uses Clickhouse file table engine.

### Program

Programs transform a field using functions or applications and generate the field from other data stores.

### Custom

Custom data stores can be defined.
