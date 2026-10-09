module testbench;
    reg [3:0] a, b;
    reg [1:0] sel;
    wire [3:0] result;

    alu_4 uut(.a(a), .b(b), .sel(sel), .result(result));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        $monitor("time=%0t a=%d b=%d sel=%b result=%d", $time, a, b, sel, result);

        a = 4'd9; b = 4'd5;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        a = 4'd3; b = 4'd7;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $finish;
    end
endmodule