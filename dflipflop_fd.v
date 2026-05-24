`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 16:53:09
// Design Name: 
// Module Name: dflipflop_fd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dflipflop_fd(input clk,reset,d,output reg q);
reg[26:0]Tclk;
always@(posedge clk)
begin
if(reset)
Tclk<=27'b0;
else
Tclk<=Tclk+1;
end
always@(posedge Tclk[26])
begin 
if (reset)
q<=1'b0;
else
q<=d;

end



endmodule
