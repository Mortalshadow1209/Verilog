module testbench;
    reg a, sel;
    wire x, y;

    demux_1to2 uut(.a(a), .sel(sel), .x(x), .y(y));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        $monitor("time=%0t a=%b sel=%b x=%b y=%b", $time, a, sel, x, y);

        a = 0; sel = 0; #10;
        a = 0; sel = 1; #10;
        a = 1; sel = 0; #10;
        a = 1; sel = 1; #10;

        $finish;
    end
endmodule