#! /bin/sh

# require cmd-polkit-git
# remove ${pkgver} when installing on arch using yay --editmenu -S cmd-polkit-git
#
# based on https://www.reddit.com/r/linux4noobs/comments/r7m48d/how_to_use_dmenu_as_polkit_agent/

if test "$1" != '_CALLED_INTERNALLY'; then
	exec cmd-polkit-agent -s -c "$0 _CALLED_INTERNALLY"
else
	# Remove $1 (_CALLED_INTERNALLY) from parameter array
	shift 1

	# Read incoming messages one by one (line by line)
	while read -r msg; do
		if echo "$msg" | jq -e '.action == "request password"' 1>/dev/null 2>/dev/null; then
			# Parse msg fields
			prompt="$( printf '%s' "$msg" | jq -rc '.prompt // "Password:"')"
			message="$(printf '%s' "$msg" | jq -rc '.message // "No message given!"')"

			# Request a password prompt from dmenu
			response=$(printf $message | dmenu -P -p "$message. $prompt")

			# Cancel authentication if no password was given, otherwise respond with given password
			if test -z "$response"; then
				echo '{"action":"cancel"}'
			else
				echo "{\"action\":\"authenticate\",\"password\": \"$response\"}"
			fi
		fi
	done
fi
