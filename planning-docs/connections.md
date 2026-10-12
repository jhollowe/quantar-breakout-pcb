| Adapter Bank    | Adapter Pin | Description                  | Destination Device | Destination Pin | Destination2 Device | Destination2 Pin | Quantar Pin | Quantar Name | color (main/stripe) |
| --------------- | ----------- | ---------------------------- | ------------------ | --------------- | ------------------- | ---------------- | ----------- | ------------ | ------------------- |
| Input           | 1           | GND                          | Shared             | GND             |                     |                  | 7           | GND          | orange/red          |
| Input           | 2           | In 1                         | Pi                 | 17              |                     |                  | 11          | Aux In 1     | blue/black          |
| Input           | 3           | In 2                         | Pi                 | 27              |                     |                  | 12          | Aux In 2     | orange/black        |
| Input           | 4           | In 3                         | Pi                 | 22              |                     |                  | 13          | Aux In 3     | green/black         |
| Input           | 5           | In 4                         | Pi                 | 23              |                     |                  | 14          | Aux In 4     | brown/black         |
| Input           | 6           | In 5                         | Pi                 | 24              |                     |                  | 15          | Aux In 5     | slate/black         |
| Input           | 7           | In 6                         | Pi                 | 25              |                     |                  | 16          | Aux In 6     | blue/yellow         |
| Input           | 8           | Out 1                        | Pi                 | 10              |                     |                  | 36          | Aux Out 1    | black/blue          |
| Input           | 9           | Out 2                        | Pi                 | 9               |                     |                  | 37          | Aux Out 2    | black/orange        |
| Input           | 10          | 5v                           | Shared             | 5v              |                     |                  | 8           | 5v DC Out    | green/red           |
| Input           | 11          | RX Audio                     | Controller DB9     | 5               |                     |                  | 30          | Aux RX Audio | white/slate         |
| Input           | 12          | TX Audio                     | Controller DB9     | 4               |                     |                  | 5           | Aux TX Audio | slate/white         |
| Input           | 13          | PTT                          | Controller DB9     | 3               | Pi                  | 11               | 47          | Aux In 9 -   | voilet/orange       |
| Input           | 14          | Ctrlr PL Out                 | Controller DB9     | 1               | Pi                  | 8                | 17          | Aux In 7     | orange/yellow       |
| Input           | 15          | COS                          | Controller DB9     | 7               | Pi                  | 7                | 43          | Aux Out 7 -  | yellow/green        |
| Input           | 16          | Ctrlr PL In                  | Controller DB9     | 2               | Pi                  | 5                | 38          | Aux Out 3    | black/green         |
| Input           | 17          | Ctrlr TX Audio               | Controller DB9     | 4               |                     |                  | 1           | Line 1 +     | blue/white          |
| Input           | 18          | Ctrlr RX Audio               | Controller DB9     | 5               |                     |                  | 2           | Line 2 +     | orange/white        |
| Input           | 19          | 5v                           |                    |                 |                     |                  | 18          | Aux Out 7 +  | green/yellow        |
| Input           | 20          | 5v                           |                    |                 |                     |                  | 22          | Aux In 9 +   | orange/violet       |
| door sensor     | top         | GND                          | Shared             | GND             |                     |                  |             |              |                     |
| door sensor     | bottom      | has 2.2k pullup to 3.3v      | Pi                 | 13              |                     |                  |             |              |                     |
| temp sensor     | left        | GND                          | Shared             | GND             |                     |                  |             |              |                     |
| temp sensor     | middle      | VCC                          | Shared             | 3.3v            |                     |                  |             |              |                     |
| temp sensor     | right       | Data                         | Pi                 | 6               |                     |                  |             |              |                     |
| Controller DB9  | 1           | CTCSS Out                    |                    |                 |                     |                  |             |              |                     |
| Controller DB9  | 2           | CTCSS In                     |                    |                 |                     |                  |             |              |                     |
| Controller DB9  | 3           | PTT Out                      |                    |                 |                     |                  |             |              |                     |
| Controller DB9  | 4           | TX Audio Out                 |                    |                 |                     |                  |             |              |                     |
| Controller DB9  | 5           | RX Audio In                  |                    |                 |                     |                  |             |              |                     |
| Controller DB9  | 6           | GND                          |                    |                 |                     |                  |             |              |                     |
| Controller DB9  | 7           | COS In                       |                    |                 |                     |                  |             |              |                     |
| Controller DB9  | 8           | GND                          | Shared             | GND             |                     |                  |             |              |                     |
| Controller DB9  | 9           | GND                          | Shared             | GND             |                     |                  |             |              |                     |
| Headphone       | sleeve      | mic                          |                    |                 |                     |                  |             |              |                     |
| Headphone       | ring2       | GND                          | Shared             | GND             |                     |                  |             |              |                     |
| Headphone       | ring1       | right                        |                    |                 |                     |                  |             |              |                     |
| Headphone       | tip         | left                         |                    |                 |                     |                  |             |              |                     |
| Level Shifter 2 | OE          | output enable (low for Hi-Z) | Pi                 | 12              |                     |                  |             |              |                     |
