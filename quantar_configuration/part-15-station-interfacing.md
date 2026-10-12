## ® **_MOTOROI.A_** 

### **INPUT/OUTPUT SPECIFICATIONS FOR EXTERNAL CONTROLLERS For** **_Quantar_ and** **_Quantro_ Stations** 

##### **OVERVIEW** 

The _Quantar_ and _Quantro_ stations can be connected to external third-party controllers to accommodate various system applications. Connections between the station and the external controller equipment typically involve the following primary interface signals (available on the station backplane System Connector #17): 

- Line 1 + and Line 1 - 

- Aux TX Audio (or Aux PL Audio) 

- Aux RX Audio 

- Carrier Indication + and Carrier Indication 

- PTT + and PTT 

To facilitate making connections between the station and external controller, this section provides electrical characteristics, frequency response curves, and other interface details for the primary interface signals. 

**Note** _When the WildCard option is purchased (required to configure inputs/outputs for connection to an external controllers) and is then enabled (via the RSS), the pre-defined functionality of the signals on System Connector J17 as shown in the Backplane section of this manual (e.g., J17-Pin_ 22 _is Ext PTT_ +, _J17-Pin_ 11 _is Ext Failsoft, etc.) is lost._ 

_In order to restore the pre-defined signals, you_ must _press_ **F4** _(SET TO DEFAULT) on any of the WildCard RSS screens. Doing so automatically creates_ a _set of WildCard Tables that now determine J17's signal functionality. The_ **_Editing WildCard Tables_** _section (page_ 8) _may now be used to change the signal functionality,_ as _desired._ 

**_Commercial Government and Industrial Solutions Sector_** 

@Motorola, Inc. 2000 All Rights Reserved Printed in U.S.A. 

**S8P81 09SE8S** - 0 6/1/00-UP 

1301 E. Algonquin Road, Schaumburg, IL 60196 

_Quantar/Quantro_ Station Products 

#### **ELECTRICAL CONNECTIONS** 

Figure 1 shows the pin-out locations of the primary interface signals available on System Connector #17. 



<!-- Start of picture text -->
SYSTEM CONNECTOR #17<br>1~<br>.l\l<br>0<br>'"  <ll<br><ll<br>~  '"<br>e:;- lY"  <ll<br>'0  e G) G)  .!)!  :±:: ~  'i\J .l\l 0 <::<br><ll<br>!  E::  <ll<br>,;;  0  ~ <ll  $J  '"<br>a:  od::  ><  ::I  .E ~  Iii  iil .!)! E  <ll  I<br>ii:  C\I  iJ) e  ii: od:: M C  e  ::I ><  a  0: 'E: M <Xl  I::: 0: c:L  "I-C\J  ii: ..,. M  e  1=  ii:  ""  ..,. '"  e<br>+  .2  :;;;  +<br>Notes ')  The default WildCard Tables define pins 18 and 43 as Carrier I nd ication + and  These  ::::i ii: e e G)  « «  "=' ~  ::I ::I ><  !!. '0  e G) G) G)  I-l-ii: "" C\I C\I  e<br>pins provide a relay contact closure output. If desired, the WildCard Tables may be modified to  e<br>provide the Carrier Indication signal on pin 38 as a transistor buffered output. See  Editing  ii:<br>WildCard Tables  on page 7 for details.<br>~<br>2)  The default WildCard Tables define pins 22 and 47 as  PTT  +  and  -. These pins provide  ii:  e<br>an  opto-coupled input.  If desired, the WildCard Tables may be modified to provide the PTT<br>signal on pin 42 as a transistor buffered input. See  Editing WildCard Tables  on page 7 for<br>details.<br>3)  Stations shipped from the factory are programmed with no signal at pin 30.  In  order to<br>program this pin for Aux  RX Audio, refer to  Editing WildCard Tables  on page 7.<br>4)  Stations shipped from the factory are programmed with no signal at pin 5.  Depending on<br>the application, this pin may be programmed for AUXPL Audio or Aux TX Audio In order to<br>program this pin for AUXPL Audio or Aux TX Audio, refer to  Editing WildCard Tables  on page 7.<br><!-- End of picture text -->

**_Figure 1._** Signal Locations on System Connector #17 

68P81 096E86~O 6/1/00 

2 

Input/Output Specifications for External Controllers 

#### **ELECTRICAL CHARACTERISTICS** 

This section provides the electrical characteristics, frequency response curves, and other interface details for the primary interface signals. 

**Line 1 + and Line 1 -** 

**(J17-Pins 1 and 26)** 

###### **_General Characteristics_** 

Line 1 + and Line 1 - provide a balanced phone line input for incoming audio signals to the station. The input impedance is set by jumpers located on the Wireline Interface Board. The jumpers are set at the factory for 600n impedance. You may change the impedance (if desired) by changing the jumpers as described in the appropriate (4-wire or B-wire) Wireline Interface Board section in this manual. 

###### **_Phone Line Specifications_** 

Most telephone companies recognize either "3002" or "Type 5" as designations to define phone line types and associated electrical specifications. Telephone lines meeting the specifications for either of these types are acceptable for use with the _Quantar_ station. The following table shows the specifications for "3002" and "Type 5" phone line types. 

**Type Sand** "3002" **Phone Line Specifications** 

|**Parameter**<br>|I<br>**TypeS**<br>**Specification**|I<br>**3002**<br>**Specification**|
|---|---|---|
|Loss Deviation|±4.0dB|±4.0dB|
|C-NotchedNoise|51dBrnCO|51dBrnCO|
|Attenuation Distortion:<br>504 to 2504Hz|-2.0to+8.0dB|-2.0to+8.0dB|
|404 to 2804Hz|-2.0to +10.0 dB|spec not available|
|304 to 3004Hz|-3.0to + 12.0 dB|-3.0to +12.0 dB|
|SignaltoC-NotchedNoise Ratio|2..24 dB|2..24dB|
|Envelope Delay Distortion:<br>804 to 2604Hz|1750,"",sec|1750,"",sec|
|Impulse Noise Threshold|71dBrnCO||
|Intermodulation Distortion:<br>R2<br>R3|2..27 dB<br>2..32 dB|2..25dB<br>.2::30|
|Phase Jitter:<br>20-300Hz<br>4-300Hz|.2::10Deg rees<br>2..15Degrees|2..25 Degrees<br>.2::30 Degrees|
|Frequency Shift|± 3 Hz|± 5Hz|



3 

68P81096E86-0 6/1/00 

_Quantar/Quantro_ Station Products 

###### AuxTXAudio 

###### (J17-Pin 5) 

_Note In orderforJ17·Pin 5tosupportthe Aux_ TX _Audio Signal, you must edit the Wildcard Table_ as _shown on page 11._ 

The Aux TX Audio signal is an unbalanced, 470Q impedance input to the station. The input voltage range is -4.1 V to +4.1 V at 250 Hz to 3 kHz. The response curves for this signal are shown below. 



<!-- Start of picture text -->
Aux Tx Audio Magnitude Response<br>I  I  I  I  I  I  I  I  I<br>~  : : : ::: : ::: : : ::: : ; : : ; : : : : :<br>m  >  c  - - T  - - ,  - - -,  - - - I - - - 1- - - .- - - r - - i  - - i  - -<br>"C ~  __  1.  _ _  J _ _  _ _  _I  _  _  _ , ___  1_  _  _  ~  __  1.  __  J  __<br>- - T - - ,  - - - - - I - - - 1- - - ,- - - r - - T - - '"i  - -<br><!-- End of picture text -->

START: 0 Hz 

STOP: 10000 Hz 



<!-- Start of picture text -->
Aux Tx Audio Phase Response<br>40<br>DEGr-----~------------~------~<br>- - !.  - - ..!  - - _,  - - _I  _  _  _ 1 ___  1_  _  _  ~  _  _  .!..  _ _  ..!  __<br>.,  ,.<br>c  w<br>" >  c<br>o<br>,...  -----------------------I  1  I  I  I  I  I<br>,.<br>-40~----*-~--~----~----------~<br>START:  0 Hz  STOP:  10000 Hz Hz<br><!-- End of picture text -->

STOP: 10000 Hz Hz 

68P81 096E86~O 6/1/00 

4 

Input/Output Specifications for External Controllers 

###### Aux PL Audio 

###### (J17-Pin 5) 

_Note In orderforJ17-Pin 5to support the Aux PL Audio signal, you must edit the Wildcard Table_ as _shown_ on _page 12._ 

The Aux PL Audio signal is an unbalanced, 470Q impedance input to the station. The input voltage range is -4.1 V to +4.1 Vat 5 Hz to 3 kHz. The response curves for this signal are shown below. 



<!-- Start of picture text -->
Aux PL Audio Magnitude Response<br>---------------------------I  I  ,  I  I  I  I  ,<br>m  >  c<br>"C<br>,...  ------------------------------ I  I  I  I  I  I  I  I<br>- - T - - "i  - - - - - - I - - -, - - - ,- - - r - - T - - '"i  - -<br><!-- End of picture text -->

START: a Hz 

STOP: 10 000 Hz 



<!-- Start of picture text -->
Aux PL Audio Phase Response<br>-10r-__  --~  __  --~-- ____  --~  __  --~~<br>DEG<br>I  I  I  I  I  I  I  I  I<br>- ----------------------------<br>,-<br>c  w<br>" >  c<br>o<br>,...  ------------------------ I  I  I  I  I  I  I<br>-90~-*----~--~--~-*----~--~--<br>START:  a  Hz  STOP:  10 000 Hz 000 Hz Hz<br><!-- End of picture text -->

STOP: 10 000 Hz 000 Hz Hz 

5 

68P81096E86-0 6/1/00 

_Quantar/Quantro_ Station Products 

###### Aux RXAudio (J17-Pin 30) 

The Aux RX Audio signal is an unbalanced output from an operational amplifier with an output impedance of less than 5Q. The output voltage range is 0 to 6.6V P-P at 0 to 6 kHz. The response curves for this signal are shown below. 



<!-- Start of picture text -->
Aux RX Audio Amplitude Response<br>I------~------------------<br>-'<br>-- c ><br>III<br>"C<br>C'\I<br>- - I"  - - "I  - - -,  - - - I - - -, - - - ,- - - I  - - T  - - J - -<br><!-- End of picture text -->

START: 0 Hz STOP: 10 000 Hz X: 5275 Hz 



<!-- Start of picture text -->
Aux RX Audio Phase Response<br>40<br>DEG ...-----------------....<br>_ _  ~  _ _  ~  _ _ _'  _ _ _'  _ _ _ '_  _ _ '_  _  X:~ "l0_00.H~  _ _<br>, Y:'17.80  DEG<br>-->  c<br>CJ<br>w<br>o<br>o ,..  _,  I  1_  I  I  I<br>-40----------------------------------<br>START: 0 Hz  STOP:  10000 Hz<br>X:  7000 Hz<br><!-- End of picture text -->

68P81 096E86~O 6/1/00 

6 

Input/Output Specifications for External Controllers 

**Carrier Indication** +/- **(J17-Pins 18 and 43)** 

The Carrier Indication + and Carrier Indication - signal provides a relay closure output, as shown below. (If desired, the WildCard Tables may be edited to provide the Carrier Indication signal on J17-Pin 38 as a transistor-buffered output. Refer to _Editing WildCard Tables_ on page 7 for details.) 



<!-- Start of picture text -->
+5V<br>J17 Pin18<br>Carrier Indication +<br>0--+----_  Carrier Indication<br>J17-Pin 43<br>3.9K<br>Typical Relay Closure Output Circuit<br><!-- End of picture text -->

**PTT** +/- 

**(J17-Pins 22 and 47)** 

The **PTT** + and **PTT** - signal provides an opto-isolated input, as shown below. (If desired, the WildCard Tables may be edited to provide the **PTT** signal on J17 -Pin 42 as a transistor-buffered input. Refer to _Editing WildCard Tables_ on page 7 for details.) 



<!-- Start of picture text -->
+5V<br>100K<br>J17  Pin 22<br>PTT<br>J17-Pin 47<br>PTT<br>Typical  Opto-Coupled<br>Input Circuit<br><!-- End of picture text -->

7 

68P81096E86-0 6/1/00 

_Quantar/Quantro_ Station Products 

# **I** 

##### **EDITING WILDCARD TABLES** 

You must edit certain WildCard Tables in order to cause certain signals to appear on specific pins on the System Connector J17. Instructions for modifying these WildCard Tables are provided in this section. 

The WildCard Tables are programmed in the factory to provide: 

- Carrier Indication + and - on J17-Pins 18 and 43 as a relay contact closure output 

- PTT + and - on J17-Pins 22 and 47 as an opto-isolated input 

If desired, the WildCard Tables may be modified to change the connector pin number and signal interface as follows: 

- Carrier Indication on J17-Pin 38 as a transistor buffered output 

- PTT on J17-Pin 42 as a transistor buffered input 

**Changing Carrier Indication Signal to J17-Pin 38** 

The WildCard Tables are programmed in the factory to provide Carrier Indication + and - on J17 - Pins 18 and 43 as a relay contact closure output. Modify WildCard Table 8 as shown below to move the Carrier Indication signal to J17-Pin 38 as a transistor buffered output. 

Change from 7 to 3 



<!-- Start of picture text -->
MOTOROLA RADIO SERVICE SOFTWARE<br>Enter a Description of the State<br>BASE STATION PRODUCTS<br>Condition<br>VER:XX.XX.XX<br>:WILD CARD: STArE/ACTION CONFIG<br>Description:  RD STAT  TAHLEB OF 10  Jump  to  'Iable  B<br>STATE and CONDITION SETTINGS<br>State  Cond  State  Cond  State<br>RXQUALMET<br>ACTION:  INACTION:<br>SET OUTPUT<br>Fl  F2  F3  F4  F5  F6  F7  F8  F9  FlO<br>HELP  ( HOICE  ADD  SET TO  PREV  NEXT  DEL  PROGRAMMING ADDT'L  EXIT<br>UST  TABLE  DEFAULT  TABLE  TABLE  TABLE  RULES  CMDS<br><!-- End of picture text -->

68P81 096E86~O 6/1/00 

8 

Input/Output Specifications for External Controllers 

###### **Changing PTT to J17-Pin 42** 

The WildCard Tables are programmed in the factory to provide PTT + and - on J17-Pins 22 and 47 as an opto-isolated input. Modify WildCard Table 4 as shown below to move PTT to J17 -Pin 42 as a transistor buffered input. When PTT is asserted, the station will gate audio from Line 1 to the transmitter. Follow the alignment instructions for the Wireline to set proper deviation level. 



<!-- Start of picture text -->
MOTOROLA RADIO SERVICE SOFTWARE<br>Enter a Description of the State<br>BASE STATION PRODUCTS<br>Condition<br>VER:XX.XX.XX<br>:Wll.D CARD: STATE/ACTION CONFIG<br>Description:  EXTPTT  TABLE 4 OF 10  Jump to Table  4<br>STATE and CONDITION SETTINGS<br>Stat)~  Cond  State  Cond  State<br>INP  8<br>~CTION:  INACTION:<br>-KEY FROM WI.  - DEKEY  FROM WI.<br>/<br>- -<br>- -<br>Fl  F2  F3  F4  F5  F6  F7  F8  F9  FlO<br>HELP  CHOICE  ADD  SET TO  PREY  NEXT  DEL  PROGRAMMING ADDT'L  EXIT<br>LIST  TABLE  DEFAULT  TABLE  TABLE  TABLE  RULES  CMDS<br><!-- End of picture text -->

