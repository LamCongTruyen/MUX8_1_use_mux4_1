4: Chương trình testbench
module TB_BAI3;

	// Inputs
	reg [7:0] I;
	reg [2:0] S;

	// Outputs
	wire Y;

	// Instantiate the Unit Under Test (UUT)
	mux8_1 uut (
		.I(I), 
		.S(S), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		I = 0;
		S = 0;

		// Wait 100 ns for global reset to finish
		#100;
      I = 8'b0;
    S = 3'b0;

    // Wait 100 ns for global reset to finish
    #100;

    // Test stimulus
    I = 8'b11110110; // Đặt giá trị cho I

    S = 3'b000; // Chọn đầu vào I[0]
    #100;

    S = 3'b001; // Chọn đầu vào I[1]
    #100;
	S = 3'b010; // Chọn đầu vào I[2]
    #100;

    S = 3'b011; // Chọn đầu vào I[3]
    #100;

    S = 3'b100; // Chọn đầu vào I[4]
    #100;

    S = 3'b101; // Chọn đầu vào I[5]
    #100;

    S = 3'b110; // Chọn đầu vào I[6]
    #100;

    S = 3'b111; // Chọn đầu vào I[7]
    #100;

    $finish; // Kết thúc mô phỏn
		// Add stimulus here

	end
      
endmodule

