module testbench;
    reg clk, reset, din;
    wire [3:0] q;

    shift4 uut(.clk(clk), .reset(reset), .din(din), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        $monitor("time=%0t reset=%b din=%b q=%b", $time, reset, din, q);

        reset = 1; din = 0; #12;
        reset = 0; din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;
        din = 0; #10;
        din = 0; #10;

        $finish;
    end
endmodule