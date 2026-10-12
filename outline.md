# Quantar Breakout PCB - Schematic Creation Outline

## Overview
Create a complete KiCad schematic for the Quantar breakout PCB that interfaces a Motorola Quantar radio with a Raspberry Pi 4 and Arcom RC210 repeater controller, plus door sensor and DHT11 temperature/humidity sensor.

---

## Phase 1: Project Setup & Library Preparation

### 1.1 KiCad Project Initialization
- [ ] Verify KiCad project files exist (quantar_breakout_v0.0.1.kicad_pro, quantar_breakout.kicad_sch)
- [ ] Set up project libraries (symbol library, footprint library)
- [ ] Configure schematic settings (paper size, title block, etc.)

### 1.2 Custom Symbol Creation
Create custom symbols for components not in standard libraries:
- [ ] **74LVC8T245** - 8-channel dual-supply voltage level translator (2 needed)
- [ ] **2N7002** - N-channel MOSFET (SOT-23) for PL Enable wired-OR
- [ ] **2N3904** - NPN transistor for PTT opto-coupler driver
- [ ] **DB-9 Male** - Connector for Arcom RC210 controller
- [ ] **50-pin Telco Header** - 0.1" pitch male pin header for Quantar J17 (20 pins used)
- [ ] **2x20 Pi GPIO Header** - Standard Raspberry Pi 40-pin header
- [ ] **3.5mm TRRS Jack** - For USB sound interface monitoring
- [ ] **Door Sensor Header** - 2-pin 0.1" header
- [ ] **DHT11 Header** - 3-pin 0.1" header
- [ ] **TVS Diode Array** - ESD protection for external connectors

---

## Phase 2: Schematic Hierarchy & Sheet Structure

### 2.1 Root Sheet (Main)
- [ ] Title block with project info
- [ ] Hierarchical sheet instances for each functional block

### 2.2 Hierarchical Sheets (Sub-sheets)
Create the following sub-sheets:
1. **Quantar Interface** - J17 50-pin connector pinout and signal routing
2. **Level Shifters (Pi → Quantar)** - 74LVC8T245 #1 for 3.3V→5V (Aux In 1-6)
3. **Level Shifters (Quantar → Pi)** - 74LVC8T245 #2 for 5V→3.3V (Aux Out 1-2, monitors, door sensor)
3. **Shared Digital I/O** - PL Enable (2N7002), PTT (2N3904 + opto), COS/PL Detect (pull-ups)
4. **Audio Circuits** - Line 1/2 balanced, Aux TX/PL/RX audio with voltage dividers & pots
5. **Controller Interface** - DB-9 male connector wiring
6. **Raspberry Pi Interface** - 2x20 GPIO header pin mapping
7. **Sensors** - Door sensor (level shifted), DHT11 (direct 3.3V)
8. **Audio Monitoring** - 3.5mm TRRS jack for USB sound card
9. **Power Distribution** - Pi 5V, Pi 3.3V, Quantar 5V, Ground planes
10. **Indicators & Test Points** - LEDs for PTT, COS, PL; test points

---

## Phase 3: Quantar Interface Sheet (J17 Connector)

### 3.1 J17 50-pin Telco Connector Symbol
- [ ] Create 20-pin subset symbol (only used pins)
- [ ] Pin mapping per connections.md:
  - Pin 1: Line 1 + (Ctrlr TX Audio)
  - Pin 2: Line 2 + (Ctrlr RX Audio)
  - Pin 5: Aux TX Audio
  - Pin 7: GND
  - Pin 8: 5V DC Out
  - Pin 11: Aux In 1
  - Pin 12: Aux In 2
  - Pin 13: Aux In 3
  - Pin 14: Aux In 4
  - Pin 15: Aux In 5 (TX Inhibit)
  - Pin 16: Aux In 6
  - Pin 17: Aux In 7 (PL Enable)
  - Pin 18: Aux Out 7 + (5V for COS relay)
  - Pin 22: Aux In 9 + (PTT +)
  - Pin 26: Line 1 - (GND reference)
  - Pin 30: Aux RX Audio
  - Pin 36: Aux Out 1 (Station Alarm)
  - Pin 37: Aux Out 2 (Pi Monitoring)
  - Pin 38: Aux Out 3 (PL Detect)
  - Pin 43: Aux Out 7 - (COS)
  - Pin 47: Aux In 9 - (PTT -)

