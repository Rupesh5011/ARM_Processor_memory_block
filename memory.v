`timescale 1ns / 1ps

module memory(
    input clk,
    input rst,
    input read,
    input write,
    input [31:0] wr_data,
    input [9:0] write_addr, read_addr,
    output reg [31:0] rd_data,
    output reg wr_done,rd_done
    );
    parameter ADDR_WIDTH =10;
    parameter mem_size =1023;
    parameter DATA_WIDTH = 7 ;
    
    reg [DATA_WIDTH:0] temp_mem[0:mem_size];
    always @(posedge clk)
    begin
        if(rst)
        begin
            wr_done<=0;
            rd_done<=0;
        end
        else
        begin
            if(write)
                begin
                temp_mem[write_addr] <= wr_data[31:24];
                temp_mem[write_addr+1] <= wr_data[23:16];
                temp_mem[write_addr+2] <= wr_data[15:8];
                temp_mem[write_addr+3] <= wr_data[7:0];
                wr_done <=1;
                end
            else
                begin
                wr_done<=0;
                end
            if(read)
                begin
                rd_data <= {{temp_mem[read_addr]},{temp_mem[read_addr+1]},{temp_mem[read_addr+2]},{temp_mem[read_addr+3]}};
                rd_done <= 1;
                end
                else
                rd_done<=0;
        end
            end
endmodule
