`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:34 06/09/2017 
// Design Name: 
// Module Name:    key_gen 
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
module key_gen(temp_key,mx_key,rcon,r_key);

input [0:127] temp_key,mx_key;
input [0:31] rcon;
output [0:127] r_key;
wire [0:127] ko;

//shifting operation

reg [0:127] key;
always@(temp_key)
begin
key[96:103]  = temp_key[104:111];
key[104:111] = temp_key[112:119];
key[112:119] = temp_key[120:127];
key[120:127] = temp_key[96:103];
end
//sub_bytes operation

sbox s1(key[96:99],key[100:103],key[96:103]);
sbox s2(key[104:107],key[108:111],key[104:111]);
sbox s3(key[112:115],key[116:119],key[112:119]);
sbox s4(key[120:123],key[124:127],key[120:127]);

//multiplication with rcon values

assign key[96:103]  = key[96:103]^rcon[0:7];
assign key[104:111] = key[104:111]^rcon[8:15];
assign key[112:119] = key[112:119]^rcon[16:23];
assign key[120:127] = key[120:127]^rcon[24:31]; 

//xor with different columns
//ko is also numbered column wise

assign ko[0:7]  = key[96:103]^key[0:7];
assign ko[8:15] = key[104:111]^key[8:15];
assign ko[16:23] = key[112:119]^key[16:23];
assign ko[24:31] = key[120:127]^key[24:31]; 
 
assign ko[32:39]  = key[96:103]^key[0:7]^key[32:39];
assign ko[40:47] = key[104:111]^key[8:15]^key[40:47];
assign ko[48:55] = key[112:119]^key[16:23]^key[48:55];
assign ko[56:63] = key[120:127]^key[24:31]^key[56:63]; 

assign ko[64:71]  = key[96:103]^key[0:7]^key[32:39]^key[64:71];
assign ko[72:79] = key[104:111]^key[8:15]^key[40:47]^key[72:79];
assign ko[80:87] = key[112:119]^key[16:23]^key[48:55]^key[80:87];
assign ko[88:95] = key[120:127]^key[24:31]^key[56:63]^key[88:95]; 

assign ko[96:103]  = key[96:103]^key[0:7]^key[32:39]^key[64:71]^key[96:103];
assign ko[104:111] = key[104:111]^key[8:15]^key[40:47]^key[72:79]^key[104:111];
assign ko[112:119] = key[112:119]^key[16:23]^key[48:55]^key[80:87]^key[112:119];
assign ko[120:127] = key[120:127]^key[24:31]^key[56:63]^key[88:95]^key[120:127]; 

//add round operation

assign r_key[0:7] = mx_key[0:7]^ko[0:7];
assign r_key[8:15] = mx_key[8:15]^ko[8:15];
assign r_key[16:23] = mx_key[16:23]^ko[16:23];
assign r_key[24:31] = mx_key[24:31]^ko[24:31];
assign r_key[32:39] = mx_key[32:39]^ko[32:39];
assign r_key[40:47] = mx_key[40:47]^ko[40:47];
assign r_key[48:55] = mx_key[48:55]^ko[48:55];
assign r_key[56:63] = mx_key[56:63]^ko[56:63];
assign r_key[64:71] = mx_key[64:71]^ko[64:71];
assign r_key[72:79] = mx_key[72:79]^ko[72:79];
assign r_key[80:87] = mx_key[80:87]^ko[80:87];
assign r_key[88:95] = mx_key[88:95]^ko[88:95];
assign r_key[96:103] = mx_key[96:103]^ko[96:103];
assign r_key[104:111] = mx_key[104:111]^ko[104:111];
assign r_key[112:119] = mx_key[112:119]^ko[112:119];
assign r_key[120:127] = mx_key[120:127]^ko[120:127];

endmodule
