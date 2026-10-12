# Schematic Requirements
These are requirements for how the final circuit board needs to act.

## General Information
- This PCB is an adapter/breakout for connecting a Quantar to a Raspberry Pi and an **Arcom RC210** repeater controller
  - It also has connections for a normally-open door sensor and a **DHT11** temperature/humidity sensor which are both connected to the Pi.
- The Raspberry Pi is not the normal repeater controller. It exists for monitoring, but may occasionally be used for transmitting announcements.
- The Quantar is amateur radio hardware which receives input (RX)
  - If the input is at a level above squelch, the COS line is triggered
  - If there is a valid PL tone in the input, the PL line is triggered
- The Quantar has configurable inputs and outputs. View `quantar_configuration/Wildcard Config.html` for details of the current configuration.
  - Documentation on the wildcard functionality can be found in `quantar_configuration/[Reference]Wildcard Commands.html` and `quantar_configuration/[Reference]Wildcard States.html`
- **Controller Reference**: Arcom RC210 hardware manual in `controller_docs/rc2104_1hardware.pdf`

## Quantar Station Details
- **Model**: Motorola Quantar/Quantro
- **System Connector**: J17 (50-pin Telco connector)
- **Wildcard Option**: Required and enabled for external controller interface
- **Current Wildcard Configuration** (14 active tables):

| Table # | Description      | State(s)                        | Action(s)       | Inaction(s)   | Notes                                                                                   |
| ------- | ---------------- | ------------------------------- | --------------- | ------------- | --------------------------------------------------------------------------------------- |
| 1       | SETUP            | WARM RESET OR COLD RESET        | RX1+AUXRX ON    |               | Setup basic config on startup                                                           |
| 2       | POWER TRIP       | REFL PWR ALARM OR FWD PWR ALARM | TX INHIBIT      | NULL          | Inhibit TX if forward power too low or reflected power too high (does not reset itself) |
| 3       | IN1              | INPUT 1                         | RF TONE ON 600  | RF TONE OFF   | TESTING                                                                                 |
| 4       | IN2              | INPUT 2                         | RF TONE ON 800  | RF TONE OFF   | TESTING                                                                                 |
| 5       | IN3              | INPUT 3                         | RF TONE ON 1000 | RF TONE OFF   | TESTING                                                                                 |
| 6       | IN4              | INPUT 4                         | RF TONE ON 1200 | RF TONE OFF   | TESTING                                                                                 |
| 7       | IN5 - TX DISABLE | INPUT 5                         | TX INHIBIT      | TX ENABLE     |                                                                                         |
| 8       | IN6              | INPUT 6                         | RF TONE ON 1600 | RF TONE OFF   | TESTING                                                                                 |
| 9       | IN7 - PL ENABLE  | INPUT 7                         | TX PL ENABLE    | TX PL DISABLE |                                                                                         |
| 10      | IN9 - PTT        | INPUT 9                         | KEY FROM WL     | DEKEY FROM WL |                                                                                         |
| 11      | OUT1 - STN ALRM  | STN ALARM OR TX INHIBITED       | SET OUTPUT 1    | CLR OUTPUT 1  | Station Alarm = OR of all other alarms                                                  |
| 12      | OUT2             | LINE PTT                        | SET OUTPUT 2    | CLR OUTPUT 2  | TESTING                                                                                 |
| 13      | OUT3 - PL DETECT | RX PL DETECT                    | SET OUTPUT 3    | CLR OUTPUT 3  | Output if squelch broken (carrier detected)                                             |
| 14      | OUT7 - COS/COR   | RX CAR DETECT                   | SET OUTPUT 7    | CLR OUTPUT 7  | Output if PL detected                                                                   |

- **Key Quantar Behaviors**:
  - Detects signal on PTT which triggers transmit (TX)
  - If TX Inhibit is asserted, transmitter is disabled even if PTT is asserted
  - Outputs RX audio from the airwaves
  - Inputs TX audio which is fed to the radio transmitter
  - Details in [Winrss help](../Winrss help - W9CR.mhtml)
  - The telco 50-pin connectors are bulky and expensive, so we use 0.1" dupont connections crimped onto wires and pins on the PCB

## Quantar Electrical Signal Specifications (from Part 15 Station Interfacing)

### Audio Signals

