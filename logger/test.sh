#!/usr/bin/env bash

################################################################################
# Developer ......: F.Hild
# Created ........: 09.08.2023
# Description ....: Test script for logger/lib
################################################################################

export LANG=C.UTF-8

declare -r __SCRIPT_VERSION__='1.0'
declare -r message="Hello World!"

source ./lib

log "trace" "${message}"
log "debug" "${message}"
log "info" "${message}"
log "warn" "${message}"
log "error" "${message}"
log "fatal" "${message}"