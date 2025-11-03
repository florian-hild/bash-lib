#!/usr/bin/env bash

################################################################################
# Developer ......: F.Hild
# Created ........: 02.11.2025
# Description ....: Unit test script for notify_gotify/lib
################################################################################

export LANG=C.UTF-8

source ./lib

# Test configuration
declare gotify_server_url="https://gotify.lan.florian-hild.de"
declare gotify_test_key="AU1PVs7QFV3q1y9"

echo "========================================="
echo "Running notify_gotify unit tests..."
echo "========================================="

Test 1: Simple info alert
echo "Test 1: Simple info alert"
send_alert "info" "Unit Test - Info" "This is a test alert" "${gotify_test_key}"
echo "-----------------------------------------"
echo

# Test 2: Warning alert
echo "Test 2: Warning alert"
send_alert "warn" "Unit Test - Warning" "This is a warning message" "${gotify_test_key}"
echo "-----------------------------------------"
echo

# Test 3: Error alert
echo "Test 3: Error alert"
send_alert "error" "Unit Test - Error" "Something went wrong!" "${gotify_test_key}"
echo "-----------------------------------------"
echo

# Test 4: Critical alert with Markdown
echo "Test 4: Critical alert with Markdown"
MD_MESSAGE=$(cat <<EOF
**Critical Alert**
- Service: database
- Status: DOWN
- Timestamp: $(date)
EOF
)

send_alert "critical" "Unit Test - Critical" "${MD_MESSAGE}" "${gotify_test_key}"
echo "-----------------------------------------"
echo

# Test 5: Multiline message test
echo "Test 5: Multiline message"
MULTILINE_MSG=$'Line 1\nLine 2\nLine 3\nEnd of message'
send_alert "info" "Unit Test - Multiline" "${MULTILINE_MSG}" "${gotify_test_key}"
echo "-----------------------------------------"
echo

# Test 6: Invalid priority (should fail gracefully)
echo "Test 6: Invalid priority (expect error)"
send_alert "invalid_priority" "Unit Test - Invalid priority" "This should trigger an error" "${gotify_test_key}"
echo "-----------------------------------------"
echo

# Test 7: Invalid Gotify URL
echo "Test 7: Invalid Gotify URL (expect error)"
declare gotify_server_url="https://dummy_gotify.lan.florian-hild.de"
send_alert "0" "Unit Test - Invalid URL" "This should trigger an error" "${gotify_test_key}"
echo "-----------------------------------------"
echo

echo "All tests executed. Check Gotify server for notifications."
echo "========================================="

