# Minimal Wildcard Configuration for Quantar Breakout PCB

This document defines the minimal wildcard tables required for basic functionality of the Quantar breakout PCB interface. Test tones and additional Pi-controlled features can be added later.

## Current Production Requirements

Based on the connections.md pin mapping and requirements.md, the following signals need to be mapped:

| Adapter Bank Pin | Description             | Quantar Pin | Quantar Name | Direction        | Required Wildcard Function              |
| ---------------- | ----------------------- | ----------- | ------------ | ---------------- | --------------------------------------- |
| Input 2          | In 1 (Aux In 1)         | 11          | Aux In 1     | Input → Quantar  | Available for Pi status input           |
| Input 3          | In 2 (Aux In 2)         | 12          | Aux In 2     | Input → Quantar  | Available for Pi status input           |
| Input 4          | In 3 (Aux In 3)         | 13          | Aux In 3     | Input → Quantar  | Available for Pi status input           |
| Input 5          | In 4 (Aux In 4)         | 14          | Aux In 4     | Input → Quantar  | Available for Pi status input           |
| Input 6          | In 5 (Aux In 5)         | 15          | Aux In 5     | Input → Quantar  | **TX Inhibit** (already configured)     |
| Input 7          | In 6 (Aux In 6)         | 16          | Aux In 6     | Input → Quantar  | Available for Pi status input           |
| Input 14         | Ctrlr PL Out (Aux In 7) | 17          | Aux In 7     | Input → Quantar  | **PL Enable** (already configured)      |
| Input 13         | PTT (Aux In 9)          | 47          | Aux In 9 -   | Input → Quantar  | **PTT** (already configured)            |
| Input 8          | Out 1 (Aux Out 1)       | 36          | Aux Out 1    | Output ← Quantar | **Station Alarm** (already configured)  |
| Input 9          | Out 2 (Aux Out 2)       | 37          | Aux Out 2    | Output ← Quantar | Available for Pi monitoring             |
| Input 16         | Ctrlr PL In (Aux Out 3) | 38          | Aux Out 3    | Output ← Quantar | **PL Detect** (already configured)      |
| Input 15         | COS (Aux Out 7)         | 43          | Aux Out 7 -  | Output ← Quantar | **COS/CAR Detect** (already configured) |
| Input 11         | RX Audio                | 30          | Aux RX Audio | Output ← Quantar | **Aux RX Audio Enable** (needs config)  |
| Input 12         | TX Audio                | 5           | Aux TX Audio | Input → Quantar  | **Aux TX Audio Enable** (needs config)  |
| Input 17         | Ctrlr TX Audio          | 1           | Line 1 +     | Input → Quantar  | Line 1 (balanced, no wildcard)          |
| Input 18         | Ctrlr RX Audio          | 2           | Line 2 +     | Output ← Quantar | Line 2 (balanced, no wildcard)          |

## Minimal Wildcard Tables Required

### Table 1: SETUP (Keep existing)
- **State**: WARM RESET OR COLD RESET
- **Action**: RX1+AUXRX ON
- **Purpose**: Basic config on startup

### Table 2: POWER TRIP (Keep existing)
- **State**: REFL PWR ALARM OR FWD PWR ALARM
- **Action**: TX INHIBIT
- **Inaction**: NULL
- **Purpose**: Inhibit TX if forward power too low or reflected power too high

### Table 3: IN1 - Pi Status Input 1 (NEW - replace test tone)
- **State**: INPUT 1
- **Action**: NULL (or custom function as needed)
- **Inaction**: NULL
- **Purpose**: Available for Pi to send status to Quantar

### Table 4: IN2 - Pi Status Input 2 (NEW - replace test tone)
- **State**: INPUT 2
- **Action**: NULL
- **Inaction**: NULL
- **Purpose**: Available for Pi to send status to Quantar

### Table 5: IN3 - Pi Status Input 3 (NEW - replace test tone)
- **State**: INPUT 3
- **Action**: NULL
- **Inaction**: NULL
- **Purpose**: Available for Pi to send status to Quantar

### Table 6: IN4 - Pi Status Input 4 (NEW - replace test tone)
- **State**: INPUT 4
- **Action**: NULL
- **Inaction**: NULL
- **Purpose**: Available for Pi to send status to Quantar

### Table 7: IN5 - TX DISABLE (KEEP EXISTING)
- **State**: INPUT 5
- **Action**: TX INHIBIT
- **Inaction**: TX ENABLE
- **Purpose**: Pi asserts TX Inhibit via Aux In 5 (Pin 15)

### Table 8: IN6 - Pi Status Input 6 (NEW - replace test tone)
- **State**: INPUT 6
- **Action**: NULL
- **Inaction**: NULL
- **Purpose**: Available for Pi to send status to Quantar