Change from 9 to 8 

9 

68P81096E86-0 6/1/00 

_Quantar/Quantro_ Station Products 

###### **Routing Aux RX Audio to J17-Pin 30** 

Edit (or add) WildCard Table 9 in order to route the Aux RX Audio signal to J17-Pin 30. 



<!-- Start of picture text -->
MOTOROLA RADIO SERVICE SOFTWARE<br>Enter a Description of the State<br>BASE STATION PRODUCTS<br>Condition<br>VER:K.X.XX.XX<br>:WILD CARD: STATE/AcrION CONFIG<br>Description:  ENABLE RX AUDIO  TABLE 9 OF 10  Jump to Table  9<br>STATE  and  CONDITION SETTINGS<br>State  Cond  State  Cond  State<br>COLD RESET  OR  WARM RESET<br>ACTIO!':  INACTION:<br>~ =RXDSC-AUXRXON  -NULL<br>~  -<br>Program as shown<br>Fl  F2  F3  F4  F5  F6  F7  F8  F9  flO<br>HELP  CHOICE  ADD  SET TO  PREV  NEXT  DEL  PROGRAMMlNG ADDT'L  EXIT<br>LIST  TABLE  DU'Allt;f  'D\BLE  fABLE  'IABLE  RULES  CMDS<br><!-- End of picture text -->

