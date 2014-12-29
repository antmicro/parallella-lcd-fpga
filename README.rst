Parallella LCD baseboard FPGA project
=====================================

This repository holds the Xilinx PS project to be used with the Parallella LCD baseboard to get LCD output.

The project includes a simple graphics ipcore to display data on the LCD.

The LCD IPCore is based on Digilent Inc's HDMI code for the ZYBO board.

Example binary files
====================

For convienience, example binary files (to be put on an sdcard and booted from U-Boot) are provided:

* `DTB <https://github.com/antmicro/parallella-lcd-fpga/raw/master/bin/devicetree_lcd.dtb>`_
* `Bitstream <https://github.com/antmicro/parallella-lcd-fpga/raw/master/bin/system_top.bit.bin>`_
* `Kernel <https://github.com/antmicro/parallella-lcd-fpga/blob/master/bin/uImage>`_

Those files were tested on a Parallella board + `Antmicro's LCD baseboard <https://github.com/antmicro/parallella-lcd-baseboard>`_ and EP0700M06 LCD screen from EDT with I2C multitouch TS.

Parameters for the LCD screen can be adjusted in the DTB file, in the ``axi_hdmi/lcd@0`` section.
For different screens an adapter board might be needed.
