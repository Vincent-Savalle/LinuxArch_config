#!/bin/bash
usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader)
echo "$usage"
