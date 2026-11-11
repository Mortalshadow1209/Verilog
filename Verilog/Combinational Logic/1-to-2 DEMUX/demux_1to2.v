module demux_1to2(
    input a,
    input sel,
    output x,
    output y
);
    assign x = sel ? 0 : a;
    assign y = sel ? a : 0;
endmodule