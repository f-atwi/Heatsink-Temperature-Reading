# Heatsink_Temperature_Reading
A project to read temperature of a heatsink by 5 thermocouples and 3D visualize them on the computer.

The PCB design was made completely on Eagle. 
Custom packages for the AD8495 where created to make the board. The board was designed as a shield for the STM32 Nucleo F411RE and also compatible with Arduino boards. 
PDFs of the schematic and board as well as the PCB project files can be found.

The code for the STM32 Nucleo F411RE board was written on the STM32Cube IDE. 
The code initialized an ADC to read data from the designed shield, a DMA to transfer data from ADC to memory, and a UART to tranfer data to the PC.
The data read are also paired with a sensor ID for correct reading on the PC end.

Solidworks was used to model the heatsink. This model will be used by matlab to show temperatures as colors.

The Matlab code is where all the visualizing takes place.
Matlab takes the obj file of the model. 
It uses data received from UART to get the temperatures. The IDs transmitted with the temperatures helps pinpoint which sensor the data is from.
The data is hence displayed as color where blue is the coldest (minimum is 15°C) and red is the hottest (maximum 60°C). 