#### Line 1 (Balanced Phone Line Input) - J17 Pins 1 & 26
- **Type**: Balanced differential input
- **Impedance**: 600Ω (factory default, jumper-configurable on Wireline Interface Board)
- **Phone Line Types**: Type 5 or "3002" specifications
- **Frequency Response**: 300-3000 Hz (voice band)
- **Usage**: Primary wireline audio input to station transmitter

#### Aux TX Audio (Unbalanced Input) - J17 Pin 5
- **Type**: Unbalanced input
- **Impedance**: 470Ω
- **Voltage Range**: -4.1V to +4.1V (peak)
- **Frequency Range**: 250 Hz to 3 kHz
- **Alignment**: 1 kHz tone at -10 dBm = 60% deviation
- **Wildcard**: Requires Table 4 edit (INPUT 9 → AUXTX-TXON / AUXTX-TXOFF)

#### Aux PL Audio (Unbalanced Input) - J17 Pin 5 (alternate)
- **Type**: Unbalanced input
- **Impedance**: 470Ω
- **Voltage Range**: -4.1V to +4.1V (peak)
- **Frequency Range**: 5 Hz to 3 kHz (includes sub-audible PL tones)
- **Alignment**: -10 dBm = 20% deviation (summed with Line 1 audio)
- **Wildcard**: Requires Table 4 edit (INPUT 9 → AUXPL+TX ON / AUXPL+TX OFF)

#### Aux RX Audio (Unbalanced Output) - J17 Pin 30
- **Type**: Unbalanced output from op-amp
- **Output Impedance**: <5Ω
- **Voltage Range**: 0 to 6.6V P-P
- **Frequency Range**: 0 to 6 kHz
- **Wildcard**: Requires Table 9 edit (COLD RESET OR WARM RESET → =RXDSC-AUXRXON)

### Digital/Control Signals

#### Carrier Indication (COS/COR) - J17 Pins 18 & 43 (Default)
- **Type**: Relay contact closure output (N.O.)
- **Circuit**: 5V through 3.9kΩ to pin 18, pin 43 to ground
- **Alternative**: Can be moved to J17 Pin 38 as transistor-buffered output (Wildcard Table 8: change from 7 to 3)
- **Current Configuration**: Table 14 uses RX CAR DETECT → SET OUTPUT 7 (Pin 43 = Aux Out 7 -)

#### PTT Input - J17 Pins 22 & 47 (Default)
- **Type**: Opto-isolated input
- **Circuit**: 5V through 100kΩ to pin 22, pin 47 to optocoupler
- **Alternative**: Can be moved to J17 Pin 42 as transistor-buffered input (Wildcard Table 4: change from 9 to 8)
- **Current Configuration**: Table 10 uses INPUT 9 → KEY FROM WL / DEKEY FROM WL (Pin 47 = Aux In 9 -)

#### Aux Inputs (Transistor Buffered) - J17 Pins 11-17
- **Type**: Transistor-buffered inputs (5V logic)
- **Pins**: 11 (Aux In 1), 12 (Aux In 2), 13 (Aux In 3), 14 (Aux In 4), 15 (Aux In 5), 16 (Aux In 6), 17 (Aux In 7)
- **Voltage**: 5V logic levels
- **Current Configuration**: Tables 3-9 map INPUT 1-7 to various test tones and functions

#### Aux Outputs (Transistor Buffered) - J17 Pins 36-38
- **Type**: Transistor-buffered outputs (open collector, 5V)
- **Pins**: 36 (Aux Out 1), 37 (Aux Out 2), 38 (Aux Out 3)
- **Current Configuration**: 
  - Table 11: STN ALARM OR TX INHIBITED → SET/CLR OUTPUT 1 (Pin 36)
  - Table 12: LINE PTT → SET/CLR OUTPUT 2 (Pin 37)
  - Table 13: RX PL DETECT → SET/CLR OUTPUT 3 (Pin 38)

#### Aux Output 7 (Relay) - J17 Pins 18 & 43
- **Type**: Relay contact closure (same as Carrier Indication default)
- **Pin 18**: Aux Out 7 + (5V through relay coil)
- **Pin 43**: Aux Out 7 - (relay contact to ground)
- **Current Configuration**: Table 14: RX CAR DETECT → SET/CLR OUTPUT 7

