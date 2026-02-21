## Snake Game - Verilog

# Description
This project implements the classic Snake game using Verilog for a Digital Circuit Design group project. The game is controlled with hardware and uses VGA for displaying the game screen. 

# Features
- Button controlled snake movement
- VGA display (800x600 resolution)
- Random food generation
- Score display using seven segment display
- Collision detection and game control

# Modules
- button_controller.v : handles user input
- clock_wizard: generates clock at various frequencies
- constraints: connecting software to hardware
- display_controller: controls game display
- random_generator: generates food positions
- seven_seg_controller: displays score
- snake_game_logic: core game behavior
- snake_game_top: top level module
- top_testbench: simulation testbench
- vga_controller_800x600: handles VGA

