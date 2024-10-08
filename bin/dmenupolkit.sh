#! /bin/sh

if test "$1" != '_CALLED_INTERNALLY'; then
	exec cmd-polkit-agent -s -c "$0 _CALLED_INTERNALLY"
else
	# Remove $1 (_CALLED_INTERNALLY) from parameter array
	shift 1

	# Read incoming messages one by one (line by line)
	while read -r msg; do
		if echo "$msg" | jq -e '.action == "request password"' 1>/dev/null 2>/dev/null; then
			# Parse msg fields
			message="$(printf '%s' "$msg" | jq -rc '.message // "No message given!"')"

			# Request a password prompt from dmenu
      spacing=$(printf "    %.0s" {1..32})
			response=$(echo "" | dmenu -p "Password:$spacing$message" -sb "#222222" -nf "#222222")

			# Cancel authentication if no password was given, otherwise respond with given password
			if test -z "$response"; then
				echo '{"action":"cancel"}'
			else
				echo "{\"action\":\"authenticate\",\"password\": \"$response\"}"
			fi
		fi
	done
fi
