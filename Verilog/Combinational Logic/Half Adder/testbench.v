module testbench;
    reg a, b;
    wire s, c;

    HA uut(.a(a), .b(b), .sum(s), .carry(c));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        $monitor("time=%0t a=%b b=%b sum=%b carry=%b", $time, a, b, s, c);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end
endmodule