### 3.2 Net Labels & Hierarchical Pins
- [ ] Add hierarchical pins for each signal group
- [ ] Label all nets with clear names (e.g., `QUANTAR_AUX_IN_1`, `QUANTAR_PTT_PLUS`, etc.)

---

## Phase 4: Level Shifter Sheets

### 4.1 Pi → Quantar Level Shifter (74LVC8T245 #1)
**VCCA = 3.3V (Pi), VCCB = 5V (Quantar), DIR = HIGH (A→B)**
- [ ] Channel 1: Pi GPIO 17 → Quantar Aux In 1 (Pin 11)
- [ ] Channel 2: Pi GPIO 27 → Quantar Aux In 2 (Pin 12)
- [ ] Channel 3: Pi GPIO 22 → Quantar Aux In 3 (Pin 13)
- [ ] Channel 4: Pi GPIO 23 → Quantar Aux In 4 (Pin 14)
- [ ] Channel 5: Pi GPIO 24 → Quantar Aux In 5 (Pin 15, TX Inhibit)
- [ ] Channel 6: Pi GPIO 25 → Quantar Aux In 6 (Pin 16)
- [ ] Channel 7: **SPARE** - Door sensor (5V→3.3V on other chip)
- [ ] Channel 8: **SPARE** - PTT Monitor / PL Enable Monitor
- [ ] Decoupling caps: 0.1µF + 10µF on each VCC pin
- [ ] OE (Output Enable) tied to GND (always enabled)

### 4.2 Quantar → Pi Level Shifter (74LVC8T245 #2)
**VCCA = 3.3V (Pi), VCCB = 5V (Quantar), DIR = LOW (B→A)**
- [ ] Channel 1: Quantar Aux Out 1 (Pin 36) → Pi GPIO 10 (Station Alarm)
- [ ] Channel 2: Quantar Aux Out 2 (Pin 37) → Pi GPIO 9 (Pi Monitoring)
- [ ] Channel 3: PTT Monitor (Pin 47 tap) → Pi GPIO 4
- [ ] Channel 4: PL Enable Monitor (Pin 17 tap) → Pi GPIO 12
- [ ] Channel 5: Door Sensor (5V side) → Pi GPIO 13
- [ ] Channel 6: **SPARE**
- [ ] Channel 7: **SPARE**
- [ ] Channel 8: **SPARE**
- [ ] Decoupling caps on each VCC pin
- [ ] OE tied to GND

---

## Phase 5: Shared Digital I/O Sheet

### 5.1 PL Enable (Aux In 7) - Wired-OR with 2N7002
- [ ] Pi GPIO 8 → 2N7002 Gate
- [ ] Controller DB-9 Pin 1 → 2N7002 Gate (via series resistor)
- [ ] 2N7002 Drain → Quantar Pin 17 (Aux In 7)
- [ ] 2N7002 Source → GND
- [ ] Quantar internal 10kΩ pull-up to 5V provides HIGH
- [ ] Both Pi and Controller can pull LOW independently (wired-OR)

### 5.2 PTT (Aux In 9) - Opto-Coupler Driver
- [ ] Pi GPIO 11 → Base resistor (1kΩ) → 2N3904 Base
- [ ] 2N3904 Collector → Quantar Pin 47 (Aux In 9 -)
- [ ] 2N3904 Emitter → GND
- [ ] Quantar Pin 22 (Aux In 9 +) → +5V (from Quantar Pin 8 or Pi 5V via diode)
- [ ] Controller DB-9 Pin 3 connects to BOTH Pin 22 and Pin 47 (differential drive)
- [ ] Diode isolation between Pi and Controller drives

