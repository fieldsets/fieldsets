# Data Stores

The Fieldsets Framework revolves around the concept of data stores. Data Stores can be thought of as Standardized Table Structures. Each store is structured to efficiently utilize the technology on which the data is stored.

## Data Store Types

Currently the frame work has 9 predefined data store types.

### Filter

Filters operate as traditional relational data tables. A field stored as a filter will always contain the primary key of it's parent fieldset. The fields stored are used to filter data and rely on foreign keys to other data stores to optimize access to corresponding data stores. Currently using Postgres data tables but can be migrated to other RDBMS if needed.

Along with any filter fields defined for a fieldset, all Filter Stores will minimally contain the columns:

| **id** | **token** | **parent_id** | **parent_token** | **created** | **updated** |
| :----- | :-------- | :------------ | :--------------- | :---------- | :---------- |
| BIGINT |   STRING  |     BIGINT    |      STRING      |  TIMESTAMP  |  TIMESTAMP  |

### Record

Records operate as time series data stores. Currently using Clickhouse MergeTree Table Engines partitioned on date.

Along with any record fields defined for a fieldset, all Record Stores will minimally contain the columns:

| **id** | **parent_id** | **created** |
| :----- | :------------ | :---------- |
| BIGINT |     BIGINT    |  TIMESTAMP  |

Also any insert into a record store will update the `updated` column of matching ids in any related foreign key filter stores.

### Lookup

Lookup tables are 1 to 1 relationship or lookup tables. Currently stored using Clickhouse Merge Dictionaries as our lookup tables.

### Document

Documents are semi-structured data stores that can be indexed. Currently stored using Postgresql JSONB data types. Document Stores will be added as a JSONB column onto any existing filter tables.

### Sequence

Sequences are stored using positional data. Currently using Clickhouse MergeTree Table Engines partitioned on data positions.

### Stream

Streams are build for write performance with minimal indexing. Logging and message queues are similar. Currently using Postgresql Unlogged tables with TEXT data types. TODO: Integrate Kafka and Clickhouse Log storage.

### View
Views are an assembly of previously defined data fields combined into single table like structure. These views are typically stored in memory. PostgreSQL materialized views are difficult to update when using larger data sets and joins, so Clickhouse Materialized views are used to deliver this useful store type.

### Enum
Enums are a set of named constants. Instead of stored as a table structure, these are created as a set of usable values for a given field via the PostgreSQL and Clickhouse `ENUM` data types.

### File

Files are structured or unstructured files stored on the filesystem. Uses Clickhouse file table engine.

### Program

Programs transform a field using functions or applications and generate the field from other data stores.

### Custom

Custom data stores can be defined.