68P81 096E86~O 6/1/00 

**10** 

Input/Output Specifications for External Controllers 

###### **Routing Aux TX Audio to J17-Pin 5** 

Edit WildCard Table 4 in order to route the Aux TX Audio signal from J17-Pin 5 to the transmitter. Alignment is fixed so that a 1 kHz tone at -10 dBm at the input provides 60% deviation. (For example, on a 25 kHz channel with 5 kHz maximum deviation, a -10 dBm input results in 3 kHz deviation.) 



<!-- Start of picture text -->
MOTOROLA RADIO SERVICE SOFTWARE<br>Enter a Description of the State<br>BASE STATION PRODUCTS<br>Condition<br>VER:XX.XX.XX<br>:WILD CARD: STATE/A(TION CON FIG<br>Description:  EXr PTf  TABLE 4 OF 10  Jump to 'Ib.hle  4<br>STATE  and  CONDITION SETI'INGS<br>State  Canel  State  Canel  State<br>INPUT 9<br>ACTIO~  :  INACTION:<br>~ -AUXTX-TXON  - AUXTX -TX OFF<br>~ -KEYFROMWL  - DEKEY FROM WL<br>~<br>Program as shown<br>Fl  F2  F3  F4  F5  F6  F7  F8  F9  FlO<br>HELP  CHOICE  ADD  SET TO  PREY  NExl  DEL  PROGRAMMlNG ADDT'L  EXIT<br>LlS'l  1~-\BLE  DEMUI.;1  fABLE  TABLE  'lABLE  RllLES  (;MDS<br><!-- End of picture text -->

**11** 

68P81096E86-0 6/1/00 

_Quantar/Quantro_ Station Products 

###### **Routing Aux PL Audio to J17-Pin 5** 

Edit WildCard Table 4 as shown below in order to sum the signal at Aux TX Audio with the audio signal at Line 1. The signal input to the Aux TX Port can be either a PL signal, a DPL signal, or some other low speed digital signal. The port is scaled so that an amplitude of -10 dBm provides a 20% deviation of the transmitted rf signal. (For example, on a 25 kHz channel with 5 kHz maximum deviation, the low speed signal input at - 10 dBm results in 1 kHz deviation.) Note that the audio input at Line 1 must be aligned following the wireline alignment procedure located in the Radio Service Software (RSS) User's Guide. 



<!-- Start of picture text -->
MOTOROLA RADIO SERVICE SOFTWARE<br>Enter a Description of the State<br>BASE STATION PRODUCTS<br>Con(Jition<br>VER:XX.XXXX<br>:WILD CARD: STATE/ACTION CONFIG<br>Description:  EXT PTT  TABLE 4 OF 10  J  LLmp  to  Table 4<br>STATE and CONDITION SETTINGS<br>State  Cond  State  Cond  State<br>INPUT 9<br>ACTIOr- :  INACTION:<br>I  ~ AUXPL+TX ON  AU XPL+TX OFF<br>~ ~ ..... __ KE_~Y_. _F_R_O_M_W_L _________ D_E_K_E_Y_F_R_O_M_. _W_L_ .....<br>Program as shown<br>Fl  F2  F3  F4  F5  F6  F7  F8  F9  FlO<br>HRLP  CHOICR  ADD  SRT TO  PRKV  NRXT  DRL  PROGRAMMING C\DDT'L  RXIT<br>LIST  TABLE  DEFAULT  TABLE  TABLE  TABLE  RULES  CMDS<br><!-- End of picture text -->

68P81 096E86~O 6/1/00 

**12** 

® **_MOTOROI.A_** 

**SERIAL INTERFACE SPECIFICATIONS For** **_Quantar_ and** **_Quantro_ Stations and** **_ASTRO-TAe_ Receivers** 

**(For Interface Protocol Version 01.01.01)** 

##### **OVERVIEW** 

This section describes howto make a serial connection from a PC (or other external device) to the _Quantar/Quantro_ station or receiver, enter a special servicing mode (i.e., "RSS Mode"), and issue commands to reset the station or retrieve various station status information. 

**Important!** These serial interface specifications **_do not apply_** to stations running ASTRO® 25 Trunking Software. 

##### **MAKING SERIAL CONNECTION TO STATION** 

###### **_Equipment Required_** 

The following hardware is required to connect serially to one of the two RSS ports (one located on the SCM front panel, the other located on the station backplane): 

- Personal Computer or other external control device 

- 9-pin female to 9-pin male EIA-232 cable wired for null modem connections; cable is available (Motorola Part No. 30-80369E31) from Motorola Aftermarket and Accessories Division (MD, formerly Motorola National Parts), or can be made by wiring the connectors as shown below. 

**_Note_** _A null modem adapter_ (9 - _pin male to_ 9 - _pin female) may also be used to convert_ a _standard EIA_ - 232 _cable for connection to the RSS port. Adapters are available at most electronic supply retailers._ 

**_Commercial Government and Industrial Solutions Sector_** 1301 E. Algonquin Road, Schaumburg, IL 60196 

@Motorola, Inc. 2001 All Rights Reserved Printed in U.S.A. 

**S8P81131 E57-0** 7/31/01-UP 

_Quantar/Quantro_ Station and Receiver Products 

###### **_Connecting_ to** **_the Station RSS Port_** 

Figure 1 shows a typical scenario in which a PC is connected to the RSS port on the station (SCM front panel RSS port in this illustration). The PC could be used as a simple terminal (running _Windows HyperTerminal_ or similar terminal software) to allow commands to be issued manually, or it could be running third party software designed to perform automated retrieval of station operating information. 



<!-- Start of picture text -->
Alternate RSS<br>9-PIN EIA-232  Port Location<br>FEMALE  D- TYPE<br>CONNECTOR<br>STATION<br>BACKPLANE<br>STATION CONTROL<br>MODULE<br>LAPTOP PC<br>CABLE WIRED FOR<br>NULL MODEM<br>CONNECTIONS<br>RSS  PORT<br>ON<br>STATION CONTROL<br>9-PIN EIA-232  MODULE<br>MALE  D-TYPE<br>CONNECTOR<br><!-- End of picture text -->

**_Figure_** 1. Connecting PC to RSS Port (Typical Scenario) 

68P81131E57-0 7/31/01 

2 

Serial Interface Specifications 

#### **ENTERING** "RSS MODE" 

###### _Overview_ 

In order to issue commands to the station, the station must be placed into a special operating mode called "RSS Mode." Once in RSS Mode, you may enter commands as detailed on page 4. 

_Note The station remains fully operational while in RSS Mode._ 

###### _Configuring Terminal Settings_ 

Before communicating serially with the station, you must launch and configure a terminal application running on the PC (or other external device). The primary settings are as follows: 

- 9600 Baud 

- No Parity 

- 8 data bits 

- 1 stop bit 

- Flow Control set to None 

- Set to appropriate Com port (typically Com1 ) 

###### _Entering RSS Mode_ 

- Step 1. Press < ret> to obtain the station normal operating mode prompt (] -0). 

   - Note Local Echo mode is on by default (following any station reset). To disable local echo, type PCTl -ECHO OFF <cr> To enable local echo, type PCTl -ECHO ON <cr> 

- Step 2. At the] -0 prompt, type: dorss <cr>. The station will enter RSS Mode, as indicated by the RSS: prompt. 

