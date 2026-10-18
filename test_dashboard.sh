#!/bin/bash

set -e

echo "Generating load for 30 seconds"
echo "open your Netdata dashboard to observer the CPU Usage"

timeout 30s yes >/dev/null

echo "cpu test completed!"
