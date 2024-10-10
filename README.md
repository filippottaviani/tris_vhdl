# Tris Game on FPGA

This project implements the classic Tic-Tac-Toe (Tris) game using an FPGA, programmed in VHDL. The game logic runs on the FPGA, while the state of the game is displayed on a PC using a graphical interface built with Python. Players make their moves using a custom keypad, and the game status is shown in real time on the screen.

## Features
- **FPGA Game Logic**: Handles player inputs, turn management, and win/draw conditions, written in VHDL.
- **UART Communication**: Sends the game state from the FPGA to the PC via a UART serial connection.
- **Python GUI**: Built with the Tkinter library, it displays the game grid, player turns, and game results.
- **Custom Keypad**: A 9-button keypad allows players to input their moves, representing the grid positions (0-8).

## Project Components
1. **Game Logic (VHDL)**:
   - Processes player inputs from the keypad.
   - Switches turns between players.
   - Detects win or draw conditions and sends the game state via UART.
   
2. **UART Interface**:
   - Implements asynchronous communication between the FPGA and the PC.
   - Sends game data for graphical representation on the PC.

3. **Python GUI**:
   - Displays the game grid, current turn, and game results.
   - Includes animations for system start and end.
   - Built with the Tkinter library.

4. **Custom Keypad**:
   - A keypad with 9 buttons, each representing a cell in the Tic-Tac-Toe grid.
   - Connected to the Basys 3 FPGA via Pmod.

## Technical Details
- **FPGA Board**: Basys 3.
- **Programming Language**: VHDL (for FPGA), Python (for GUI).
- **UART Protocol**: Used for serial communication between the FPGA and the PC.
- **Tools**:
  - **Vivado**: For VHDL synthesis and simulation.
  - **Tkinter**: Python library used to build the GUI.

## Setup
1. **Hardware Setup**:
   - Connect the 9-button keypad to the Basys 3 FPGA using Pmod connections.
   - Set up a UART serial connection between the FPGA and the PC.

2. **Software Setup**:
   - Use Vivado to synthesize and upload the VHDL code to the FPGA.
   - Run the Python script on your PC to launch the GUI and start the game.

## How to Play
1. Press the buttons on the keypad (each representing a cell from 0 to 8) to input your move.
2. The GUI will display the current state of the game, including the player turns and moves.
3. The game will automatically detect when there is a winner or a draw and display the result.

## Future Improvements
- Implement VGA output for displaying the game on a monitor connected to the FPGA.
- Enhance the GUI with better animations and a more interactive user experience.
- Add additional features to the UART communication, such as error detection and acknowledgment.

Note: more detailed documentation in "Tesina.pdf" file, only in italian (english version soon online).

## Authors
- Samuele Ceccarelli
- Filippo Ottaviani
