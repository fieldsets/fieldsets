# Tools

| Tool  | Description | Run Cmd | Example |
| ----- | ----------- | ------- | ------- |
| [terminal.sh](./bin/terminal.sh) | Connect to container terminal shell. | ./bin/terminal.sh `CONTAINER_NAME` | *./bin/terminal.sh fieldsets-local* |
| [postgres-cli.sh](./bin/postgres-cli.sh) | Run psql CLI within docker-postgres container. Connects to env var `${POSTGRES_HOST}` | ./bin/postgres-cli.sh | *./bin/postgres-cli.sh* |
| [run.sh](./bin/run.sh) | Run a script (such as an init script) within fieldsets-local. It copies the contents of the current directory of the script to /tmp/ in fieldsets-local and runs it. It deletes it upon completion.| ./bin/run.sh | *./bin/run.sh `SCRIPT_NAME`* |