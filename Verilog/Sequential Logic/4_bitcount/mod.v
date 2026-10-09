module counter4(
    input clk,
    input reset,
    input en,
    output reg [3:0] count
);
    always @(posedge clk) begin
        if (reset)
            count <= 0;
        else if (en)
            count <= count + 1;
    end
endmodule