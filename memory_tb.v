`timescale 1ns / 1ps

module memory_tb; 
reg clk, rst, read, write;
    reg [31:0] wr_data;
    reg [9:0] write_addr, read_addr;
    wire [31:0] rd_data;
    wire wr_done, rd_done;
    
    memory uut(clk, rst, read, write, wr_data, write_addr, read_addr, rd_data, wr_done, rd_done);
    initial begin
    
        clk=0;
        rst=1'b1;
        write=1'b0;
        read=1'b0;
        #10;
        
        rst=1'b0;
        #10;
        
        write=1'b1;
        write_addr=10'd0;
        wr_data=32'h7abc9c86;
        #10;
        
        write=1'b0;
        #10;
        
        read=1'b1;
        read_addr=10'd0;
        #10;
        
        read=1'b0;
        #10;
        
        $finish();
    end
    always #5 clk=~clk;
endmodule

