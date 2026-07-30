`timescale 1ns/1ps

module tb_second_order_modulator;

reg clk;
reg rst;
reg signed [15:0] input_signal;

wire bitstream;

second_order_modulator uut(

    .clk(clk),
    .rst(rst),
    .input_signal(input_signal),
    .bitstream(bitstream)

);

////////////////////////////////////////////////////
// Clock
////////////////////////////////////////////////////

initial
begin

    clk = 0;

    forever #5 clk = ~clk;

end

////////////////////////////////////////////////////
// Test
////////////////////////////////////////////////////

initial
begin

    rst = 1;
    input_signal = 0;

    #20;

    rst = 0;

    input_signal = 16'sd5;
    #100;

    input_signal = -16'sd5;
    #100;

    input_signal = 16'sd2;
    #100;

    input_signal = 0;
    #100;

    $finish;

end

////////////////////////////////////////////////////
// Monitor
////////////////////////////////////////////////////

initial
begin

    $monitor("Time=%0t Input=%0d Bitstream=%b",
             $time,input_signal,bitstream);

end

////////////////////////////////////////////////////
// Waveforms
////////////////////////////////////////////////////

initial
begin

    $dumpfile("dump.vcd");
    $dumpvars;

end

endmodule
