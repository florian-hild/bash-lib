# Bash library: logger_json/lib
---
This bash library provides the bash function `log` where you can use to write structuralized log messages to stdout in json format.

Features:
  - Stack trace with line number and bash function

Available log levels:
  - trace
  - debug
  - info
  - warn
  - error
  - fatal

## Usage
Once you have cloned this repository in your project, you can source this library in your bash script.

```bash
source ${BASH_LIB_DIR}/logger_json/lib
```

## Options
To disable an option, you can set one of the following variables somewhere in your script:
```bash
log_no_timestamp="true"
log_no_loglevel="true"
log_no_stacktrace="true"
```

To enable the option again, just unset the variable like `unset log_no_color`.

## Example
```bash
source /usr/local/bin/bash-lib/logger_json/lib

log "info" "Start script"
...
log "error" "Something went wrong here!"
log "debug" "Return code: ${rc}"
...
log "info" "End script"
```

Example output:
```json
$ ./test.sh
{ "timestamp": "2023-08-09 19:43:46.469","loglevel": "trace","stacktrace": "at test.sh.main:16","message": "Hello World!" }
{ "timestamp": "2023-08-09 19:43:46.469","loglevel": "debug","message": "Hello World!" }
{ "timestamp": "2023-08-09 19:43:46.470","loglevel": "info","message": "Hello World!" }
{ "timestamp": "2023-08-09 19:43:46.470","loglevel": "warn","message": "Hello World!" }
{ "timestamp": "2023-08-09 19:43:46.471","loglevel": "error","message": "Hello World!" }
{ "timestamp": "2023-08-09 19:43:46.471","loglevel": "fatal","message": "Hello World!" }
```

You can pipe the json output into the `jq` command.
```json
$ ./test.sh |jq
{
  "timestamp": "2023-08-09 19:45:29.530",
  "loglevel": "trace",
  "stacktrace": "at test.sh.main:16",
  "message": "Hello World!"
}
{
  "timestamp": "2023-08-09 19:45:29.530",
  "loglevel": "debug",
  "message": "Hello World!"
}
{
  "timestamp": "2023-08-09 19:45:29.531",
  "loglevel": "info",
  "message": "Hello World!"
}
{
  "timestamp": "2023-08-09 19:45:29.532",
  "loglevel": "warn",
  "message": "Hello World!"
}
{
  "timestamp": "2023-08-09 19:45:29.533",
  "loglevel": "error",
  "message": "Hello World!"
}
{
  "timestamp": "2023-08-09 19:45:29.533",
  "loglevel": "fatal",
  "message": "Hello World!"
}
```

## License
See repository license file.