### 5.3 COS (Aux Out 7) - Passive Pull-up
- [ ] Quantar Pin 43 (Aux Out 7 -) → 4.7kΩ → Pi 3.3V
- [ ] Quantar Pin 43 → 4.7kΩ → Controller DB-9 Pin 7
- [ ] Quantar Pin 18 (Aux Out 7 +) → 5V (relay coil power)
- [ ] Both Pi GPIO 7 and Controller read same line

### 5.4 PL Detect (Aux Out 3) - Passive Pull-up
- [ ] Quantar Pin 38 (Aux Out 3) → 4.7kΩ → Pi 3.3V
- [ ] Quantar Pin 38 → 4.7kΩ → Controller DB-9 Pin 2
- [ ] Both Pi GPIO 5 and Controller read same line

---

## Phase 6: Audio Circuits Sheet

### 6.1 Line 1 Balanced Audio (Pins 1/26)
- [ ] Quantar Pin 1 (Line 1 +) → Controller DB-9 Pin 4 (TX Audio)
- [ ] Quantar Pin 26 (Line 1 -) → Controller DB-9 Pin 6/8/9 (GND)
- [ ] Direct connection - no level shifting needed
- [ ] ESD protection (TVS) on connector pins

### 6.2 Line 2 Balanced Audio (Pins 2/27)
- [ ] Quantar Pin 2 (Line 2 +) → Controller DB-9 Pin 5 (RX Audio)
- [ ] Quantar Pin 27 (Line 2 -) → Controller DB-9 Pin 6/8/9 (GND)
- [ ] Direct connection

### 6.3 Aux TX Audio (Pin 5) - Pi Injection
- [ ] Quantar Pin 5 → Voltage divider (attenuate ±4.1V to ~1V)
- [ ] Series coupling cap: 10µF electrolytic + 0.1µF ceramic
- [ ] 10kΩ potentiometer for level adjustment
- [ ] 1kΩ series resistor on Pi output to prevent back-driving
- [ ] Pi TX Audio → TRRS Sleeve (Mic) → Audio circuit → Quantar Pin 5

### 6.4 Aux PL Audio (Pin 5 alternate) - Controller CTCSS
- [ ] Controller DB-9 Pin 1 (CTCSS Out) → Voltage divider + pot
- [ ] Same Pin 5 as Aux TX (shared, different wildcard table)
- [ ] AC coupling caps

### 6.5 Aux RX Audio (Pin 30) - Pi & Controller Monitoring
- [ ] Quantar Pin 30 → Voltage divider (attenuate 0-6.6Vpp to ~1V)
- [ ] Series coupling caps: 10µF + 0.1µF
- [ ] 10kΩ potentiometer for level adjustment
- [ ] Split to:
  - Controller DB-9 Pin 5 (RX Audio)
  - TRRS Tip (Left channel) for Pi USB sound card monitoring

---

## Phase 7: Controller Interface Sheet (DB-9 Male)

### 7.1 DB-9 Male Connector Pinout
| DB-9 Pin | Signal | Connection |
|----------|--------|------------|
| 1 | CTCSS Encode Control | → PL Enable (2N7002 gate) |
| 2 | CTCSS Decoder Logic | ← PL Detect (Aux Out 3, pull-up) |
| 3 | TX PTT | → PTT Driver (Pin 22/47 differential) |
| 4 | TX Audio | → Line 1 + (Pin 1) / Aux TX Audio (Pin 5) |
| 5 | RX Audio | ← Line 2 + (Pin 2) / Aux RX Audio (Pin 30) |
| 6 | Ground | Shared GND |
| 7 | RX COS Logic | ← COS (Aux Out 7, pull-up) |
| 8 | Ground | Shared GND |
| 9 | Ground | Shared GND |

