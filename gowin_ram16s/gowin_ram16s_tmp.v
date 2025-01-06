//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.9.03 Education (64-bit)
//Part Number: GW2AR-LV18QN88C8/I7
//Device: GW2AR-18
//Device Version: C
//Created Time: Sun Jan  5 15:07:55 2025

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    Gowin_RAM16S your_instance_name(
        .dout(dout), //output [7:0] dout
        .di(di), //input [7:0] di
        .ad(ad), //input [3:0] ad
        .wre(wre), //input wre
        .clk(clk) //input clk
    );

//--------Copy end-------------------
