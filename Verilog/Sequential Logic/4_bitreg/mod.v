module reg4(
    input clk,
    input reset,
    input en,
    input [3:0] d,
    output reg [3:0]q
);
    always @(posedge clk) begin
        if (reset)
            q <= 0;
        else if (en)
            q <= d;
    end
endmodule