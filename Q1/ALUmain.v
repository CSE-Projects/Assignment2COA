//	DIBYADARSHAN HOTA AND OMKAR PRABHU


//	1-bit ALU. Build a 1-bit ALU that can perform the following logical and arithmetic operations: AND, OR, NAND,
//	NOR, ADD, SUBTRACT. Include two additional flags: (a) a flag to indicate if the result of the ALU operation is
//	zero (Z), (b) a flag to indicate if the first input is greater than the second input.


//	Main module for the ALU
module 	alu (opcode,input1,input2,carryin,flag1,flag2,out,carryout);
//	opcode represents the opcode 
input[2:0] opcode;
//	input1 represents the 1st input
input input1;
//	input2 represents the 2nd input
input input2;
//	carryin represents the carry in given
input carryin;
//	flag1 checks if the output bit is 0
output reg flag1;
//	flag2 checks if 1st input is greater
output reg flag2;
//	out represents the output bit
output reg out;
//	carryout represents the carry out
output reg carryout;
	
	//	BEHAVIORAL MODELLING OF ALU
	always@(input1,input2,carryin,opcode) begin
		
		//	assigning value to the flag which checks if input 1 is greater
    		flag2 = input1 & (~input2);		
	
		//	if ladder to check which operation is to be done
		//	After that values are assigned to carryout and out	
		
/*
	OPCODES for different functions (3 bit)

		ADD: 		000

		SUBTRACT: 	001

		AND operation: 	010

		OR operation: 	011

		NAND operation:	100

		NOR operation:	101

*/



		if(opcode==3'b000) begin
			{carryout,out}=input1+input2+carryin;		
		end

		if(opcode==3'b001) begin
			{carryout,out}=input1-input2-carryin;							
		end

		if(opcode==3'b010) begin
			out=input1&input2;			
		end

		if(opcode==3'b011) begin
			out=input1|input2;
		end

		if(opcode==3'b100) begin
			out=~(input1&input2);
		end

		if(opcode==3'b101) begin
			out=~(input1|input2);
		end	

		//	assigning value to the flag which checks if the output is 0
		flag1=~out;
	end
		
endmodule
