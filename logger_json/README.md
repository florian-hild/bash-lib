# Bash library: logger_json/lib
---
This Bash library provides the `log` function for structured logging to `stdout` in json.

## Features
- Stack trace with line numbers and function names
- Customizable logging options

## Available Log Levels
- `trace`
- `debug`
- `info`
- `warn`
- `error`
- `fatal`

## Usage
Once you have cloned this repository into your project, source the library in your Bash script:

```bash
source ${BASH_LIB_DIR}/logger_json/lib
```

## Options
You can disable specific logging features by setting one of the following variables in your script:

```bash
log_no_timestamp="true"  # Remove timestamps from log messages
log_no_loglevel="true"   # Hide log levels
log_no_stacktrace="true" # Disable stack trace output
```

To re-enable an option, unset the corresponding variable:

```bash
unset log_no_stacktrace
```

## Example
```bash
source /usr/local/bin/bash-lib/logger_json/lib

log "info" "Starting script..."
...
log "error" "An error occurred!"
log "debug" "Return code: ${rc}"
...
log "info" "Script execution completed."
```

### Example Output
```json
$ ./test.sh
{"timestamp":"2025-03-14T17:34:02+0100","loglevel":"TRACE","stacktrace":"at test.sh.main.print_logs:17","message":"Hello World!"}
{"timestamp":"2025-03-14T17:34:02+0100","loglevel":"DEBUG","message":"Hello World!"}
{"timestamp":"2025-03-14T17:34:02+0100","loglevel":"INFO","message":"Hello World!"}
{"timestamp":"2025-03-14T17:34:02+0100","loglevel":"WARN","message":"Hello World!"}
{"timestamp":"2025-03-14T17:34:02+0100","loglevel":"ERROR","message":"Hello World!"}
{"timestamp":"2025-03-14T17:34:02+0100","loglevel":"FATAL","message":"Hello World!"}
```

You can pipe the JSON output into the `jq` command for easier readability and processing.
```json
$ ./test.sh | jq
{
  "timestamp": "2025-03-14T17:34:41+0100",
  "loglevel": "TRACE",
  "stacktrace": "at test.sh.main.print_logs:17",
  "message": "Hello World!"
}
{
  "timestamp": "2025-03-14T17:34:41+0100",
  "loglevel": "DEBUG",
  "message": "Hello World!"
}
{
  "timestamp": "2025-03-14T17:34:41+0100",
  "loglevel": "INFO",
  "message": "Hello World!"
}
{
  "timestamp": "2025-03-14T17:34:41+0100",
  "loglevel": "WARN",
  "message": "Hello World!"
}
{
  "timestamp": "2025-03-14T17:34:41+0100",
  "loglevel": "ERROR",
  "message": "Hello World!"
}
{
  "timestamp": "2025-03-14T17:34:41+0100",
  "loglevel": "FATAL",
  "message": "Hello World!"
}
```

## Standard Output
To enable Standard-formatted logs, replace `logger_json/lib` with `logger/lib`:

```bash
source "${BASH_LIB_DIR}/logger/lib"
```

## License
Refer to the repository's license file for details.
