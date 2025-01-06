//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.9.03 Education (64-bit)
//Part Number: GW2AR-LV18QN88C8/I7
//Device: GW2AR-18
//Device Version: C
//Created Time: Sun Jan  5 15:07:55 2025

module Gowin_RAM16S (dout, di, ad, wre, clk);

output [7:0] dout;
input [7:0] di;
input [3:0] ad;
input wre;
input clk;

RAM16S4 ram16s_inst_0 ( //lower bits
    .DO(dout[3:0]),
    .DI(di[3:0]),
    .AD(ad[3:0]),
    .WRE(wre),
    .CLK(clk)
);

defparam ram16s_inst_0.INIT_0 = 16'b0101_0101_0000_0000; // lower bits
defparam ram16s_inst_0.INIT_1 = 16'b0011_0011_0000_0000;
defparam ram16s_inst_0.INIT_2 = 16'b0000_1111_0000_0000;
defparam ram16s_inst_0.INIT_3 = 16'b0000_0000_1000_0000; // adress 0 is on the right and it goes down

RAM16S4 ram16s_inst_1 (
    .DO(dout[7:4]),
    .DI(di[7:4]),
    .AD(ad[3:0]),
    .WRE(wre),
    .CLK(clk)
);

defparam ram16s_inst_1.INIT_0 = 16'b0000_0000_0000_0000; // upper bits
defparam ram16s_inst_1.INIT_1 = 16'b0000_0000_0000_0000;
defparam ram16s_inst_1.INIT_2 = 16'b0000_0000_0000_0000;
defparam ram16s_inst_1.INIT_3 = 16'b0000_0000_0000_0001;

endmodule //Gowin_RAM16S
