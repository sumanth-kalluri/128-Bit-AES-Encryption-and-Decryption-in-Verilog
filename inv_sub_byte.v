`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:01:39 07/05/2017 
// Design Name: 
// Module Name:    inv_sub_byte 
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
module inv_sub_byte(in_key,out_key);
input [0:127] in_key;
output [0:127] out_key;

inv_sbox sb5(in_key[0:3],in_key[4:7],out_key[0:7]);
inv_sbox sb6(in_key[8:11],in_key[12:15],out_key[8:15]);
inv_sbox sb7(in_key[16:19],in_key[20:23],out_key[16:23]);
inv_sbox sb8(in_key[24:27],in_key[28:31],out_key[24:31]);
inv_sbox sb9(in_key[32:35],in_key[36:39],out_key[32:39]);
inv_sbox sb10(in_key[40:43],in_key[44:47],out_key[40:47]);
inv_sbox sb11(in_key[48:51],in_key[52:55],out_key[48:55]);
inv_sbox sb12(in_key[56:59],in_key[60:63],out_key[56:63]);
inv_sbox sb13(in_key[64:67],in_key[68:71],out_key[64:71]);
inv_sbox sb14(in_key[72:75],in_key[76:79],out_key[72:79]);
inv_sbox sb15(in_key[80:83],in_key[84:87],out_key[80:87]);
inv_sbox sb16(in_key[88:91],in_key[92:95],out_key[88:95]);
inv_sbox sb17(in_key[96:99],in_key[100:103],out_key[96:103]);
inv_sbox sb18(in_key[104:107],in_key[108:111],out_key[104:111]);
inv_sbox sb19(in_key[112:115],in_key[116:119],out_key[112:119]);
inv_sbox sb20(in_key[120:123],in_key[124:127],out_key[120:127]);

endmodule
