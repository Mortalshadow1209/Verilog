module testbench;
    reg [3:0] a, b;
    reg sub;
    wire [3:0] result;
    wire cout;

    addsub_4 uut(.a(a), .b(b), .sub(sub), .result(result), .cout(cout));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        $monitor("time=%0t a=%d b=%d sub=%b result=%d cout=%b", $time, a, b, sub, result, cout);

        a = 7; b = 3; sub = 0; #10;
        a = 7; b = 3; sub = 1; #10;
        a = 5; b = 9; sub = 0; #10;
        a = 3; b = 7; sub = 1; #10;

        $finish;
    end
endmodule