- Step 3. The station is now ready to receive commands as described on page 4. 

3 

68P81131E57-0 7/31/01 

(Page 5 is blank) 

_Quantar/Quantro_ Station and Receiver Products 

###### **_GET STATION_STATUS Command_** 

###### **_Overview_** 

Issuing the GET STATION_STATUS command results in a Status Response String being returned from the station. The bits in this string may be interpreted to determine various operating characteristics about the particular station. 

###### **_Command Usage_** 

There are two uses of the GET STATION STATUS command: 

- **GET STATION_STATUS 1 thru 8** Allows you to specify a particular status item to retrieve from the station (according to Table 1) 

- **GET STATION_STATUS ALL** Returns status information for all eight (8) status items from the station; as shown, each Source Field (1 thru 8) along with its status field is returned in a concatenated format, with each line ending in an 8-bit checksum 

The two examples shown below illustrate the structure of the Status Response Strings returned from the station for each usage type. (GET STATION_STATUS 3 and GET STATION_STATUS ALL are shown in this example.) 

68P81131E57~O 7/31/01 

6 

Serial Interface **Specifications** 

7 

68P81131E57-0 7/31/01 

_Quantar/Quantro_ Station and Receiver Products 

###### **_Interpreting the Status Response Strings_** 

After issuing the desired command (GET STATION_STATUS 1 thru 8 or GET STATION_STATUS ALL), you may interpret the Status Response String returned from the station by using the information in Table 1. 

