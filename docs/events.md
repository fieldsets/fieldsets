# Events

This pipeline creates logged events in json format meant to be ingested by a message queue such as kafka. With an external message queue you can use `producers` and `consumers`, which are simple python scripts that check these events and their contained meta data. This allows us to fire any external events or triggers that may need human attention or 3rd party integrations.

## Format

Logs are export as a json object with the same prefix: `{"fieldsets_event":`. If using a standard log program. A pattern match on the prefix will return the corresponding entries.

