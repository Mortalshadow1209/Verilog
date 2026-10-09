module testbench;
    reg clk, reset, en;
    wire [3:0] count;

    counter4 uut(.clk(clk), .reset(reset), .en(en), .count(count));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        $monitor("time=%0t reset=%b en=%b count=%d", $time, reset, en, count);

        reset = 1; en = 0; #12;
        reset = 0; en = 1; #165;
        en = 0; #30;
        reset = 1; #10;

        $finish;
    end
endmodule