# Bash Library: logger/lib

This Bash library provides the `log` function for structured logging to `stdout`.

## Features
- Colorized log levels
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
source "${BASH_LIB_DIR}/logger/lib"
```

## Options
You can disable specific logging features by setting one of the following variables in your script:

```bash
log_no_color="true"      # Disable colored log levels
log_no_timestamp="true"  # Remove timestamps from log messages
log_no_loglevel="true"   # Hide log levels
log_no_stacktrace="true" # Disable stack trace output
```

To re-enable an option, unset the corresponding variable:

```bash
unset log_no_color
```

## Example
```bash
source /usr/local/bin/bash-lib/logger/lib

log "info" "Starting script..."
...
log "error" "An error occurred!"
log "debug" "Return code: ${rc}"
...
log "info" "Script execution completed."
```

### Example Output
```log
$ ./test.sh
2025-03-14T17:28:42+0100 TRACE [at test.sh.main.print_logs:17] Hello World!
2025-03-14T17:28:42+0100 DEBUG Hello World!
2025-03-14T17:28:42+0100 INFO  Hello World!
2025-03-14T17:28:42+0100 WARN  Hello World!
2025-03-14T17:28:42+0100 ERROR Hello World!
2025-03-14T17:28:42+0100 FATAL Hello World!
```

## JSON Output
To enable JSON-formatted logs, replace `logger/lib` with `logger_json/lib`:

```bash
source "${BASH_LIB_DIR}/logger_json/lib"
```

## License
Refer to the repository's license file for details.

