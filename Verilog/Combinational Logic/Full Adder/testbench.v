module testbench;
    reg a, b, ci;
    wire s, co;

    FA uut(.a(a), .b(b), .cin(ci), .sum(s), .cout(co));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        $monitor("time=%0t a=%b b=%b cin=%b sum=%b cout=%b", $time, a, b, ci, s, co);

        a = 0; b = 0; ci = 0; #10;
        a = 0; b = 0; ci = 1; #10;
        a = 0; b = 1; ci = 0; #10;
        a = 0; b = 1; ci = 1; #10;
        a = 1; b = 0; ci = 0; #10;
        a = 1; b = 0; ci = 1; #10;
        a = 1; b = 1; ci = 0; #10;
        a = 1; b = 1; ci = 1; #10;

        $finish;
    end
endmodule