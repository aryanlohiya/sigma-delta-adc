`timescale 1ns/1ps

module tb_first_order_modulator;

reg clk;
reg rst;
reg signed [15:0] input_signal;

wire bitstream;

first_order_modulator uut (

    .clk(clk),
    .rst(rst),
    .input_signal(input_signal),
    .bitstream(bitstream)

);

//////////////////////////////////////////////////
// Clock Generation
//////////////////////////////////////////////////

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

//////////////////////////////////////////////////
// Test Sequence
//////////////////////////////////////////////////

initial
begin

    rst = 1;
    input_signal = 0;

    #20;
    rst = 0;

    // Positive input

    input_signal = 16'sd5;
    #100;

    // Negative input

    input_signal = -16'sd5;
    #100;

    // Small positive input

    input_signal = 16'sd2;
    #100;

    // Zero input

    input_signal = 16'sd0;
    #100;

    $finish;

end

//////////////////////////////////////////////////
// Monitor Signals
//////////////////////////////////////////////////

initial
begin

    $monitor("Time=%0t  Input=%0d  Bitstream=%b",
             $time,input_signal,bitstream);

end
  //////////////////////////////////////////////////
// Dump Waveforms
//////////////////////////////////////////////////

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_first_order_modulator);
end

endmodule