**_Table_** 1. Interpreting Bits in Status Response String 

|OOOOHEX|Reserved|31thru 22|Re|served<br>Not Used|
|---|---|---|---|---|
||Date<br> <br>|21thru 17|Month|00001 (Jan) thru 01100 (Dec)|
|0001HEX|_(Following_<br>_station_<br>_reset, date is reset to_<br>|16thru12|Day|00001(1st) thru11111(31st)|
||_11111900)_|11thru 0|Year|12-bit binary converted to decimal<br>(e.g., 011101101100=1900)|
|||31thru17||Not Used|
||Time|16 thru12|Hour|00000 (midnight) thru10111(23)|
|0002HEX|_(24-Hour format)_|11thru 6|Minutes|000000(0)thru 111010 (59)|
|||5 thru 0|Seconds|000000(0)thru 111010 (59)|
|||31- 30|External Ref<br>(UHSO or<br>External)||
|||29 - 28|Power Suppy<br>Fan||
|||27 - 26|PAFan|00=N/A<br>11= Failure|
|||25 - 24|Receiver<br>Module|10<br>Operational|
|||23 - 22|Exciter Module||
|0003|Hardware States #1|21<br>20|Power Supply<br>Module||
|HEX||19 - 18|Overvoltage<br>Alarm|_00=NIA_<br>11=Alarm<br>10= No Alarm|
|||17 - 16<br>15 - 14|ACState<br>Wireline Module<br>Failure|00=N/A<br>11<br>Failure<br>10=Operational<br>00=N/A<br>11=Failure<br>10=Operational|
|||13 - 12|Wireline Module<br>Status|00=N/A<br>11<br>On<br>10=Off|
|||contin|ued on next page||



