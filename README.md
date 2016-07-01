# Trello card printer

## Quickstart

Print your Trello cards in 4 easy steps!

1. Clone this repo

		git clone https://github.com/camfowler/trello-card-printer.git trello-card-printer
		cd trello-card-printer

2. In Trello, subscribe to the lists you want to print.

3. Run

		./print.sh

4. Print `index.html` from your web browser.

## Card formatting rules

- Trello card printer will print the description up until the first horizontal rule.
- If there is a checklist named "Acceptance Criteria", the first few items from it will be included in the card, if there is room.
- There is a max-height on the cards when printing, so you can get 3 per A4 page.
