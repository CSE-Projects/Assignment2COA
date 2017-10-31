/**
*	Test bench for Register file
*	By: Omkar Prabhu 16CO233
*	28th October 2017
*/


`timescale 1ns/100ps

module t_RegisterFile;

    // output data
    wire [0:31] readData1;
    wire [0:31] readData2;

    // input signals
    reg write;
    reg [0:4] register_no, readReg1, readReg2;
    reg [0:31] reg_data;

    integer i;
    
    // Register file thread instantated
    RegisterFile inst ( write, reg_data, register_no, readReg1, readReg2, readData1, readData2);

    // input combinations
    initial begin

        $dumpfile("RegisterFile.vcd");
        $dumpvars(0, t_RegisterFile);
        
        // initial setting
        write = 1'b1;
        readReg1 = 5'b00000;
        readReg2 = 5'b00000;
        register_no = 5'b00000;
        reg_data = 32'b00000000000000000000000000000000;

        // loaded data in all registers of the register file
        for (i = 0; i < 31; i++) begin
            #1; write = 1'b0;
            #1;
            register_no = register_no + 1'b1;
            #1;
            reg_data = reg_data + 1'b1;
            #1; write = 1'b1;
        end

        #10;
        write = 1'b0;

        // read contents of two registers from register file
        #1;
        readReg1 = 5'b00000;
        #1;
        readReg2 = 5'b00001;

        // random loading of data into two registers of register file
        register_no = 5'b00000;
        reg_data = 32'b00111001110011100111111110011110;
        #10; 
        write = 1'b1;
        #10;
        write = 1'b0;

        #10;
        register_no = 5'b00001;
        reg_data = 32'b11000000000100000000010000100000;
        #10; 
        write = 1'b1;
        #10;
        write = 1'b0;

        // read contents of two registers from register file
        #1;
        readReg1 = 5'b00000;
        #1;
        readReg2 = 5'b00001;

        #10;
        readReg1 = 5'b01000;
        #1;
        readReg2 = 5'b10001;

        #10;
        readReg1 = 5'b01010;
        #1;
        readReg2 = 5'b11111;

        #30;
       
    end

    // display outputs
    initial begin
        // outputs are displayed in vcd file itself.
        $display("\n\nFor outputs Please view vcd file\n\n");
    end

endmodule