### 7.2 ESD Protection
- [ ] TVS diode array on all signal pins
- [ ] Series resistors on audio lines if needed

---

## Phase 8: Raspberry Pi Interface Sheet (2x20 Header)

### 8.1 GPIO Pin Mapping (40-pin Header)
| Pi Pin | GPIO | Function | Connection |
|--------|------|----------|------------|
| 1 | - | 3.3V | Power to level shifters VCCA |
| 2 | - | 5V | Power to level shifters VCCB, sensors |
| 3 | 2 | I2C SDA | (unused) |
| 4 | - | 5V | Power |
| 5 | 3 | I2C SCL | (unused) |
| 6 | - | GND | Shared GND |
| 7 | 4 | **PTT Monitor In** | ← Level shifter Ch3 (Quantar→Pi) |
| 8 | 14 | TXD | (unused) |
| 9 | - | GND | Shared GND |
| 10 | 15 | RXD | (unused) |
| 11 | 17 | **Quantar In 1** | → Level shifter Ch1 (Pi→Quantar) |
| 12 | 18 | PCM_CLK | (unused) |
| 13 | 27 | **Quantar In 2** | → Level shifter Ch2 |
| 14 | - | GND | Shared GND |
| 15 | 22 | **Quantar In 3** | → Level shifter Ch3 |
| 16 | 23 | **Quantar In 4** | → Level shifter Ch4 |
| 17 | - | 3.3V | Power |
| 18 | 24 | **Quantar In 5 (TX Inhibit)** | → Level shifter Ch5 |
| 19 | 10 | **Quantar Out 1 (Station Alarm)** | ← Level shifter Ch1 (Quantar→Pi) |
| 20 | - | GND | Shared GND |
| 21 | 9 | **Quantar Out 2 (Pi Monitoring)** | ← Level shifter Ch2 |
| 22 | 25 | **Quantar In 6** | → Level shifter Ch6 |
| 23 | 11 | **PTT Out** | → PTT Driver (2N3904) |
| 24 | 8 | **PL Enable Out** | → 2N7002 Gate |
| 25 | - | GND | Shared GND |
| 26 | 7 | **COS In** | ← Pull-up (shared with Controller) |
| 27 | 0 | ID_SD | (unused) |
| 28 | 1 | ID_SC | (unused) |
| 29 | 5 | **PL Detect In** | ← Pull-up (shared with Controller) |
| 30 | - | GND | Shared GND |
| 31 | 6 | **DHT11 Data** | → DHT11 header (4.7k pull-up) |
| 32 | 12 | **PL Enable Monitor** | ← Level shifter Ch4 (Quantar→Pi) |
| 33 | 13 | **Door Sensor** | ← Level shifter Ch5 (Quantar→Pi) |
| 34 | - | GND | Shared GND |
| 35 | 19 | PCM_FS | (unused) |
| 36 | 16 | **Quantar In 7 (spare)** | → (unused) |
| 37 | 26 | **COS Monitor (spare)** | ← (unused) |
| 38 | 20 | PCM_DIN | (unused) |
| 39 | - | GND | Shared GND |
| 40 | 21 | PCM_DOUT | (unused) |

### 8.2 Power Connections
- [ ] Pi 3.3V (Pin 1, 17) → 74LVC8T245 VCCA (both chips)
- [ ] Pi 5V (Pin 2, 4) → 74LVC8T245 VCCB (both chips), Door sensor pull-up, DHT11 VCC
- [ ] All GND pins → Shared ground plane

---

## Phase 9: Sensors Sheet

### 9.1 Door Sensor
- [ ] 2-pin 0.1" header (GND, Signal)
- [ ] 4.7kΩ pull-up to 5V on signal line
- [ ] Signal → 74LVC8T245 #2 Channel 5 (5V→3.3V) → Pi GPIO 13

