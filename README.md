# 🚦 Traffic Light Controller Using Verilog & Vivado

## 📌 Project Overview

This project implements a **Traffic Light Controller** using **Verilog HDL** and is designed and simulated using **Xilinx Vivado**.

The controller manages the traffic signals at an intersection using a **Finite State Machine (FSM)**. The traffic lights change sequentially between **Red, Yellow, and Green** according to predefined timing conditions.

This project helps in understanding **digital logic design, FSMs, Verilog HDL, simulation, and FPGA-based design using Vivado**.

---

## 🎯 Objectives

* Design a traffic light controller using Verilog HDL.
* Implement the controller using a **Finite State Machine (FSM)**.
* Simulate the design using **Vivado Simulator**.
* Verify the correct sequence of traffic light signals.
* Understand how sequential digital circuits work.
* Gain practical experience with FPGA design tools.

---

## 🛠️ Tools & Technologies

* **HDL:** Verilog
* **Design Tool:** Xilinx Vivado
* **Simulation:** Vivado Simulator
* **Target:** FPGA
* **Concepts:** FSM, Sequential Logic, Counters, Digital Logic

---

## 🚦 Traffic Light States

The controller operates using three basic states:

| State  | Red | Yellow | Green |
| ------ | --- | ------ | ----- |
| RED    | ON  | OFF    | OFF   |
| GREEN  | OFF | OFF    | ON    |
| YELLOW | OFF | ON     | OFF   |

The sequence is:

```text
RED → GREEN → YELLOW → RED → ...
```

---

## 🔄 Working Principle

The Traffic Light Controller is implemented using a **Finite State Machine**.

### State 1 – RED

* Red LED is ON.
* Green and Yellow LEDs are OFF.
* Vehicles must STOP.

### State 2 – GREEN

* Green LED is ON.
* Red and Yellow LEDs are OFF.
* Vehicles can GO.

### State 3 – YELLOW

* Yellow LED is ON.
* Red and Green LEDs are OFF.
* Vehicles should SLOW DOWN / PREPARE TO STOP.

After the Yellow state, the controller returns to the Red state and the cycle repeats.

---

## 🧠 Finite State Machine

```text
             ┌─────────────┐
             │             │
             ▼             │
        ┌─────────┐        │
        │   RED   │        │
        └────┬────┘        │
             │             │
             ▼             │
        ┌─────────┐        │
        │  GREEN  │        │
        └────┬────┘        │
             │             │
             ▼             │
        ┌─────────┐        │
        │ YELLOW  │        │
        └────┬────┘        │
             │             │
             └─────────────┘
```

---

## 📂 Project Structure

```text
Traffic-Light-Controller/
│
├── README.md
│
├── src/
│   └── traffic_light.v
│
├── simulation/
│   └── traffic_light_tb.v
│
├── screenshots/
│   ├── rtl_schematic.png
│   ├── simulation_waveform.png
│   └── vivado_design.png
│
└── docs/
    └── project_report.pdf
```

---

## 💻 Verilog Design

The main Verilog module contains the FSM logic responsible for controlling the traffic lights.

Example output behavior:

```verilog
case (state)

    RED: begin
        red    = 1'b1;
        yellow = 1'b0;
        green  = 1'b0;
    end

    GREEN: begin
        red    = 1'b0;
        yellow = 1'b0;
        green  = 1'b1;
    end

    YELLOW: begin
        red    = 1'b0;
        yellow = 1'b1;
        green  = 1'b0;
    end

endcase
```

---

## 🧪 Simulation

The design is verified using a **Verilog Testbench** in Vivado.

The testbench provides:

* Clock signal
* Reset signal
* State transitions
* Output monitoring

Expected sequence:

```text
RED → GREEN → YELLOW → RED
```

The waveform should show only one traffic light active at a time.

---

## 📊 Expected Output

| Time | Red | Yellow | Green |
| ---- | --- | ------ | ----- |
| T1   | 1   | 0      | 0     |
| T2   | 0   | 0      | 1     |
| T3   | 0   | 1      | 0     |
| T4   | 1   | 0      | 0     |

This sequence repeats continuously.

---

## 🖥️ Vivado Implementation

### Step 1 – Create Project

Open **Xilinx Vivado** and select:

```text
Create Project
      ↓
RTL Project
      ↓
Add Verilog Sources
      ↓
Add Simulation Sources
      ↓
Select FPGA Device
```

### Step 2 – Add Source Files

Add:

```text
traffic_light.v
```

### Step 3 – Add Testbench

Add:

```text
traffic_light_tb.v
```

under **Simulation Sources**.

### Step 4 – Run Simulation

Go to:

```text
Flow Navigator
      ↓
Simulation
      ↓
Run Simulation
      ↓
Run Behavioral Simulation
```

### Step 5 – Check Waveform

Verify that:

```text
RED → GREEN → YELLOW → RED
```

is correctly generated in the waveform.

---

## 📸 Project Screenshots

You can add your Vivado screenshots here:

### RTL Schematic

```text
![RTL Schematic](screenshots/rtl_schematic.png)
```

### Simulation Waveform

```text
![Simulation Waveform](screenshots/simulation_waveform.png)
```

### Vivado Design

```text
![Vivado Design](screenshots/vivado_design.png)
```

---

## ✅ Advantages

* Simple and easy-to-understand FSM implementation.
* Can be implemented on an FPGA.
* Demonstrates real-world digital system control.
* Helps understand Verilog HDL and sequential logic.
* Easy to modify for different traffic patterns.

---

## 🚀 Future Enhancements

The project can be improved by adding:

* 🚗 Two-way traffic control.
* 🚶 Pedestrian crossing.
* ⏱️ Adjustable timing.
* 🚑 Emergency vehicle priority.
* 🔢 Seven-segment countdown display.
* 🚦 Multiple traffic junctions.
* FPGA board LED implementation.

---

## 🎓 Learning Outcomes

After completing this project, you can understand:

* Verilog HDL programming.
* Finite State Machines.
* Sequential and combinational logic.
* Clock and reset concepts.
* Verilog testbenches.
* Simulation waveforms.
* RTL schematic generation.
* FPGA design flow using Vivado.

---

## 👩‍💻 Author

**Shabnam Rihana**

ECE Student | VLSI Enthusiast

---

## ⭐ Conclusion

The **Traffic Light Controller** is a digital design project developed using **Verilog HDL and Xilinx Vivado**. It demonstrates the practical application of **Finite State Machines and sequential logic** to control traffic signals.

The project was simulated in Vivado to verify the correct operation and state transitions of the traffic lights.

