`timescale 1ns/1ps

module tb_cic_filter;

reg clk;
reg rst;
reg bitstream;

wire signed [15:0] data_out;

cic_filter uut(

    .clk(clk),
    .rst(rst),
    .bitstream(bitstream),
    .data_out(data_out)

);

/////////////////////////////////////////////////
// Clock
/////////////////////////////////////////////////

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

/////////////////////////////////////////////////
// Test
/////////////////////////////////////////////////

initial
begin

    rst = 1;
    bitstream = 0;

    #20;
    rst = 0;

    // Sample Bitstream

    bitstream = 1; #10;
    bitstream = 0; #10;
    bitstream = 1; #10;
    bitstream = 1; #10;
    bitstream = 0; #10;
    bitstream = 0; #10;
    bitstream = 1; #10;
    bitstream = 0; #10;

    bitstream = 1; #10;
    bitstream = 1; #10;
    bitstream = 1; #10;
    bitstream = 0; #10;
    bitstream = 0; #10;
    bitstream = 1; #10;
    bitstream = 0; #10;
    bitstream = 1; #10;

    #100;

    $finish;

end

/////////////////////////////////////////////////
// Monitor
/////////////////////////////////////////////////

initial
begin

    $monitor("Time=%0t  Bit=%b  Output=%0d",
             $time,bitstream,data_out);

end

/////////////////////////////////////////////////
// Waveforms
/////////////////////////////////////////////////

initial
begin

    $dumpfile("dump.vcd");
    $dumpvars;

end

endmodule
