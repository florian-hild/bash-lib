# Bash Library: notify_gotify/lib

This Bash library provides the `send_alert` function to send structured notifications to a Gotify server from Bash scripts.

## Features
- Send notifications with different priorities (`info`, `warn`, `error`, `critical`)
- Supports multiline and Markdown messages
- Logs HTTP responses and errors via `logger/lib`

## Available Priority Levels
- `info` (lowest)
- `warn` / `warning`
- `error`
- `critical` (highest)

> Numeric priority values are automatically mapped for Gotify:
> `info=0`, `warn=3`, `error=7`, `critical=10`

---

## Usage

Once you have cloned this repository into your project, source the library in your Bash script:

```bash
source "${BASH_LIB_DIR}/notify_gotify/lib"
```

## Options
```bash
declare gotify_server_url="https://gotify_server_url" # Change Gotify server URL
```

## Example
See test script

### Example Outpu
```log
2025-11-03T01:25:59+0100 INFO  Sending notification to Gotify server: https://gotify.lan.florian-hild.de
```

## License
Refer to the repository's license file for details.
