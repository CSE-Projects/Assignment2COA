//	DIBYADARSHAN HOTA AND OMKAR PRABHU


//	1-bit ALU. Build a 1-bit ALU that can perform the following logical and arithmetic operations: AND, OR, NAND,
//	NOR, ADD, SUBTRACT. Include two additional flags: (a) a flag to indicate if the result of the ALU operation is
//	zero (Z), (b) a flag to indicate if the first input is greater than the second input.


//	TESTBENCH FOR 1 BIT ALU
`timescale 1ns / 100ps 
module stimulus; 
/*
	OPCODES for different functions (3 bit)

		ADD: 		000

		SUBTRACT: 	001

		AND operation: 	010

		OR operation: 	011

		NAND operation:	100

		NOR operation:	101

*/
reg[3:1] opcode;
//	input1 for 1st input
reg input1;
//	input2 for 2nd input 
reg input2;
//	carryin for adder and subtractor
reg carryin;
//	flag1 to check if result is 0
wire flag1;
//	flag to check if 1st input is greater
wire flag2;
//	out is the output
wire out;
//	carryout for adder and subtractor
wire carryout;

//	Instantiation
	alu inst(opcode,input1,input2,carryin,flag1,flag2,out,carryout);
	
	initial begin

		//	Creating the gtkwave	
		$dumpfile("ALU.vcd");
    		$dumpvars(0,stimulus);

		$display("\n1 BIT ALU\nOPCODES ADD:000, SUBTRACT:001, AND:010, OR:011 ,NAND:100, NOR:101\n");

		//	Giving all the possible inputs to the main module
		opcode=4'b000;input1=0;input2=0;carryin=0;
		#5
		opcode=4'b000;input1=0;input2=0;carryin=1;
		#5
		opcode=4'b000;input1=0;input2=1;carryin=0;
		#5
		opcode=4'b000;input1=0;input2=1;carryin=1;
		#5
		opcode=4'b000;input1=1;input2=0;carryin=0;
		#5
		opcode=4'b000;input1=1;input2=0;carryin=1;
		#5
		opcode=4'b000;input1=1;input2=1;carryin=0;
		#5
		opcode=4'b000;input1=1;input2=1;carryin=1;
		#5
		$display("\nOPCODES ADD:000, SUBTRACT:001, AND:010, OR:011 ,NAND:100, NOR:101\n");
		
		#5
		opcode=4'b001;input1=0;input2=0;carryin=0;
		#5
		opcode=4'b001;input1=0;input2=0;carryin=1;
		#5
		opcode=4'b001;input1=0;input2=1;carryin=0;
		#5
		opcode=4'b001;input1=0;input2=1;carryin=1;
		#5
		opcode=4'b001;input1=1;input2=0;carryin=0;
		#5
		opcode=4'b001;input1=1;input2=0;carryin=1;
		#5
		opcode=4'b001;input1=1;input2=1;carryin=0;
		#5
		opcode=4'b001;input1=1;input2=1;carryin=1;
		#5
		$display("\nOPCODES ADD:000, SUBTRACT:001, AND:010, OR:011 ,NAND:100, NOR:101\n");
		
		#5
		carryin=1'bx;
		opcode=4'b010;input1=0;input2=0;
		#5
		opcode=4'b010;input1=0;input2=1;
		#5
		opcode=4'b010;input1=1;input2=0;
		#5
		opcode=4'b010;input1=1;input2=1;
		#5
		$display("\nOPCODES ADD:000, SUBTRACT:001, AND:010, OR:011 ,NAND:100, NOR:101\n");
		
		#5
		opcode=4'b011;input1=0;input2=0;
		#5
		opcode=4'b011;input1=0;input2=1;
		#5
		opcode=4'b011;input1=1;input2=0;
		#5
		opcode=4'b011;input1=1;input2=1;
		#5
		$display("\nOPCODES ADD:000, SUBTRACT:001, AND:010, OR:011 ,NAND:100, NOR:101\n");
		
		#5
		opcode=4'b100;input1=0;input2=0;
		#5
		opcode=4'b100;input1=0;input2=1;
		#5
		opcode=4'b100;input1=1;input2=0;
		#5
		opcode=4'b100;input1=1;input2=1;
		#5
		$display("\nOPCODES ADD:000, SUBTRACT:001, AND:010, OR:011 ,NAND:100, NOR:101\n");
		
		#5
		opcode=4'b101;input1=0;input2=0;
		#5
		opcode=4'b101;input1=0;input2=1;
		#5
		opcode=4'b101;input1=1;input2=0;
		#5
		opcode=4'b101;input1=1;input2=1;
		
		#5
		$finish;
	end
	
initial begin
//	Printing all the vaules via $monitor statement
$monitor("OPCODE:%3b input1:%b, input2:%b, carry in:%b, carry out:%b, output:%b, isResult0:%b, isFirstInputGreater:%b",opcode,input1,input2,carryin,carryout,out,flag1,flag2); 
end

endmodule



