### 9.2 DHT11 Temperature/Humidity Sensor
- [ ] 3-pin 0.1" header (GND, 3.3V, Data)
- [ ] 4.7kΩ pull-up on Data line to 3.3V
- [ ] Data → Pi GPIO 6 (Pin 31) direct (3.3V logic)

---

## Phase 10: Audio Monitoring Sheet (3.5mm TRRS Jack)

### 10.1 TRRS Pinout (CTIA Standard)
| TRRS Contact | Function | Connection |
|--------------|----------|------------|
| Tip | Left (RX Audio) | ← Aux RX Audio (attenuated) |
| Ring 1 | Right (TX Audio Monitor) | ← Aux TX Audio (attenuated, monitor) |
| Ring 2 | GND | Shared GND |
| Sleeve | Mic (TX Audio from Pi) | → Aux TX Audio injection circuit |

### 10.2 USB Sound Card Interface
- [ ] Standard headset levels compatible
- [ ] AC coupling on all audio lines
- [ ] ESD protection on jack

---

## Phase 11: Power Distribution Sheet

### 11.1 Power Rails
- [ ] **Pi 5V Rail**: From Pi header pins 2,4 → 74LVC8T245 VCCB, door sensor pull-up, DHT11 VCC
- [ ] **Pi 3.3V Rail**: From Pi header pins 1,17 → 74LVC8T245 VCCA (both chips), PL Detect/COS pull-ups, DHT11 pull-up
- [ ] **Quantar 5V**: From J17 Pin 8 → Available for PTT Pin 22 if needed
- [ ] **Shared GND**: All grounds connected (Quantar, Pi, Controller, Sensors)

### 11.2 Decoupling
- [ ] 0.1µF + 10µF on each 74LVC8T245 VCCA/VCCB pin
- [ ] 0.1µF on each connector pin (where practical)
- [ ] Bulk capacitance (100µF) on 5V and 3.3V rails

---

## Phase 12: Indicators & Test Points

### 12.1 Status LEDs
- [ ] **PTT LED**: Green, driven by PTT signal (via buffer), current-limiting resistor
- [ ] **COS LED**: Yellow, driven by COS signal (via buffer), current-limiting resistor
- [ ] **PL LED**: Red, driven by PL Detect signal (via buffer), current-limiting resistor
- [ ] **Power LED**: Blue, on 3.3V rail

### 12.2 Test Points
- [ ] TP1: GND
- [ ] TP2: Quantar 5V (J17 Pin 8)
- [ ] TP3: Pi 5V
- [ ] TP4: Pi 3.3V
- [ ] TP5: RX Audio (Aux RX Audio)
- [ ] TP6: TX Audio (Aux TX Audio)
- [ ] TP7: PTT Signal
- [ ] TP8: COS Signal

---

## Phase 13: ESD Protection & Final Review

### 13.1 ESD Protection on All External Connectors
- [ ] J17 (Quantar): TVS diodes on all 20 signal pins
- [ ] DB-9 (Controller): TVS diode array on pins 1-5, 7
- [ ] Pi Header: TVS on all GPIO-connected pins
- [ ] Door Sensor: TVS on signal pin
- [ ] DHT11: TVS on data pin
- [ ] TRRS Jack: TVS on all 4 contacts

### 13.2 Schematic Review Checklist
- [ ] All nets labeled consistently
- [ ] No floating pins (unused inputs tied off)
- [ ] Power flags on all power nets
- [ ] No ERC errors
- [ ] Hierarchical pins match between sheets
- [ ] Component values specified (resistors, caps, pots)
- [ ] Footprint assignments for all components
- [ ] BOM generation ready

---

## Phase 14: Documentation & Outputs

