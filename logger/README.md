# Bash library: logger/lib
---
This bash library provides the bash function `log` where you can use to write structuralized log messages to stdout.

Features:
  - Colorized log level
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
source ${BASH_LIB_DIR}/logger/lib
```

## Options
To disable an option, you can set one of the following variables somewhere in your script:
```bash
log_no_color="true"
log_no_timestamp="true"
log_no_loglevel="true"
log_no_stacktrace="true"
```

To enable the option again, just unset the variable like `unset log_no_color`.

## Example
```bash
source /usr/local/bin/bash-lib/logger/lib

log "info" "Start script"
...
log "error" "Something went wrong here!"
log "debug" "Return code: ${rc}"
...
log "info" "End script"
```

Example output:
```log
$ ./test.sh
2023-08-09 19:49:27.325 [trace] [at test.sh.main:16] Hello World!
2023-08-09 19:49:27.326 [debug] Hello World!
2023-08-09 19:49:27.326 [info]  Hello World!
2023-08-09 19:49:27.327 [warn]  Hello World!
2023-08-09 19:49:27.327 [error] Hello World!
2023-08-09 19:49:27.328 [fatal] Hello World!
```

If you like to use json output, you can just change `logger/lib` to `logger_json/lib`.

## License
See repository license file.