68P81131E57~O 7/31/01 

8 

Serial Interface Specifications 

|Source <br>**Field**|I<br>**StatU!Item**|**Bit Numbers**|**Bit De**<br>**Parameter**|**scriptions**<br>**Values**|
|---|---|---|---|---|
|||11- 10|Receiver<br>Module#2<br>Lock|00=N/A<br>11=Locked<br>10=Out of Lock|
|||9<br>8|Receiver<br>Module #1<br>Lock|00=N/A<br>11=Locked<br>10=Out of Lock|
|||7-6|Exciter Module<br>Lock|00=N/A<br>11=Locked<br>10=Out of Lock|
|0003HEX|Hardware States # 1|5-4|PAKeyed and<br>at Expected<br>Output Power<br>(Asset via<br>RSS)|00=N/A<br>11= Keyed and Expected Output<br>10=Not Keyed or Keyed and not at<br>Expected Output|
|||3<br>2|PAOutput Less<br>than Expected<br>(Asset via<br>RSS)|00=N/A<br>11=PAKeyed and Less than<br>Expected Output<br>10=PANot Keyed orPAKeyed and<br>at Expected Output|
|||1 - 0|PAOutput<br>Status|00=N/A<br>11=Keyed and No Output<br>10=PAOutput at Expected Level|
|||31- 27||Not Used|
|||26|Secure<br>(12Kilobits)<br>Station Type|o=Not Secure<br>1=Secure|
|||25|ASTRO Station<br>Type|0=Not ASTRO<br>1=ASTRO|
|||24|Analog Station<br>Type|o= Not Analog<br>1=Analog|
|0004HEX|Software States # 1|23|Trunked<br>System Type|0<br>Not Trunked<br>1=Trunked(IRor 6809)|
|||22 - 21|Analog Wireline<br>Link Status|00=N/A<br>10=Failure<br>11=Operational|
|||20 - 19|Digital Wireline<br>Link Status|00=N/A<br>10=Failure<br>11=Operational|
|||18 - 17|RxActivity|00= None<br>01<br>Analog<br>10=ASTRO|
|||||11=SECURENET|
|||continu|ed on next page||