#### Aux Input 9 (Opto-coupled) - J17 Pins 22 & 47
- **Type**: Opto-coupled differential input (same as PTT default)
- **Pin 22**: Aux In 9 +
- **Pin 47**: Aux In 9 -
- **Current Configuration**: Table 10: INPUT 9 → KEY FROM WL / DEKEY FROM WL

### Power Supply
- **Quantar Provides**: 
  - 5V DC Out (J17 Pin 8) - limited current
  - 14.2V (station supply voltage)
- **Raspberry Pi**: Independent 5V/3.3V supply (separate from Quantar)
- **Ground**: Shared GND between Quantar and Pi (only common connection)
- **Power Architecture**: Independent supplies, shared GND only

## Controller Details (Arcom RC210)
- **Type**: Arcom RC210 repeater controller
- **Connector**: Female DB-9 (radio port) — PCB uses **male DB-9**
- **Logic**: 
  - If COS and PL In are asserted, routes RX audio to TX audio and asserts PTT
  - Occasionally asserts PTT and plays recorded station identification audio
  - Does not know about or use RX Inhibit; will assert PTT even if Pi is asserting TX Inhibit
- **Logic Inputs**: High impedance (>10K ohms), accepts 5-15V (logic high) or <0.6V (logic low)
- **Logic Outputs**: 30V @ 100mA open-drain JFET
- **Audio Inputs**: High impedance >10K, ~100mV p-p for auxiliary inputs
- **Audio Outputs**: Up to 6V p-p
- **COS/CTCSS Polarity**: Selectable via jumpers (JP1-JP6) for Active High or Active Low

### Controller DB-9 Pinout (Radio Port)
| DB-9 Pin | RJ-45 Pin | Direction | Signal | Notes |
| -------- | --------- | --------- | ------ | ----- |
| 1 | 1 | **Out** (Controller → Radio) | CTCSS Encode Control | To Quantar PL Enable (Aux In 7) |
| 2 | 2 | **In** (Radio → Controller) | CTCSS Decoder Logic | From Quantar PL Detect (Aux Out 3) |
| 3 | 3 | **Out** (Controller → Radio) | TX PTT | To Quantar PTT (Aux In 9) |
| 4 | 4 | **Out** (Controller → Radio) | TX Audio | To Quantar Aux TX Audio (Pin 5) / Line 1 |
| 5 | 5 | **In** (Radio → Controller) | RX Audio | From Quantar Aux RX Audio (Pin 30) / Line 2 |
| 6 | 6 | — | Ground | Shared |
| 7 | 7 | **In** (Radio → Controller) | RX COS Logic | From Quantar COS (Aux Out 7) |
| 8 | 8 | — | Ground | Shared |
| 9 | — | — | Ground | Shared |

## Raspberry Pi Details
- **Model**: Raspberry Pi 4 (3.3V GPIO logic)
- **Power**: Independent 5V supply (separate from Quantar)
- **GPIO Connections** (from connections.md):
  - GPIO 17 (Pin 11): Quantar In 1 (Aux In 1)
  - GPIO 27 (Pin 13): Quantar In 2 (Aux In 2)
  - GPIO 22 (Pin 15): Quantar In 3 (Aux In 3)
  - GPIO 23 (Pin 16): Quantar In 4 (Aux In 4)
  - GPIO 24 (Pin 18): Quantar In 5 (Aux In 5)
  - GPIO 25 (Pin 22): Quantar In 6 (Aux In 6)
  - GPIO 10 (Pin 19): Quantar Out 1 (Aux Out 1)
  - GPIO 9 (Pin 21): Quantar Out 2 (Aux Out 2)
  - GPIO 11 (Pin 23): PTT Output (Pi → Quantar, shared with controller)
  - GPIO 8 (Pin 24): PL Enable Output (Pi → Quantar, shared with controller)
  - GPIO 7 (Pin 26): COS Input (Quantar → Pi, shared with controller)
  - GPIO 5 (Pin 29): PL Detect Input (Quantar → Pi, shared with controller)
  - GPIO 4 (Pin 7): **PTT Monitor Input** (Quantar PTT line → Pi, 5V→3.3V level shifted)
  - GPIO 12 (Pin 32): **PL Enable Monitor Input** (Quantar PL Enable line → Pi, 5V→3.3V level shifted)
  - GPIO 13 (Pin 33): **Door Sensor Input** (5V→3.3V level shifted via 74LVC8T245)
  - GPIO 6 (Pin 31): DHT11 Data (single-wire protocol)
