#!/bin/sh

# based on https://github.com/inco-cc/pinentry-dmenu

echo "OK Your dmenu pinentry is ready"

while read stdin; do
    case "$stdin" in
        *SETDESC*)
            KEYNAME=${stdin#*:%0A%22}
            KEYNAME=${KEYNAME%\%22\%0A*}
            KEYID=${stdin#*ID }
            KEYID=${KEYID%,*}
            echo "OK"
            ;;
        *GETPIN*)
            pass=$(dmenu -P -p "$KEYNAME ($KEYID) Enter GPG Passphrase:" < /dev/null)
            if [ -n "$pass" ]; then
                echo "D $pass"
                echo "OK"
            else
                echo "ERR 83886179 canceled"  # GPG_ERR_CANCELED
            fi
            ;;
        *BYE*)
            echo "OK closing"
            break
            ;;
        *)
            echo "OK"
            ;;
    esac
done

exit 0
