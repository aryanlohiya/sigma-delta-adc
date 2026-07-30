`timescale 1ns/1ps

module fir_filter(

    input clk,
    input rst,

    input signed [15:0] data_in,

    output reg signed [15:0] data_out

);

reg signed [15:0] x0, x1, x2, x3;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin

        x0 <= 0;
        x1 <= 0;
        x2 <= 0;
        x3 <= 0;

        data_out <= 0;

    end

    else
    begin

        x3 <= x2;
        x2 <= x1;
        x1 <= x0;
        x0 <= data_in;

        data_out <= (x0 + x1 + x2 + x3)/4;

    end

end

endmodule
