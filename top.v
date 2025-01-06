
module top
(
    input clk,
    output [5:0] led,
    input wire uart_rx,
    output wire uart_tx
);

localparam WAIT_TIME = 13500000; // .5 second
reg [5:0] ledCounter = 0;
reg [23:0] clockCounter = 0;

wire [7:0] dout;
reg [7:0] di;
reg [3:0] address;
reg wre;
reg [5:0] ledOutput;
reg [3:0] ramAdress = 0;
Gowin_RAM16S your_instance_name(
        .dout(dout), //output [7:0] dout
        .di(di), //input [3:0] di
        .ad(address), //input [3:0] ad
        .wre(wre), //input wre
        .clk(clk) //input clk
);

wire [7:0] receivedData;
reg [7:0] dataOut;
reg sendOnLow;

uart usb(
    .clk(clk),
    .uart_rx(uart_rx),
    .uart_tx(uart_tx),
    //.led(led), 
    .dataOut(dataOut),
    .receivedData(receivedData),
    .sendOnLow(sendOnLow)
);


//always @(posedge clk) begin
//    clockCounter <= clockCounter + 1'b1;
//    if (clockCounter == WAIT_TIME) begin
//        clockCounter <= 0;
//        ramAdress <= ramAdress + 1;
//        
//        wre <= 0; // read
//        ad <= ramAdress;
//        di <= 4'b0000;
//        ledOutput <= dout;
//
//    end
//end

localparam UART_INTERVAL_SEND = 27000000/1; // 1 second
reg [31:0] txIntervalCounter = 0;

// UART
always @(posedge clk) begin
    if (txIntervalCounter == UART_INTERVAL_SEND) begin
        address <= receivedData;
        txIntervalCounter <= txIntervalCounter + 1;
        
    end else if (txIntervalCounter == UART_INTERVAL_SEND + 1) begin
        txIntervalCounter <= 0;
        sendOnLow <= 0;
        dataOut <= dout;
        
    end else begin
        txIntervalCounter <= txIntervalCounter + 1;
        sendOnLow <= 1;
    end
end

assign led = ~ledOutput;
endmodule
