1. Typical Relay Closure Output Circuit
Transistor: One NPN bipolar junction transistor (BJT) is connected as a low-side switch. Its emitter is connected to ground, and its collector is connected to one end of the relay coil.

Input: The input signal enters the transistor's base through a series resistor labeled 3.9 kΩ.

Relay coil: One end of the relay coil is connected to the transistor's collector. The other end is connected to the +5 V supply.

Flyback diode: A diode is connected in parallel with the relay coil. Its cathode is connected to the +5 V side of the coil, and its anode is connected to the collector side of the coil.

Relay contacts: The relay includes a mechanically actuated, normally open contact. The contact's two terminals are brought out as the two OUTPUT connections shown to the right of the relay symbol. These contacts are electrically separate from the transistor's control circuit.

Ground: The transistor emitter is connected to ground.

Signal path: A positive input signal passes through the 3.9 kΩ resistor into the transistor's base. When the transistor conducts, current flows from +5 V through the relay coil and the transistor to ground. The relay coil actuates the contact. When the transistor stops conducting, the coil is de-energized and the contact returns to its normal state.

2. Typical Transistor-Coupled Input Circuit
Transistor: One NPN bipolar junction transistor is connected with its emitter to ground, its collector to the output node, and its base driven through a resistor network.

Input connection: The input signal enters from the left and connects to one end of a 10 kΩ series resistor. The other end of this resistor connects to the transistor's base node.

Base pull-up resistor: A 10 kΩ resistor connects the input-side node, before the series resistor, to the +5 V supply.

Base pull-down resistor: A 10 kΩ resistor connects the transistor's base node, after the series resistor, to ground.

Collector pull-up resistor: A 10 kΩ resistor connects the transistor's collector to the +5 V supply.

Output: The output is taken from the collector node, at the junction of the transistor collector and the collector pull-up resistor.

Ground: The transistor emitter and the lower end of the base pull-down resistor are connected to ground.

Signal path: The input-side pull-up resistor biases the input node toward +5 V. The series resistor connects this node to the transistor base, while the base pull-down resistor biases the base toward ground. When the transistor conducts, the collector output is pulled toward ground. When the transistor is off, the collector pull-up resistor brings the output toward +5 V.

3. Typical Opto-Coupled Input Circuit
Optocoupler: The circuit contains an optocoupler with an internal light-emitting diode (LED) on the input side and a light-sensitive transistor on the output side. The two internal components are shown inside a rectangular enclosure and are optically coupled.

Positive input connection: The INPUT (+) terminal enters from the left and connects through two series resistors, each labeled 3.9 kΩ, to the optocoupler's internal LED anode.

Input-side capacitors: A 220 pF capacitor connects the positive input line to ground. A second 220 pF capacitor connects the INPUT (−) line to ground.

Negative input connection: The INPUT (−) terminal connects to the optocoupler's internal LED cathode. This line also connects to ground through the capacitor labeled 220 pF.

Output-side transistor: The optocoupler's internal phototransistor has its collector connected to the output node and its emitter connected to ground.

Output pull-up resistor: A 100 kΩ resistor connects the output node to the +5 V supply.

Output-side capacitor: A 0.1 µF capacitor connects the optocoupler's output-side circuit node, associated with the phototransistor emitter-side wiring, to ground as drawn. The capacitor's upper terminal connects to the node shown beneath the optocoupler enclosure, and its lower terminal connects to ground.

Output: The output is taken from the phototransistor collector node, which is also connected to the 100 kΩ pull-up resistor.

Ground connections: The input-side capacitors and the output-side capacitor have separate ground symbols. The diagram does not show a direct electrical connection between the optocoupler's input and output sides.

Signal path: Current entering through INPUT (+) and leaving through INPUT (−) can illuminate the internal LED. The light activates the phototransistor, allowing current to flow from the +5 V supply through the 100 kΩ pull-up resistor and the phototransistor to ground. This pulls the output node toward ground. When the phototransistor is off, the pull-up resistor brings the output toward +5 V.

4. Typical Transistor-Coupled Output Circuit
Transistor: One NPN bipolar junction transistor is connected as a low-side switching transistor. Its emitter is connected to ground, and its collector forms the output node.

Input: The input signal enters from the left and passes through a series resistor labeled 3.9 kΩ before reaching the transistor's base.

Output: The output connection is taken directly from the transistor's collector. The output node is shown with an arrow pointing to the right.

Ground: The transistor emitter is connected to ground.

Collector connection: No collector pull-up resistor or other collector load is shown in this diagram.

Signal path: A positive input signal supplies base current through the 3.9 kΩ resistor. When the transistor conducts, the collector output is pulled toward ground through the transistor. When the transistor is off, the collector is electrically undriven by the components shown, so its voltage depends on any external circuitry connected to the output.
