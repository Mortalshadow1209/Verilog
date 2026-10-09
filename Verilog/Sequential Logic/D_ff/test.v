module testbench;
    reg clk, reset, d;
    wire q;

    dff uut(.clk(clk), .reset(reset), .d(d), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        $monitor("time=%0t clk=%b reset=%b d=%b q=%b", $time, clk, reset, d, q);

        reset = 1; d = 0; #18;
        reset = 0; d = 1; #10;
        d = 0; #10;
        d = 1; #2;
        d = 0; #8;
        d = 1; #10;

        $finish;
    end
endmodule