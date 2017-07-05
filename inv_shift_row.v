`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:12:42 07/05/2017 
// Design Name: 
// Module Name:    inv_shift_row 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module inv_shift_row(s_state,shifted_state);
input [0:127] s_state;
inout [0:127] shifted_state;
assign shifted_state[0:7]   = s_state[0:7];//0 
assign shifted_state[8:15] = s_state[104:111];//1
assign shifted_state[16:23] = s_state[80:87];//2
assign shifted_state[24:31] = s_state[56:63];//3

assign shifted_state[32:39] = s_state[32:39];//4
assign shifted_state[40:47] = s_state[0:7];//5
assign shifted_state[48:55] = s_state[48:55];//6
assign shifted_state[56:63] = s_state[88:95];//7

assign shifted_state[64:71] = s_state[64:71];//8
assign shifted_state[72:79] = s_state[40:47];//9
assign shifted_state[80:87] = s_state[16:23];//10
assign shifted_state[88:95] = s_state[120:127];//11

assign shifted_state[96:103] = s_state[96:103];//12
assign shifted_state[104:111] = s_state[72:79];//13s
assign shifted_state[112:119] = s_state[48:55];//14
assign shifted_state[120:127] = s_state[56:63];//15
endmodule
