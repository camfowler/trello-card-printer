#!/bin/bash
app_name="CardPrinter"

application_key=$(cat .application_key 2>/dev/null)
if test ! "$application_key"; then
  read -rp "Paste Trello API key from (https://trello.com/app-key): " application_key
  echo "$application_key" > .application_key
fi

auth_token=$(cat .auth_token 2>/dev/null)
if test ! "$auth_token"; then
  read -rp "Paste verification code (https://trello.com/1/authorize?expiration=never&scope=read,write,account&response_type=token&name=$app_name&key=$application_key): " auth_token
  echo "$auth_token" > .auth_token
fi

board_json=$(curl -s "https://api.trello.com/1/boards/j9Umz8ni?key=$application_key&token=$auth_token&fields=all&actions=all&action_fields=all&actions_limit=1000&cards=all&card_fields=all&card_attachments=true&labels=all&lists=all&list_fields=all&members=all&member_fields=all&checklists=all&checklist_fields=all&organization=false")

echo "data = $board_json" > board.js

open cards.html