### 14.1 Generate Outputs
- [ ] Run ERC (Electrical Rules Check)
- [ ] Generate BOM (Bill of Materials)
- [ ] Generate Netlist
- [ ] Export schematic PDF
- [ ] Create assembly drawing notes

### 14.2 Wildcard Programming Guide
- [ ] Document minimal wildcard configuration (from minimal-wildcard-config.md)
- [ ] Include WinRSS programming steps

---

## Component Summary (BOM Preview)

| Qty | Component | Package | Notes |
|-----|-----------|---------|-------|
| 2 | 74LVC8T245 | TSSOP-24 | Dual-supply level translators |
| 1 | 2N7002 | SOT-23 | PL Enable wired-OR |
| 1 | 2N3904 | SOT-23 | PTT opto driver |
| 1 | DB-9 Male | Through-hole | Controller interface |
| 1 | 20-pin 0.1" Header | Through-hole | Quantar J17 (subset) |
| 1 | 2x20 0.1" Header | Through-hole | Pi GPIO |
| 1 | 3.5mm TRRS Jack | Through-hole/SMD | Audio monitoring |
| 1 | 2-pin 0.1" Header | Through-hole | Door sensor |
| 1 | 3-pin 0.1" Header | Through-hole | DHT11 |
| 4 | 4.7kΩ Resistor | 0603 | Pull-ups (COS, PL Detect x2, Door) |
| 1 | 4.7kΩ Resistor | 0603 | DHT11 data pull-up |
| 3 | 10kΩ Potentiometer | Through-hole | Audio level adjust (TX, PL, RX) |
| 6 | 10µF Electrolytic | Through-hole | Audio coupling caps |
| 6 | 0.1µF Ceramic | 0603 | Audio coupling + decoupling |
| ~20 | 0.1µF Ceramic | 0603 | Power decoupling |
| 2 | 10µF Tantalum | 0805 | Bulk decoupling on 5V/3.3V |
| 1 | 100µF Electrolytic | Through-hole | Bulk 5V rail |
| 1 | 100µF Electrolytic | Through-hole | Bulk 3.3V rail |
| 4 | LED (Grn/Yel/Red/Blu) | 0805 | Status indicators |
| 4 | 1kΩ Resistor | 0603 | LED current limiting |
| 1 | 1kΩ Resistor | 0603 | 2N3904 base resistor |
| 2 | TVS Diode Array | SOT-23-6 | ESD protection (4-ch each) |
| 1 | 1N4148 Diode | SOD-123 | PTT +5V isolation |

---

## Execution Order

1. **Setup** (Phase 1) - Create project, custom symbols
2. **Hierarchy** (Phase 2) - Create sheet structure
3. **Quantar Interface** (Phase 3) - J17 connector
4. **Level Shifters** (Phase 4) - Two 74LVC8T245 chips
5. **Shared Digital** (Phase 5) - PL Enable, PTT, COS, PL Detect
6. **Audio** (Phase 6) - All audio circuits
7. **Controller** (Phase 7) - DB-9 wiring
8. **Pi Interface** (Phase 8) - 40-pin header mapping
9. **Sensors** (Phase 9) - Door + DHT11
10. **Audio Monitoring** (Phase 10) - TRRS jack
11. **Power** (Phase 11) - Distribution & decoupling
12. **Indicators/TP** (Phase 12) - LEDs & test points
13. **ESD/Review** (Phase 13) - Protection & ERC
14. **Outputs** (Phase 14) - BOM, netlist, PDF

---

## Notes for Implementation

- Use **hierarchical sheets** in KiCad for organization
- Use **global labels** for signals crossing sheets
- Use **hierarchical pins** on sub-sheets
- Keep **audio traces** separate from digital on PCB (schematic side: separate sheets)
- **Ground** is single shared plane - all GND nets connect
- **Power flags** required on each power rail for ERC
- **No ERC errors** before proceeding to PCB layout
- Document **wildcard programming** separately (already in minimal-wildcard-config.md)
