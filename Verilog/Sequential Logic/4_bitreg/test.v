module testbench;
    reg clk, reset, en;
    reg [3:0] d;
    wire [3:0] q;

    reg4 uut(.clk(clk), .reset(reset), .en(en), .d(d), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        $monitor("time=%0t reset=%b en=%b d=%d q=%d", $time, reset, en, d, q);

        reset = 1; en = 0; d = 4'd0; #12;
        reset = 0; en = 1; d = 4'd9; #10;
        d = 4'd5; en = 0; #10;
        d = 4'd12; #10;
        en = 1; #10;
        reset = 1; #10;

        $finish;
    end
endmodule