9 

68P81131E57-0 7/31/01 

_Quantar/Quantro_ Station and Receiver Products 

|**Sourel**<br> <br>**Field**|I<br>**StatU!Item**|**Bit Numbers**|**Bit Desc**<br>**Parameter**|**riptions**<br>**Values**|
|---|---|---|---|---|
|||16 - 15|TxInhibit|00=N/A<br>10=Tx Enabled<br>11=Tx Inhibited|
|||14 - 13|Intercom|00 = N/A<br>10=Enabled<br>11;:::Inhibited|
|||12|Access Disable<br>Status|o= Station Enabled<br>1;:::Access Disabled|
|||11- 10|Selective<br>Alarms|00 = N/A<br>11=Enabled<br>10=Disabled|
|0004HEX|Software States # 1|9-8|Station Alarms|00=N/A<br>11=Enabled<br>10;:::Disabled|
|||7-6|Station Disable|00 = N/A<br>11<br>Disabled<br>10=Operational|
|||5-4|TxPLOn/Off|00=N/A<br>11=On<br>10=Off|
|||3-2|RxPLOn/Off|00<br>N/A<br>11=On<br>10=Off|
|||1 - 0|Repeater State|00;:::N/A<br>11;:::Set Up<br>10=Knocked Down|
|||31- 8||Not Used|
|||7<br>6|ISW Detect<br>_(IntelliRepeater_<br>only)|00;:::N/A<br>11;:::Active<br>10=Inactive|
|0005HEX|Trunking States #1|5-4|Active Master<br>_(/ntelliRepeater_<br>only)|00;:::N/A<br>11=Active<br>10=Inactive|
|||3-2|Control or Voice<br>Channel|00<br>N/A<br>11=Control<br>10=Voice|
|||1 - 0|Failsoft Mode|00=N/A<br>01- Off<br>10<br>Site Failsoft<br>11=Normal|



