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

#### Gun system panel
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

#### Pod system panel
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

#### Tracking panel
<img src="./doc_images/Tracking.png" width="350" alt="Screenshot of the GUI of the tracking panel" title="Screenshot of the GUI of the tracking panel" />

On the left side of the panel you can control:
1. Whether to insert a tracking signal into the observation pod.
2. Whether the tracking signal will be the given signal (up) or a step signal (down).
3. If the tracking signal is a step - is it at a height of 1 (up) or 0.05 (down).

On the right side of the panel, the following signals can be viewed by double-clicking on the appropriate scope:
1. Error signal between weapon angle and pod angle.
2. Integrated control scope including:
   - Ground disturbances entering the system
   - Firing halyards
   - Weapon angle
   - Pod angle
   - Tracking input
   - Tracking error

