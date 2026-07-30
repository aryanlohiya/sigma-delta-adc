`timescale 1ns/1ps

module cic_filter(

    input clk,
    input rst,

    input bitstream,

    output reg signed [15:0] data_out

);

reg signed [15:0] integrator;
reg signed [15:0] comb;
reg signed [15:0] previous;

reg [2:0] count;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        integrator <= 0;
        comb <= 0;
        previous <= 0;
        data_out <= 0;
        count <= 0;
    end

    else
    begin

        // Integrator

        if(bitstream)
            integrator <= integrator + 1;
        else
            integrator <= integrator - 1;

        // Decimation by 8

        if(count == 7)
        begin

            count <= 0;

            comb <= integrator - previous;

            previous <= integrator;

            data_out <= comb;

        end

        else
        begin
            count <= count + 1;
        end

    end

end

endmodule
