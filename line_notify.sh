#/bin/bash

LINE_TOKEN="your-token-in-here"
MESSAGE="your-message-in-here"

curl -s -X POST -H "Content-Type:application/x-www-form-urlencoded" -H "Authorization: Bearer $LINE_TOKEN" -d "message=$MESSAGE" https://notify-api.line.me/api/notify > /dev/null
