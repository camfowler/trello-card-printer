# Trello card printer

## Quickstart

Print your Trello cards in 3 easy steps!

1. In Trello, subscribe to the lists you want to print.

2. Run

		./print.sh

3. Print.

## Card formating rules

- Trello card printer will print the description up until the first horizontal rule.
- If there is a checklist named "Acceptance Criteria", the first few items from it will be included in the card, if there is room.
- There is a max-height on the cards when printing, so you can get 3 per A4 page.
