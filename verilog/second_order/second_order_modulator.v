`timescale 1ns/1ps

module second_order_modulator(

    input clk,
    input rst,

    input signed [15:0] input_signal,

    output reg bitstream

);

reg signed [15:0] error;
reg signed [15:0] feedback;

reg signed [15:0] integrator1;
reg signed [15:0] integrator2;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        error <= 0;
        feedback <= 0;

        integrator1 <= 0;
        integrator2 <= 0;

        bitstream <= 0;
    end

    else
    begin

        error <= input_signal - feedback;

        integrator1 <= integrator1 + error;

        integrator2 <= integrator2 + integrator1;

        if(integrator2 >= 0)
        begin
            bitstream <= 1'b1;
            feedback <= 16'sd1;
        end

        else
        begin
            bitstream <= 1'b0;
            feedback <= -16'sd1;
        end

    end

end

endmodule
