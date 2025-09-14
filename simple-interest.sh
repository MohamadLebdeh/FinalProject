#!/usr/bin/env bash
# Simple interest calculator
# Usage: ./simple-interest.sh <principal> <rate_percent> <time_years>
# Example: ./simple-interest.sh 1000 5 2

set -e

if [ $# -ne 3 ]; then
  echo "Usage: $0 <principal> <rate_percent> <time_years>"
  exit 1
fi

P="$1"
R="$2"
T="$3"

num_re='^[0-9]+([.][0-9]+)?$'
if ! [[ $P =~ $num_re && $R =~ $num_re && $T =~ $num_re ]]; then
  echo "All inputs must be numbers"
  exit 1
fi

if ! command -v bc >/dev/null 2>&1; then
  echo "The 'bc' calculator is required but not installed"
  exit 1
fi

interest=$(echo "scale=2; $P * $R * $T / 100" | bc)
printf "Simple interest: %0.2f
" "$interest"
