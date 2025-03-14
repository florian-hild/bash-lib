#!/usr/bin/env bash

################################################################################
# Developer ......: F.Hild
# Created ........: 09.08.2023
# Description ....: Test script for logger/lib
################################################################################

export LANG=C.UTF-8
declare -r __SCRIPT_VERSION__='1.1.0'

declare -r message="Hello World!"

source ./lib

function print_logs(){
    log "trace" "${message}"
    log "debug" "${message}"
    log "info" "${message}"
    log "warn" "${message}"
    log "error" "${message}"
    log "fatal" "${message}"
}


echo "Logger settings: defaults"
echo "------------------------"
print_logs

declare log_no_color="True"
echo
echo "Logger settings: log_no_color=True"
echo "------------------------"
print_logs

unset log_no_color
declare log_no_timestamp="True"
echo
echo "Logger settings: log_no_timestamp=True"
echo "------------------------"
print_logs


unset log_no_timestamp
declare log_no_loglevel="True"
echo
echo "Logger settings: log_no_loglevel=True"
echo "------------------------"
print_logs

unset log_no_loglevel
declare log_no_stacktrace="True"
echo
echo "Logger settings: log_no_stacktrace=True"
echo "------------------------"
print_logs

echo
echo "Logger settings: Test wrong log level"
echo "------------------------"
unset log_no_stacktrace
log "test" "This is a test message"
