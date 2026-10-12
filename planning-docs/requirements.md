# Schematic Requirements
These are requirements for how the final circuit board needs to act.

## General Information
- This PCB is an adapter/breakout for connecting a quantar to a raspberry pi and a generic radio repeater controller
  - it also has connections for a normally-open door sensor and a DHT12 temperature sensor which are both connected to the Pi.
- The Raspberry Pi is not the normal repeater controller. It exists for monitoring, but may occasionally be used for transmitting announcements.
- the Quantar is amateur radio hardware which recieves input (RX)
  - if the input is at a level above squelch, the COS line is triggered
  - if there is a valid PL tone in the input, the PL line is triggered
- The Quantar has configurable inputs and outputs. View `quantar_configuration/Wildcard Config.html` for details of the current configuration.
  - documentation on the wildcard functionality can be found in `quantar_configuration/[Reference]Wildcard Commands.html` and `quantar_configuration/[Reference]Wildcard States.html`

## Quantar
- detects a signal on PTT which triggers transmit (TX)
- if TX Inhibit is asserted, the transmitter is disabled, even if PTT is asserted
- outputs RX audio from the airwaves
- inputs TX audio which is fed to the radio transmitter
- details of how it works can be found in [Winrss help](../Winrss help - W9CR.mhtml)
- the telco 50 pin connectors are bulky and expensive, so we can just use 0.1" dupont connections crimped onto the wires and pins on the PCB to get the connection.


## Controller
- if COS and PL In are asserted, it will route RX audio to TX audio and assert PTT
- will occasionally assert PTT and play recorded station identification pre-recorded audio
- does not know about or use the RX Inhibit; It will assert PTT even if the Pi is asserting TX Inhibit
- Has a female DB-9 port on it, but we can use male-male or male-female cables, so the pcb can use either connector gender.


## Pi
- can assert TX Inhibit if there is an issue and the repeater needs to be disabled
- reads the door sensor and temperature/humidity sensor
- will occasionally assert PTT and send TX audio for announcements.
