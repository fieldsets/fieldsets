# Data Architecture & Pipeline
For the more information on the [data structures](./docs/assets/data_structures.json) and [pipeline setup](./docs/pipeline.md), see the documentation [here](./docs/index.md).

This repository defines Fieldsets's data pipeline from and was built following relational theory and applying [normal form](https://en.wikipedia.org/wiki/Database_normalization#Normal_forms) where relational data exists. We try to stay within 3NF but make exceptions where there is a clear performance benefit for visualization.

This repository also defines non-normalized data structures for functions including but not exclusive to data aggregation, metric creation, positional analysis & time-series data.  

All of these optimized data structures can be found within the database `fieldsets` under the schema `fieldsets`. We utilize these optimized data structures to abstractly recreate the current fieldsets schema found in the database `fieldsets` under the schema `public` so that our team can experience the performance benefit with little disruption to their work flow.