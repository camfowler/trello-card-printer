#!/bin/bash
app_name="CardPrinter"

application_key=$(cat config/application_key 2>/dev/null)
if test ! "$application_key"; then
  read -rp "Paste Trello API key from (https://trello.com/app-key): " application_key
  echo "$application_key" > config/application_key
fi

auth_token=$(cat config/auth_token 2>/dev/null)
if test ! "$auth_token"; then
  read -rp "Paste verification code (https://trello.com/1/authorize?expiration=never&scope=read,write,account&response_type=token&name=$app_name&key=$application_key): " auth_token
  echo "$auth_token" > config/auth_token
fi

board_id=$(cat config/board_id 2>/dev/null)
if test ! "$board_id"; then
  read -rp "Paste board id (Found in URL of board, e.g. j1Pma3ai): " board_id
  echo "$board_id" > config/board_id
fi

board_json=$(curl -s "https://api.trello.com/1/boards/$board_id?key=$application_key&token=$auth_token&fields=all&actions=all&action_fields=all&actions_limit=1000&cards=all&card_fields=all&card_attachments=true&labels=all&lists=all&list_fields=all&members=all&member_fields=all&checklists=all&checklist_fields=all&organization=false")

echo "data = $board_json" > data/board.js

open index.html
