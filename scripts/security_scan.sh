#!/bin/bash

set -e

echo "Running Trivy Scan"

IMAGE=$1
REPORT=$2

trivy image --severity HIGH,CRITICAL \
	--format json \
	-o reports/$REPORT \
	$IMAGE

echo "Scan Completed............"
