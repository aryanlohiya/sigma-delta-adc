`timescale 1ns/1ps

module first_order_modulator(

    input clk,
    input rst,

    input signed [15:0] input_signal,

    output reg bitstream

);

reg signed [15:0] integrator;
reg signed [15:0] feedback;
reg signed [15:0] error;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        integrator <= 0;
        feedback   <= 0;
        error      <= 0;
        bitstream  <= 0;
    end

    else
    begin

        error = input_signal - feedback;

        integrator = integrator + error;

        if(integrator >= 0)
        begin
            bitstream <= 1'b1;
            feedback  <= 16'sd1;
        end

        else
        begin
            bitstream <= 1'b0;
            feedback  <= -16'sd1;
        end

    end

end

endmodule
