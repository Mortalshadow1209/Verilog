module testbench;
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    adder_4 uut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        $monitor("time=%0t a=%b b=%b cin=%b sum=%b cout=%b", $time, a, b, cin, sum, cout);

        a = 4'b0101; b = 4'b1010; cin = 0; #10;
        a = 4'b0101; b = 4'b1111; cin = 0; #10;
        a = 4'b0001; b = 4'b1010; cin = 0; #10;
        a = 4'b1111; b = 4'b1111; cin = 0; #10;

        $finish;
    end
endmodule