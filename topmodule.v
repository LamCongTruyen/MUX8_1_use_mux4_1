3: Chương trình verilog
-MUX8_1:
module mux8_1(
    input [7:0] I,
    input [2:0] S,
    output Y
    );

wire mux4_out1, mux4_out2;

  // Instantiate two 4-to-1 MUXes
  mux4_1 mux1 (
    .i(I[3:0]),
    .sel(S[1:0]),
    .y(mux4_out1)
  );

  mux4_1 mux2 (
    .i(I[7:4]),
    .sel(S[1:0]),
    .y(mux4_out2)
  );

  // Instantiate a 2-to-1 MUX
  mux2_1 mux3 (
    .i0(mux4_out1),
    .i1(mux4_out2),
    .sel(S[2]),
    .y(Y)
  );

endmodule
-MUX4_1:
module mux4_1(
    input [3:0] i,
    input [1:0] sel,
    output y
    );

  wire s0_bar, s1_bar;
  wire and0, and1, and2, and3;

  // NOT gates for select lines
  not g1 (s0_bar, sel[0]);
  not g2 (s1_bar, sel[1]);

  // AND gates
  and g3 (and0, i[0], s0_bar, s1_bar);
  and g4 (and1, i[1], sel[0], s1_bar);
  and g5 (and2, i[2], s0_bar, sel[1]);
  and g6 (and3, i[3], sel[0], sel[1]);

  // OR gate
  or g7 (y, and0, and1, and2, and3);

endmodule
-MUX2-1:
module mux2_1(
    input i0,
    input i1,
    input sel,
    output y
    );
  wire sel_bar;
  wire and0, and1;

  // NOT gate for select line
  not g1 (sel_bar, sel);

  // AND gates
  and g2 (and0, i0, sel_bar);
  and g3 (and1, i1, sel);

  // OR gate
  or g4 (y, and0, and1);

endmodule
