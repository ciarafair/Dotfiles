#!/bin/bash

# Function to check if the computer is connected to the internet
check_internet_connection() {
  if command -v ping >/dev/null; then
    if ping -c 1 google.com >/dev/null 2>&1; then
      return 0
    else
      return 1
    fi
  elif command -v curl >/dev/null; then
    if curl -s --head  --request GET www.google.com | grep "200 OK" >/dev/null; then
      return 0
    else
      return 1
    fi
  else
    return 1
  fi
}

# Check the OS and print the IP address or 'Disconnected'
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if check_internet_connection; then
    ip=$(hostname -I | awk '{print $1}')
    echo "$ip"
  else
    echo "Disconnected"
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  if check_internet_connection; then
    ip=$(ipconfig getifaddr en0)
    echo "$ip"
  else
    echo "Disconnected"
  fi
else
  echo "Unsupported OS: $OSTYPE"
fi