68P81131E57~O 7/31/01 

**10** 

Serial Interface Specifications 

|**SourcI**<br>**I**|**StatU!Item**<br>||**Bit De**|**scriptions**|
|---|---|---|---|---|
|.<br>**Field**||**BitNumbers**|**Parameter**|**Values**|
|||31- 16||Not Used|
||Chl|15 - 8|Total Channels<br>Configured<br>(See note)|00000001(1)thru 11111111 (255)|
|0006HEX|anne<br>Information|7-0|Current Station<br>Channel<br>(See note)|00000001(1)thru 11111111 (255)|
|||**Note**<br>_Thest_<br>_28 channels m_|_ation currently supp_<br>_aximum_**_(InteIliRepe_**|_orts_16_maximum (Conventional)and_<br>**_ater)._**|
|||31- 29||Not Used|
|||28|Configuration|o=Receiver only configuration<br>1=Receiver/Transmitter<br>configuration|
|||27 - 20|VSWR|00000001(1)thru 11111111 (255)<br>Divide decimal value by 10 to obtain<br>VSWR<br>(e.g., 00001011 reported=decimal<br>11;11-:- 1 0=VSWR of 1.1: 1 )|
|0007HEX|Current<br>Measured<br>Power|19 - 10|Reverse Power|0000000000(0)thru<br>1111111111 (1023)<br>Multiply decimal value by.01961to<br>obtain valueinWatts<br>(e.g., 0000100101 reported=37<br>decimal; 37 x.01961=.725 Watts|
|||9<br>0|Forward Power|0000000000(0)thru<br>1111111111 (1023)<br>Multiply decimal value by.01961to<br>obtain valueinWatts<br>(e.g., 1101000101 reported=<br>937 decimal; 937 x.01961<br>18.37 Watts|
|0008HEX|Stored<br>Measured<br>Power|Sameas_Curr_<br>previous trans<br>**Note**_Upon s_<br>_default to maxi_<br>_since the last r_|_ent Measured Pow_<br>mitter keyup.<br>_tation reset, values fo_<br>_mum values, indicati_<br>_eset._|_er_(above) except values apply to last<br>_r Reverse PowerandForward Power will_<br>_ng that the station has not been keyed up_|



**11** 

68P81131E57-0 7/31/01 

END OF PART 15 AND DOCUMENT 