- **Functions**:
  - Can assert TX Inhibit if there is an issue and repeater needs to be disabled
  - Reads door sensor (normally-open, with 4.7k pullup to 5V, level-shifted to 3.3V)
  - Reads DHT11 temperature/humidity sensor (3.3V VCC, GND, Data)
  - Occasionally asserts PTT and sends TX audio for announcements
  - **Monitors controller PTT and PL Enable activity** via dedicated GPIO inputs

## Signal Type Summary & Level Shifting Requirements

| Signal                                    | Quantar Side                     | Pi/Controller Side              | Level Shifting Required                      | Solution                                                    |
| ----------------------------------------- | -------------------------------- | ------------------------------- | -------------------------------------------- | ----------------------------------------------------------- |
| **Transistor Inputs (In 1-6)**            | 5V logic (Aux In 1-6)            | 3.3V GPIO (Pi)                  | **YES** - 3.3V → 5V                          | **74LVC8T245** (dual-supply, 8-ch, DIR pin)                 |
| **Transistor Input (In 7 - PL Enable)**   | 5V logic (Aux In 7)              | 3.3V GPIO (Pi + Controller)     | **YES** - 3.3V → 5V (shared)                 | **2N7002 MOSFET** (open-drain, wired-OR with Controller)    |
| **Opto-coupled Input (PTT/In 9)**         | Opto-isolated diff. (pins 22/47) | 3.3V GPIO (Pi + Controller)     | **YES** - Drive opto LED                     | **Opto-coupler driver** (see PTT Implementation below)      |
| **Transistor Outputs (Out 1-2)**          | 5V open collector (Aux Out 1-2)  | 3.3V GPIO (Pi)                  | **YES** - 5V → 3.3V                          | **74LVC8T245** (dual-supply, 8-ch, DIR pin)                 |
| **Transistor Output (Out 3 - PL Detect)** | 5V open collector (Aux Out 3)    | 3.3V GPIO (Pi + Controller)     | **YES** - 5V → 3.3V (shared)                 | **4.7kΩ pull-up to 3.3V** (passive, shared with Controller) |
| **Relay Output (Out 7 / COS)**            | Relay contact (pins 18/43)       | 3.3V GPIO (Pi + Controller)     | **YES** - Relay → 3.3V (shared)              | **4.7kΩ pull-up to 3.3V** (passive, shared with Controller) |
| **Line 1 Audio (Balanced)**               | 600Ω balanced, phone line levels | Controller (TX Audio)           | **NO** - Direct connection                   | Controller has internal adjustment                          |
| **Aux TX Audio**                          | 470Ω unbalanced, ±4.1V           | Controller (TX Audio) / Pi      | **YES** - Level adjust, AC couple            | Voltage divider + potentiometer for Pi                      |
| **Aux PL Audio**                          | 470Ω unbalanced, ±4.1V           | Controller (CTCSS Out)          | **YES** - Level adjust, AC couple            | Voltage divider + potentiometer for Pi                      |
| **Aux RX Audio**                          | <5Ω unbalanced, 0-6.6Vpp         | Controller (RX Audio) / Pi      | **YES** - Attenuate to line level, AC couple | Voltage divider + potentiometer for Pi                      |
| **Door Sensor**                           | N.O. contact                     | 3.3V GPIO (Pi)                  | **YES** - 5V → 3.3V                          | **74LVC8T245** (spare channel, 5V→3.3V, 4.7k pullup to 5V) |
| **DHT11 Sensor**                          | 3.3V single-wire                 | 3.3V GPIO (Pi)                  | **NO** - Direct (already 3.3V)               | Direct (with 4.7kΩ pull-up on data line)                    |
| **PTT Monitor**                           | Opto-coupled (Pin 47)            | 3.3V GPIO (Pi)                  | **YES** - 5V → 3.3V                          | **74LVC8T245** (spare channel, 5V→3.3V) — **passive tap, no wildcard change** |
| **PL Enable Monitor**                     | Transistor-buffered (Pin 17)     | 3.3V GPIO (Pi)                  | **YES** - 5V → 3.3V                          | **74LVC8T245** (spare channel, 5V→3.3V) — **passive tap, no wildcard change** |

