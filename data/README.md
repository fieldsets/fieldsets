# Data Directory

This data directory is mapped as a volume in your container. When a container is destroyed, these files will remain even if you prune the docker volumes. You can erase any data found in this container as it can always be recreated by its originating container. All files found in here are ignored by the git repository.
