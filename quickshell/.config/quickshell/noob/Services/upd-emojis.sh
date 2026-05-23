#!/usr/bin/env bash
#
# Credit to "https://github.com/muan/emojilib"
#

rm emojis.json

curl -fsSL 'https://github.com/muan/emojilib/raw/main/dist/emoji-en-US.json' \
  | jq 'to_entries | map({
    e: .key,
    n: (.value[0] | gsub("_"; " ")),
    k: (.value | join(" "))
  })' > emojis.json
