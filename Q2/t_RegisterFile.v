/**
*	Test bench for Register file
*	By: Omkar Prabhu 16CO233
*	28th October 2017
*/


`timescale 1ns/100ps

module t_RegisterFile;

    // outputs
    wire [0:31] readData1;
    wire [0:31] readData2;

    // inputs
    reg write;
    reg [0:4] register_no, readReg1, readReg2;
    reg [0:31] reg_data;
    
    // Register file thread instantated
    RegisterFile inst ( write, reg_data, register_no, readReg1, readReg2, readData1, readData2);

    // input combinations
    initial begin

        $dumpfile("RegisterFile.vcd");
        $dumpvars(0, t_RegisterFile);

        write = 1'b1;
        readReg1 = 5'b00000;
        readReg2 = 5'b00000;
        register_no = 5'b00001;
        reg_data = 32'b00111001110011100111001110011110;
        #10;
        write = 1'b0;
        #1;
        readReg1 = 5'b00000;
        #1;
        readReg2 = 5'b00001;
        register_no = 5'b00000;
        reg_data = 32'b00111001110011100111111110011110;
        #10; 
        write = 1'b1;
        #10;
        write = 1'b0;
        #10;
        write = 1'b1;
        register_no = 5'b00001;
        reg_data = 32'b11000000000000000000000000000000;
        #10;
       
    end

    // display outputs
    initial begin
        #1;
        
    end

endmodule
