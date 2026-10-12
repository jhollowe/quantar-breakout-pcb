 | Pin # | Signal Name   | I/O            | Type                   | Default Signal    | Note           | telco color   |
 | ----- | ------------- | -------------- | ---------------------- | ----------------- | -------------- | ------------- |
 | 1     | Line 1 +      | Input          | \-/+ Audio             |                   |                | blue/white    |
 | 2     | Line 2 +      | Input & Output | \-/+ Audio             |                   |                | orange/white  |
 | 3     | Line 3 +      | Input          | \-/+ Audio             |                   |                | green/white   |
 | 4     | Line 4 +      | Output         | \-/+ Audio             |                   |                | brown/white   |
 | 5     | Aux TX Audio  | Input          | \-/+ Audio             |                   | GND other side | slate/white   |
 | 6     | Open          |                |                        |                   |                | blue/red      |
 | 7     | GND           |                |                        |                   |                | orange/red    |
 | 8     | 5v DC Out     | Output         |                        |                   |                | green/red     |
 | 9     | Gen TX Data - | Output         |                        |                   |                | brown/red     |
 | 10    | PL (+) In     | Input          |                        |                   | Future Use     | slate/red     |
 | 11    | Aux In 1      | Input          | Transistor Input (5v)  | Ext Failsoft      |                | blue/black    |
 | 12    | Aux In 2      | Input          | Transistor Input (5v)  | TX Inhibit        |                | orange/black  |
 | 13    | Aux In 3      | Input          | Transistor Input (5v)  | Ext TX Code Det   |                | green/black   |
 | 14    | Aux In 4      | Input          | Transistor Input (5v)  | RX WL Inhibit     |                | brown/black   |
 | 15    | Aux In 5      | Input          | Transistor Input (5v)  | Duplex Enable     |                | slate/black   |
 | 16    | Aux In 6      | Input          | Transistor Input (5v)  | In Cabinet Repeat |                | blue/yellow   |
 | 17    | Aux In 7      | Input          | Transistor Input (5v)  | Channel 4         |                | orange/yellow |
 | 18    | Aux Out 7 +   | Output         | N.O. Relay (\*v)       | RD Sat +          |                | green/yellow  |
 | 19    | Aux Out 8 +   | Output         | N.O. Relay (\*v)       |                   |                | brown/yellow  |
 | 20    | Aux Out 9 +   | Output         | N.O. Relay (\*v)       |                   |                | slate/yellow  |
 | 21    | Aux Out 10 +  | Output         | N.O. Relay (\*v)       |                   |                | blue/violet   |
 | 22    | Aux In 9 +    | Input          | Opto Isolated (\*v)    | Ext PTT +         |                | orange/violet |
 | 23    | Aux In 10 +   | Input          | Opto Isolated (\*v)    | Channel 1 +       |                | green/violet  |
 | 24    | Aux In 11 +   | Input          | Opto Isolated (\*v)    | Channel 2 +       |                | brown/violet  |
 | 25    | Aux In 12 +   | Input          | Opto Isolated (\*v)    | Channel 3 +       |                | slate/violet  |
 | 26    | Line 1 -      | Input          | \-/+ Audio             |                   |                | white/blue    |
 | 27    | Line 2 -      | Input & Output | \-/+ Audio             |                   |                | white/orange  |
 | 28    | Line 3 -      | Input          | \-/+ Audio             |                   |                | white/green   |
 | 29    | Line 4 -      | Output         | \-/+ Audio             |                   |                | white/brown   |
 | 30    | Aux RX Audio  | Output         | \-/+ Audio             |                   | GND other side | white/slate   |
 | 31    | Open          |                |                        |                   |                | red/blue      |
 | 32    | GND           |                |                        |                   |                | red/orange    |
 | 33    | 14.2v DC Out  | Output         |                        |                   | 1 Amp Max      | red/green     |
 | 34    | Gen TX Data + |                |                        |                   |                | red/brown     |
 | 35    | PL (-) In     |                |                        |                   | Future Use     | red/slate     |
 | 36    | Aux Out 1     | Output         | Transistor Output (5v) | Failsoft Ind      |                | black/blue    |
 | 37    | Aux Out 2     | Output         | Transistor Output (5v) | RX Code Det       |                | black/orange  |
 | 38    | Aux Out 3     | Output         | Transistor Output (5v) |                   |                | black/green   |
 | 39    | Aux Out 4     | Output         | Transistor Output (5v) |                   |                | black/brown   |
 | 40    | Aux Out 5     | Output         | Transistor Output (5v) |                   |                | black/slate   |
 | 41    | Aux Out 6     | Output         | Transistor Output (5v) |                   |                | yellow/blue   |
 | 42    | Aux In 8      | Input          | Transistor Input (5v)  |                   |                | yellow/orange |
 | 43    | Aux Out 7 -   | Output         | N.O. Relay (\*v)       | RD Stat -         |                | yellow/green  |
 | 44    | Aux Out 8 -   | Output         | N.O. Relay (\*v)       |                   |                | yellow/brown  |
 | 45    | Aux Out 9 -   | Output         | N.O. Relay (\*v)       |                   |                | yellow/slate  |
 | 46    | Aux Out 10 -  | Output         | N.O. Relay (\*v)       |                   |                | voilet/blue   |
 | 47    | Aux In 9 -    | Input          | Opto Isolated (\*v)    | Ext PTT -         |                | voilet/orange |
 | 48    | Aux In 10 -   | Input          | Opto Isolated (\*v)    | Channel 1 -       |                | voilet/green  |
 | 49    | Aux In 11 -   | Input          | Opto Isolated (\*v)    | Channel 2 -       |                | voilet/brown  |
 | 50    | Aux In 12 -   | Input          | Opto Isolated (\*v)    | Channel 3 -       |                | voilet/slate  |


| type               | meaning                                           |
| ------------------ | ------------------------------------------------- |
| Transistor Input   | pull to +5v for HIGH                              |
| Opto-coupled Input | \- to GND and + to voltage (3.3v should be fine?) |
| Transistor Output  | pulled to 0v when ????                            |
| N.O. Relay Output  | Connects the + and - pins when signal is HIGH     |
