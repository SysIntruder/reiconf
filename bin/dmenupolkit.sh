#! /bin/sh

# Read incoming messages one by one (line by line)
while read -r msg; do
  if echo "$msg" | jq -e '.action == "request password"' 1>/dev/null 2>/dev/null; then
    # Parse msg fields
    message="$(printf '%s' "$msg" | jq -rc '.message // "No message given!"')"

    # Request a password prompt from dmenu
    response=$(echo "$message" | dmenu -p "Password:" -nf "#222222")

    # Cancel authentication if no password was given, otherwise respond with given password
    if [ -z "$response" ] || [ "$response" = "$message" ]; then
      echo '{"action":"cancel"}'
    else
      echo "{\"action\":\"authenticate\",\"password\": \"$response\"}"
    fi
  fi
done
