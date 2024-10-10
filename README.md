# Tic-Tac-Toe (Tris) on FPGA

This project implements the classic game of Tic-Tac-Toe (Tris) using an FPGA. The game logic is written in VHDL and runs on a Basys 3 FPGA board. Players input their moves via a custom keypad, and the state of the game is transmitted via UART to a Python-based graphical interface, where the game is visualized and controlled.

## Abstract
The goal of this project is to implement Tic-Tac-Toe on an FPGA, allowing two players to input their moves using a keypad, and visualize the game state and results on a PC. The project required the development of a hierarchical structure in VHDL, establishing a UART connection between the FPGA and the PC, and building a graphical interface in Python using the Tkinter library.

## Table of Contents
- [Features](#features)
- [Architecture Overview](#architecture-overview)
- [Project Phases](#project-phases)
- [Technical Details](#technical-details)
- [How to Run](#how-to-run)
- [Hardware Setup](#hardware-setup)
- [Software Setup](#software-setup)
- [Future Improvements](#future-improvements)
- [Authors](#authors)

## Features
- **FPGA Game Logic**: Handles player moves, turn switching, and victory/draw detection, all implemented in VHDL.
- **UART Communication**: Sends the game state from the FPGA to the PC for graphical visualization using a custom serial protocol.
- **Python Graphical Interface**: Built using Tkinter to display the game grid, player turns, and results on a PC.
- **Custom Keypad**: A 9-button keypad is used by players to input their moves, representing the cells of the Tic-Tac-Toe grid.

## Architecture Overview
The system is divided into two main components: the **logic module** and the **graphical module**.

1. **Logic Module (VHDL on FPGA)**:
   - Reads player inputs from the keypad.
   - Manages the game state (grid updates, turn management, and victory detection).
   - Transmits the game state via UART to the PC.
   
2. **Graphical Module (Python on PC)**:
   - Receives game state data via UART.
   - Displays the game grid and player symbols (X, O).
   - Shows the current player’s turn and the final result (win, draw).
   - Animates game start and end.

## Project Phases
The development process was broken into the following stages:

1. **Problem Definition**: Initial diagrams and abstract design of the game logic.
2. **Research**: Investigation of existing works related to UART communication and VHDL implementations of game logic.
3. **VHDL Design**:
   - Created a block diagram of the game logic.
   - Implemented the Tic-Tac-Toe mechanics in VHDL using entity blocks.
   - Developed UART communication to send the game state to the PC.
   
4. **Graphical Interface Design**:
   - Used Python and Tkinter to create the GUI that displays the game state.
   - Integrated animations for game start, turns, and results.

5. **Testing and Debugging**:
   - Tested individual components (keypad, game logic, UART, and GUI) through testbenches and simulations.
   - Validated the final system through hardware tests and real-time gameplay simulations.

## Technical Details

### VHDL Implementation
The FPGA logic was divided into the following entities:

- **inputReader**: Reads player inputs from the keypad and generates commands.
- **turnManager**: Manages turns and updates the game grid based on player moves.
- **winChecker**: Detects whether there is a winner or if the game ends in a draw.
- **outEncoder**: Encodes the game state into a 24-bit output vector for transmission over UART.

Each entity communicates through signals representing the game state, such as `gridX`, `gridO`, `turn`, and `result`.

### UART Communication
- UART protocol was implemented to send the 24-bit encoded game state from the FPGA to the PC.
- Transmission includes the game grid, current turn, and game result.
- A baud rate of 9600 was chosen, with a custom clock divider to match the FPGA’s 100MHz clock.

### Python GUI
- The graphical interface was built using Tkinter.
- **Functions**:
  - `placeX(cell)` and `placeO(cell)` to place the respective symbols in the grid.
  - `turnChange(turn)` to display the current player's turn.
  - `endGame(result)` to display the final result (win/draw).
  - `animationStart()` and `animationFinish()` for start/finish animations.
- The GUI is driven by a `commandReader` script that decodes the incoming UART data and updates the screen accordingly.

### Keypad
- The keypad consists of 9 buttons corresponding to the Tic-Tac-Toe grid cells (0-8).
- Each button press sends a signal to the FPGA, where the game logic updates the state accordingly.
- A **debouncing circuit** was implemented to handle signal stability and avoid false triggers.

## How to Run

### Hardware Setup
1. **Connect the Keypad**:
   - Connect the 9-button keypad to the Basys 3 FPGA via Pmod headers.
   
2. **UART Setup**:
   - Establish a serial connection between the FPGA and the PC (e.g., using a USB-to-UART converter).

### Software Setup
1. **FPGA Programming**:
   - Use Vivado to synthesize and upload the VHDL code to the Basys 3 FPGA.
   
2. **Run the Python GUI**:
   - Install Python and Tkinter on your PC.
   - Run the `main.py` script to start the graphical interface.

3. **Start Playing**:
   - Use the keypad to input moves.
   - The GUI will display the game progress, turns, and results.

## Future Improvements
- **VGA Output**: Implement VGA output to display the game directly from the FPGA to an external monitor.
- **Full UART Duplex**: Expand UART communication to support two-way data flow, adding error detection and acknowledgment.
- **Enhanced GUI**: Improve the graphical interface with richer animations and smoother transitions.
- **Microprocessor Integration**: Introduce a microprocessor (e.g., Microblaze) for handling more complex logic and graphical tasks.

The project is open-source and welcomes contributions from the community. Feel free to fork this repository, open issues, or suggest improvements.

Note: more detailed documentation in "Tesina.pdf" file, only in italian (english version soon online).

## Authors
- Samuele Ceccarelli
- Filippo Ottaviani