## Level Shifting Strategy (DECIDED)

### Digital Signals - No Bidirectional Level Shifters
**Bidirectional level shifters (TXS0108E) are NOT used** on shared lines because they would cause contention with the controller. The Quantar's transistor-buffered inputs have 10kΩ pull-ups to 5V and expect open-collector/open-drain drivers.

| Channel Group                 | Count | Direction             | Solution                               | Components                                           |
| ----------------------------- | ----- | --------------------- | -------------------------------------- | ---------------------------------------------------- |
| Pi → Quantar (Aux In 1-6)     | 6     | 3.3V → 5V             | **Dual-supply unidirectional buffer**  | **1× 74LVC8T245** (8-ch, DIR pin, VCCA=3.3V, VCCB=5V) |
| Pi → Quantar (PL Enable)      | 1     | 3.3V → 5V (shared)    | **Discrete 2N7002 MOSFET** (wired-OR)  | 1× 2N7002 (SOT-23) + Quantar's internal 10kΩ pull-up |
| Pi → Quantar (PTT)            | 1     | 3.3V → Opto LED       | **Opto-coupler driver circuit**        | See PTT Implementation below                         |
| Quantar → Pi (Aux Out 1-2)    | 2     | 5V → 3.3V             | **Dual-supply unidirectional buffer**  | **1× 74LVC8T245** (8-ch, DIR pin, VCCA=3.3V, VCCB=5V) |
| Quantar → Pi (PL Detect, COS) | 2     | 5V OC → 3.3V (shared) | **Passive pull-up to 3.3V**            | 4× 4.7kΩ resistors (2 per line for Pi + Controller)  |
| Quantar → Pi (PTT Monitor)    | 1     | 5V → 3.3V             | **Dual-supply unidirectional buffer**  | Spare channel on 2nd 74LVC8T245 — **passive tap**    |
| Quantar → Pi (PL Enable Mon)  | 1     | 5V → 3.3V             | **Dual-supply unidirectional buffer**  | Spare channel on 2nd 74LVC8T245 — **passive tap**    |
| Door Sensor (5V → Pi)         | 1     | 5V → 3.3V             | **Dual-supply unidirectional buffer**  | Spare channel on 2nd 74LVC8T245 (4.7kΩ pullup to 5V) |

### PTT Implementation (Quantar Aux In 9 - Opto-Coupled Differential)
**Quantar PTT (Pins 22/47) is an opto-isolated differential input**, not a transistor-buffered input:
- **Pin 22 (Aux In 9 +)**: Anode of optocoupler LED via 7.8kΩ (3.9kΩ + 3.9kΩ) to +5V
- **Pin 47 (Aux In 9 -)**: Cathode of optocoupler LED
- **To assert PTT**: Drive current through LED (Pin 22 → LED → Pin 47 → GND)
- **Controller drives this differentially** (connects to both Pin 22 and Pin 47)

**PCB Implementation Options:**
1. **Option A (Recommended)**: Use a small signal transistor (2N3904) or MOSFET to drive the optocoupler differentially
   - Pi GPIO → base resistor → 2N3904 collector to Pin 47, emitter to GND
   - Pin 22 connected to +5V (from Quantar Pin 8 or Pi 5V via diode)
   - Controller cable connects to both Pin 22 and Pin 47
2. **Option B**: Buffer the Controller's PTT output and OR with Pi's PTT using diodes
   - Both Pi and Controller drive the optocoupler cathode (Pin 47) via diodes
   - Pin 22 tied to +5V

**Selected**: Option A — Pi drives a 2N3904/2N7002 to pull Pin 47 LOW while Pin 22 is held at +5V. Controller cable provides its own differential drive.

### Key Design Decisions
1. **No TXS0108E/TXB0108** - Bidirectional auto-direction sensing conflicts with controller driving shared lines
2. **74LVC8T245 for all Pi↔Quantar level shifting** - Dual-supply (VCCA=3.3V, VCCB=5V), 8 channels, DIR pin controls direction. Use **2× 74LVC8T245** (one for Pi→Quantar, one for Quantar→Pi)
3. **2N7002 MOSFET for PL Enable (shared input)** - Allows both Pi and Controller to pull Quantar Aux In 7 LOW independently (wired-OR), Quantar's internal 10kΩ pull-up provides HIGH
4. **PTT uses opto-coupler driver** - Quantar PTT is opto-isolated differential; Pi drives cathode via transistor, Pin 22 held at +5V
5. **Passive pull-ups for shared outputs** - Quantar outputs are open-collector; 4.7kΩ to 3.3V lets both Pi and Controller read safely
6. **Level shifters powered from Pi's 5V** (VCCA=3.3V from Pi 3.3V rail, VCCB=5V from Pi 5V rail)

