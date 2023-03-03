# Genie Server Benchmarks

Utilizing AWS instances results in a pretty severe performance hit compared to run times on a local machine. AWS T4g instances run by default in AWS unlimited CPU mode and still see a substantial performance hit when compared to similar resources of the Apple M1 environment.

## Results

### Apple M1 (8core 32GB Local Laptop)

Salmon Index: 23min 22sec
Docker Image: 14min 41sec

#### Genie Salmon Index

- [2022-10-05 10:06:24.211] [jLog] [info] building index
- [2022-10-05 10:29:46.408] [jLog] [info] done building index

#### Genie Docker Image

- [+] Building 881.4s (22/22) FINISHED

### AWS Intel r5a.2xlarge (8core 64GB 0.452 USD per Hour)

Salmon Index: 38min 39sec
Docker Image: 32min 58sec

#### Genie Salmon Index

- [2022-10-05 11:10:10.875] [jLog] [info] building index
- [2022-10-05 11:48:49.142] [jLog] [info] done building index

#### Genie Docker Image

- [+] Building 1978.0s (22/22) FINISHED

### AWS ARM t4g.2xlarge (8core 32GB 0.2688 USD per Hour)

Salmon Index: 31min 53sec
Docker Image: 33min 33sec

#### Genie Salmon Index

- [2022-10-05 12:02:19.770] [jLog] [info] building index
- [2022-10-05 12:34:12.093] [jLog] [info] done building index

#### Genie Docker Image

- [+] Building 2013.1s (22/22)
