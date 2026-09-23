module HA(
    input a,
    input b,
    output sum,
    output carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module FA(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    wire s1, c1, c2;

    HA ha1(.a(a), .b(b), .sum(s1), .carry(c1));
    HA ha2(.a(s1), .b(cin), .sum(sum), .carry(c2));

    assign cout = c1 | c2;
endmodule