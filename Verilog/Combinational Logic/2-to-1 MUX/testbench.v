module testbench;
    reg a, b, sel;
    wire y;

    mux_2to1 uut(.a(a), .b(b), .sel(sel), .y(y));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        $monitor("time=%0t sel=%b a=%b b=%b y=%b", $time, sel, a, b, y);

        sel = 0; a = 0; b = 0; #10;
        sel = 0; a = 1; b = 0; #10;
        sel = 1; a = 0; b = 0; #10;
        sel = 1; a = 0; b = 1; #10;

        $finish;
    end
endmodule