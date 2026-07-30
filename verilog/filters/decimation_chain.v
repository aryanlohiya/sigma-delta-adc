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
`timescale 1ns/1ps

module decimation_chain(

    input clk,
    input rst,
    input bitstream,

    output signed [15:0] data_out

);

wire signed [15:0] cic_out;

cic_filter cic(

    .clk(clk),
    .rst(rst),
    .bitstream(bitstream),
    .data_out(cic_out)

);

fir_filter fir(

    .clk(clk),
    .rst(rst),
    .data_in(cic_out),
    .data_out(data_out)

);

endmodule
