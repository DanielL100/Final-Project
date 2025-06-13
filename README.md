# Final Project - Simulation of an inertial stabilization servo control system

The project implements the development of a servo control system simulation for inertial stabilization of a weapon system mounted on a vehicle.
The project was built by:
* A
* B
* Advisor:
* Place of execution of the project

## Project Overview

## Getting Started

#### Prerequisites
* Matlab version R2020b or later
* Simulink
* [Project directory](Project)

#### Installetion
1. Download and install Matlab with Simulink from [Matlab website]((https://www.mathworks.com/products/matlab.html))
2. Download the [Project directory](Project).
3. Change the folder path in Matlab to the location of the folder from previous stage.
4. Run the 'load_files.m' file in Matlab.
5. Open the '.slx' file in Simulink.


## Usage
Inside Simulink, double-click the GUI block, from where the entire system is controlled.

The system is divided into 3 parts:
- 2 axes - the elevation axis (at the top of the GUI) and the Traverse axis (at the bottom of the GUI). The control of each axis is independent of the other axis.
- A 'Run' button with a scope below it

#### Axis control
Each axis is divided into 3 areas:
1. Gun system
2. Optics system (called Pod)
3. Tracking execution

#### Weapon system
![Screenshot of the gun system block from Simulink GUI](doc Images/Gun system.png)