### Audio Signals
- **Line 1/2 (Balanced)**: Direct connection to Controller DB-9 (no transformer, controller has internal adjustment)
- **Aux TX/PL/RX Audio**: AC-coupled voltage dividers **with potentiometers** for Pi level adjustment (3 channels: TX, PL, RX)
  - Series coupling capacitors (10µF electrolytic + 0.1µF ceramic)
  - Voltage divider: Quantar ±4.1V → Pi ~1V (adjustable via 10kΩ potentiometer)
  - Series resistor (1kΩ) on Pi output to prevent back-driving controller
- **Pi USB Sound Interface**: 3.5mm TRRS direct connection (standard headset levels)

## Connector Requirements

### Quantar Side (J17 - 50 pin Telco)
- **PCB Side**: 0.1" (2.54mm) pitch male pin headers (dupont compatible)
- **Pins Used**: 1, 2, 5, 7, 8, 11, 12, 13, 14, 15, 16, 17, 18, 22, 26, 30, 36, 37, 38, 43, 47 (20 pins)
- **Connection Method**: Crimped dupont wires from Quantar J17 to PCB headers

### Controller Side
- **PCB Side**: DB-9 male (to mate with controller's female DB-9)
- **Audio**: Direct connection (no transformer needed) - controller has internal RX/TX audio adjustment

### Raspberry Pi Side
- **Model**: Raspberry Pi 4 (3.3V GPIO logic)
- **PCB Side**: 2x20 0.1" header (standard Pi GPIO)
- **Connection**: Direct plug-in or ribbon cable
- **Power**: Independent 5V supply (separate from Quantar)
- **Level Shifters**: Powered from Pi's 5V supply

### Sensors
- **Door Sensor**: 2-pin 0.1" header (GND + Signal with pullup)
- **DHT11**: 3-pin 0.1" header (GND, 3.3V, Data) — single-wire protocol, 4.7kΩ pull-up on data line

### Audio Monitoring (Pi USB Sound Interface)
- **Connector**: 3.5mm TRRS jack (standard headset pinout)
- **Pinout**: Tip=Left (RX audio), Ring1=Right (TX audio monitor), Ring2=GND, Sleeve=Mic (TX audio from Pi)
- **Levels**: Standard headset levels (compatible with USB sound card)
- **Purpose**: Monitoring and Pi TX audio injection

## PCB Design Constraints
- **Environment**: Air-conditioned, room temperature (no extreme temp requirements)
- **Size**: No specific size constraints
- **Layers**: 2-4 layer (4 preferred for audio ground planes)
- **Audio Traces**: Controlled impedance for balanced lines, keep audio traces away from digital
- **Ground**: Single shared ground plane (Quantar GND = Pi GND = Controller GND)
- **Power**: Separate power planes/regions for Quantar 5V, Pi 5V, Pi 3.3V
- **Mounting**: 4× M3 mounting holes (one in each corner)
- **Test Points**: 
  - GND
  - Quantar 5V
  - Pi 5V
  - RX Audio
  - TX Audio
- **Indicators**: LEDs for PTT, COS, PL (with current-limiting resistors)
- **Silkscreen**: Generic labels initially, detailed labels can be added later
- **ESD Protection**: TVS diodes on all external connectors (DB-9, Quantar header, sensor headers, TRRS jack)
- **Fuse/PTC**: Not required for now

## Wildcard Reprogramming Notes
The current wildcard configuration uses test tones for inputs 1-6. For production use, these should be reprogrammed per the **minimal wildcard configuration** documented in `planning-docs/minimal-wildcard-config.md`.

Key changes from current config:
- **Tables 3-6, 8**: Replace test tones with Pi status inputs (available for future use)
- **Table 7**: Keep TX Inhibit (already correct)
- **Table 9**: Keep PL Enable (already correct)
- **Table 10**: Keep PTT (already correct)
- **Table 11**: Keep Station Alarm (already correct)
- **Table 12**: Repurpose from LINE PTT to Pi monitoring
- **Table 13**: Keep PL Detect (already correct)
- **Table 14**: Keep COS/CAR Detect (already correct)
- **New Table 15**: Enable Aux RX Audio on Pin 30
- **New Table 16**: Enable Aux TX Audio on Pin 5 (triggered by PTT)

See `planning-docs/minimal-wildcard-config.md` for complete table definitions.

## Complete Pin Mapping (from connections.md)

| Adapter Bank | Adapter Pin | Description                  | Destination Device      | Destination Pin | Quantar Pin | Quantar Name  | Wire Color    |
| ------------ | ----------- | ---------------------------- | ----------------------- | --------------- | ----------- | ------------- | ------------- |
| Input        | 1           | GND                          | Shared                  | GND             | 7           | GND           | orange/red    |
| Input        | 2           | In 1                         | Pi                      | 17              | 11          | Aux In 1      | blue/black    |
| Input        | 3           | In 2                         | Pi                      | 27              | 12          | Aux In 2      | orange/black  |
| Input        | 4           | In 3                         | Pi                      | 22              | 13          | Aux In 3      | green/black   |
| Input        | 5           | In 4                         | Pi                      | 23              | 14          | Aux In 4      | brown/black   |
| Input        | 6           | In 5                         | Pi                      | 24              | 15          | Aux In 5      | slate/black   |
| Input        | 7           | In 6                         | Pi                      | 25              | 16          | Aux In 6      | blue/yellow   |
| Input        | 8           | Out 1                        | Pi                      | 10              | 36          | Aux Out 1     | black/blue    |
| Input        | 9           | Out 2                        | Pi                      | 9               | 37          | Aux Out 2     | black/orange  |
| Input        | 10          | 5V                           | Shared                  | 5V              | 8           | 5V DC Out     | green/red     |
| Input        | 11          | RX Audio                     | Controller DB9          | 5               | 30          | Aux RX Audio  | white/slate   |
| Input        | 12          | TX Audio                     | Controller DB9          | 4               | 5           | Aux TX Audio  | slate/white   |
| Input        | 13          | PTT                          | Controller DB9:3, Pi:11 | 47/22           | Aux In 9 -/+ | violet/orange |               |
| Input        | 14          | Ctrlr PL Out                 | Controller DB9:1, Pi:8  | 17              | Aux In 7    | orange/yellow |               |
| Input        | 15          | COS                          | Controller DB9:7, Pi:7  | 43              | Aux Out 7 - | yellow/green  |               |
| Input        | 16          | Ctrlr PL In                  | Controller DB9:2, Pi:5  | 38              | Aux Out 3   | black/green   |               |
| Input        | 17          | Ctrlr TX Audio               | Controller DB9:4        | 1               | Line 1 +    | blue/white    |               |
| Input        | 18          | Ctrlr RX Audio               | Controller DB9:5        | 2               | Line 2 +    | orange/white  |               |
| Input        | 19          | 5V                           |                         |                 | 18          | Aux Out 7 +   | green/yellow  |
| Input        | 20          | 5V                           |                         |                 | 22          | Aux In 9 +    | orange/violet |
| Door Sensor  | Top         | GND                          | Shared                  | GND             |             |               |               |
| Door Sensor  | Bottom      | Signal (4.7k pullup to 5V)   | Pi (via 74LVC8T245)     | 13              |             |               | Level shifted 5V→3.3V |
| Temp Sensor  | Left        | GND                          | Shared                  | GND             |             |               |               |
| Temp Sensor  | Middle      | VCC (3.3V)                   | Shared                  | 3.3V            |             |               |               |
| Temp Sensor  | Right       | Data                         | Pi                      | 6               |             |               | DHT11         |

## Design Deliverables
1. **Schematic** (KiCad): Complete with all connectors, level shifters, audio circuits, sensor interfaces
2. **PCB Layout** (KiCad): 2-4 layer, proper audio routing, connector placement
3. **BOM**: All components with part numbers (level shifters, connectors, passives, transformers/op-amps)
4. **Fabrication Files**: Gerbers, drill files, assembly drawings
5. **Wildcard Programming Guide**: Document the required wildcard table changes for production use