### Table 9: IN7 - PL ENABLE (KEEP EXISTING)
- **State**: INPUT 7
- **Action**: TX PL ENABLE
- **Inaction**: TX PL DISABLE
- **Purpose**: Controller/Pi asserts PL Enable via Aux In 7 (Pin 17)

### Table 10: IN9 - PTT (KEEP EXISTING)
- **State**: INPUT 9
- **Action**: KEY FROM WL
- **Inaction**: DEKEY FROM WL
- **Purpose**: Controller/Pi asserts PTT via Aux In 9 (Pins 22/47)

### Table 11: OUT1 - STN ALRM (KEEP EXISTING)
- **State**: STN ALARM OR TX INHIBITED
- **Action**: SET OUTPUT 1
- **Inaction**: CLR OUTPUT 1
- **Purpose**: Station Alarm → Pi via Aux Out 1 (Pin 36)

### Table 12: OUT2 - Pi Monitoring (REPURPOSE from LINE PTT)
- **State**: (Choose appropriate state, e.g., TX INHIBITED or custom)
- **Action**: SET OUTPUT 2
- **Inaction**: CLR OUTPUT 2
- **Purpose**: Available for Pi monitoring via Aux Out 2 (Pin 37)

### Table 13: OUT3 - PL DETECT (KEEP EXISTING)
- **State**: RX PL DETECT
- **Action**: SET OUTPUT 3
- **Inaction**: CLR OUTPUT 3
- **Purpose**: PL Detect → Controller/Pi via Aux Out 3 (Pin 38)

### Table 14: OUT7 - COS/COR (KEEP EXISTING)
- **State**: RX CAR DETECT
- **Action**: SET OUTPUT 7
- **Inaction**: CLR OUTPUT 7
- **Purpose**: COS/CAR Detect → Controller/Pi via Aux Out 7 (Pins 18/43)

### Table 15: AUX RX AUDIO ENABLE (NEW - Required for Pin 30)
- **State**: COLD RESET OR WARM RESET
- **Action**: =RXDSC-AUXRXON
- **Inaction**: NULL
- **Purpose**: Enable Aux RX Audio output on J17 Pin 30

### Table 16: AUX TX AUDIO ENABLE (NEW - Required for Pin 5)
- **State**: INPUT 9 (same as PTT)
- **Action**: AUXTX-TXON
- **Inaction**: AUXTX-TXOFF
- **Purpose**: Route Aux TX Audio (Pin 5) to transmitter when PTT active
- **Note**: This replaces the current test tone configuration on Table 4

## Summary of Changes from Current Config

| Current Table | Current Function | New Function                  | Change Required   |
| ------------- | ---------------- | ----------------------------- | ----------------- |
| 3             | RF TONE ON 600   | Pi Status In 1                | Edit state/action |
| 4             | RF TONE ON 800   | Pi Status In 2 + Aux TX Audio | Edit state/action |
| 5             | RF TONE ON 1000  | Pi Status In 3                | Edit state/action |
| 6             | RF TONE ON 1200  | Pi Status In 4                | Edit state/action |
| 7             | TX INHIBIT       | TX INHIBIT                    | **No change**     |
| 8             | RF TONE ON 1600  | Pi Status In 6                | Edit state/action |
| 9             | PL ENABLE        | PL ENABLE                     | **No change**     |
| 10            | PTT              | PTT                           | **No change**     |
| 11            | STN ALARM        | STN ALARM                     | **No change**     |
| 12            | LINE PTT         | Pi Monitoring                 | Edit state/action |
| 13            | PL DETECT        | PL DETECT                     | **No change**     |
| 14            | COS/COR          | COS/COR                       | **No change**     |
| —             | (none)           | AUX RX AUDIO                  | **Add new table** |
| —             | (none)           | AUX TX AUDIO                  | **Add new table** |

## Programming Notes

1. **Aux TX Audio on Pin 5**: Requires Table 4 edit (INPUT 9 → AUXTX-TXON / AUXTX-TXOFF) - this shares the PTT input
2. **Aux RX Audio on Pin 30**: Requires Table 9 edit (COLD RESET OR WARM RESET → =RXDSC-AUXRXON)
3. **Line 1 Audio (Pins 1/26)**: Balanced phone line input - no wildcard config needed, always active
4. **Line 2 Audio (Pins 2/27)**: Balanced input/output - no wildcard config needed

## Future Expansion (Not in Minimal Config)

The following can be added later when Pi software supports them:
- Test tone generation on Inputs 1-4, 6 (Tables 3-6, 8)
- Additional Pi-controlled outputs on Output 2 (Table 12)
- Custom wildcard logic for advanced features
