`timescale 1ns/1ps

module tb_fir_filter;

reg clk;
reg rst;

reg signed [15:0] data_in;

wire signed [15:0] data_out;

fir_filter uut(

    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .data_out(data_out)

);

//////////////////////////////////////
// Clock
//////////////////////////////////////

initial
begin

    clk = 0;

    forever #5 clk = ~clk;

end

//////////////////////////////////////
// Test
//////////////////////////////////////

initial
begin

    rst = 1;
    data_in = 0;

    #20;

    rst = 0;

    data_in = 4;   #10;
    data_in = 8;   #10;
    data_in = 12;  #10;
    data_in = 16;  #10;
    data_in = 20;  #10;
    data_in = 24;  #10;
    data_in = 28;  #10;
    data_in = 32;  #10;

    #100;

    $finish;

end

//////////////////////////////////////
// Monitor
//////////////////////////////////////

initial
begin

    $monitor("Time=%0t Input=%0d Output=%0d",
             $time,data_in,data_out);

end

//////////////////////////////////////
// Waveforms
//////////////////////////////////////

initial
begin

    $dumpfile("dump.vcd");
    $dumpvars;

end

endmodule
