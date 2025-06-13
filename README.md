# Final Project - Simulation of an inertial stabilization servo control system

The project implements the development of a servo control system simulation for inertial stabilization of a weapon system mounted on a vehicle.
The project was built by:
* A
* B
* Advisor:
* Place of execution of the project

## Project Overview

The project system focuses on stability control and inertial stabilization of rotating weapon systems. The mechanical system consists of a rotating body (the gun), connected to an electric servo motor through a gear system. The mechanical connection between the motor and the rotating body is described in a physical model known as a "molecule", in which the moments of inertia, stiffness and restraint of the gear are represented as a spring and a rotary damper

The system operates in two main modes of operation:
1. Torque Mode: In this mode, the system uses the measurements of the relative angular velocity of the tachometer, to generate appropriate current commands to the motor. The commands are controlled by PI controllers and pure gain controllers, which allow for accurate and fast response for the purposes of direct control of the force applied to the load.
2. Stabilization Mode: In stabilization mode, a gyroscope sensor is used to measure the angular velocity of the rotating body relative to the ground, enabling inertial stability control. In this mode, the system neutralizes external disturbances such as ground disturbances, friction, imbalance, and mechanical freedom (backlash) using advanced control techniques (such as notch-filters, anti-friction, and differentiator) to maintain the angle of the gun stable and inertial.

### The Molecular Model
The molecular model is a simulation approach to platform control, consisting of models of nonlinear components such as friction, inertia, and free moments. The name "molecule" refers to the description of complex processes using simple elements connected in a structure that simulates a mechanical system with freedom of movement, restraint, and stiffness. Using this model, we divided the system into inertial blocks (assemblies). Each inertial block is characterized by a moment (units of Newton∙meter). Any two such blocks can be described as a driving block and a driven block, the dynamics between which can be described as a spring and a restrainer.

<img src="./doc_images/molecule.png" width="350" alt="The Molecular Model" title="The Molecular Model" />

### Physical modeling

### Linear Control

### Non-Linear Control

### Enslavement

### Block Diagram of the Complete System

<img src="./doc_images/Block_Diagaram.png" width="350" alt="Block Diagram of the Complete System" title="Block Diagram of the Complete System" />

## Getting Started

### Prerequisites
* Matlab version R2020b or later
* Simulink
* [Project directory](Project)

### Installation
1. Download and install Matlab with Simulink from [Matlab website](https://www.mathworks.com/products/matlab.html).
2. Download the [Project directory](Project).
3. Change the folder path in Matlab to the location of the folder from previous stage.
4. Run the 'load_files.m' file in Matlab.
5. Open the '.slx' file in Simulink.


## Usage
Inside Simulink, double-click the GUI block, from where the entire system is controlled.

The system is divided into 3 parts:
- 2 axes - the elevation axis (at the top of the GUI) and the Traverse axis (at the bottom of the GUI). The control of each axis is independent of the other axis.
- A 'Run' button with a scope below it.

### Axis Control
Each axis is divided into 3 areas:
1. Gun system
2. Optics system (called Pod)
3. Tracking execution

#### Gun System Panel
<img src="./doc_images/Gun_system.png" width="350" alt="Screenshot of the GUI of the gun system panel" title="Screenshot of the GUI of the gun system panel" />

On the left side of the panel, you can control the following components:
1. Adding ground disturbances to the system.
2. Adding friction to the physical modeling of the system.
3. The left switch - adding an anti-friction feedforward technique, the right switch - adding a differentiator feedforward technique.
4. Adding backlash to the physical modeling of the system.
5. The left switch - closing a loop for the system, the right switch - closing a tachometric (up) or gyroscopic loop (down).
6. The left switch - inserting a step (up) or an external signal (down), the right switch - selecting the step height to be 1 (up) or 0.05 (down).

On the right side of the panel, the following signals can be viewed by double-clicking on the appropriate scope:
1. Gun system angle relative to the ground as measured by the gyroscopic mode.
2. Gun system speed relative to the ground as measured by the gyroscopic mode.
3. Gun system speed relative to the engine as measured by the tachometric mode.
4. Ground disturbance input.
5. Fire recoil from the gun.

#### Pod System Panel
<img src="./doc_images/Pod_system.png" width="350" alt="Screenshot of the GUI of the pod system panel" title="Screenshot of the GUI of the pod system panel" />

On the left side of the panel, you can control the following components:
1. Connecting the gun system to the observation pod.
2. Adding friction to the physical modeling of the system.
3. Adding a feedforward technique.
4. Adding backlash to the physical modeling of the system.
5. The left switch - closing a loop for the system, the right switch - closing a tachometric (up) or gyroscopic loop (down).
6. The left switch - inserting a step (up) or an external signal (down), the right switch - if the tracking signal is a step - selecting the step height to be 1 (up) or 0.05 (down).

> [!NOTE]
> It is not possible to introduce ground disturbances into only one of the systems since the enslavement is based, among other things, on the fact that the two systems experience the same disturbances and therefore the subtraction between them manages to overcome the disturbances.

On the right side of the panel, the following signals can be viewed by double-clicking on the appropriate scope:
1. Pod system angle relative to the ground as measured by the gyroscopic mode.
2. Pod system speed relative to the ground as measured by the gyroscopic mode.
3. Pod system speed relative to the engine as measured by the tachometric mode.

#### Tracking Panel
<img src="./doc_images/Tracking.png" width="350" alt="Screenshot of the GUI of the tracking panel" title="Screenshot of the GUI of the tracking panel" />

On the left side of the panel you can control:
1. Whether to insert a tracking signal into the observation pod.
2. Whether the tracking signal will be the given signal (up) or a step signal (down).
3. If the tracking signal is a step - is it at a height of 1 (up) or 0.05 (down).

On the right side of the panel, the following signals can be viewed by double-clicking on the appropriate scope:
1. Error signal between weapon angle and pod angle.
2. Integrated control scope including:
   - Ground disturbances entering the system
   - Fire recoil
   - Weapon angle
   - Pod angle
   - Tracking input
   - Tracking error

### Running Panel
<img src="./doc_images/Run.png" width="350" alt="Screenshot of the GUI of the run panel" title="Screenshot of the GUI of the run panel" />

Clicking the run button will run the simulation.

The simulation time will vary depending on the selections made in the switches and will be determined by the more stringent axis.

Below the run button there is a scope that displays the tracking error in the elevation axis as a function of the tracking error in the traverse axis. It displays approximately the last 15 seconds.

> [!IMPORTANT]
> The desired scopes must be opened before pressing the run button, in order to observe the system operation during runtime.

> [!CAUTION]
> Do not click the scope below the run button. It opens automatically when the simulation starts.
> Closing it after it opens will speed up the simulation run.
