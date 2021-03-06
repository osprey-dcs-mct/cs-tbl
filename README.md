# MCT Table Vertical Coordinate System IOC

This IOC implements the vertical coordinate system for the MCT experimental
tables.

## Overview

### Axes

The coordinate system axes are:
- vertical
- pitch

The physical axes are:

- upstream 
- downstream

### Records 

One transform record is used to perform the control actions, converting the
requested coordinate system setpoints to the required physical motor positions
using the inverse kinematic equations.

A second transform record performs forward kinematic calculations from the motor
positions to give real time indication of the coordinate system axis positions.

#### Motor record interface

Soft Channel motor records are used to provide a consistent interface to the
coordinate system axes.

The motor records are:

- $(P)$(Q)linr\_motor
- $(P)$(Q)pitch\_motor

#### Synchronization

A synchronization record triggers updates of the transform record setpoints to
align them with the current coordinate system axis positions. This is used if
the motors have been moved manually.

#### Move completion

`busy` records are used to implement the move completion functionality. Any
client that writes to a coordinate system axis setpoint with a Channel Access putCallback request will block until the move has completed.

```console
caput -c -w 10 MCT:TBL1:CS_Y:linr 4
```

## Dependencies

This IOC requires the following EPICS support modules:

- calc
- asyn
- busy

Optional support modules that are included (but not essential for basic
operation of the coordinate system) are:

- iocStats
- autosave

## TODO

- Remove optics moduule


