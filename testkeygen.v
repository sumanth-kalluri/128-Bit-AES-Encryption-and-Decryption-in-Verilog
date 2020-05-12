`timescale 1ns / 1ps

module key_gen(temp_key,mx_key,rcon,ko,r_key);

input [0:127] temp_key,mx_key;
input [0:31] rcon;
output [0:127] ko,r_key;
wire [0:127] ko;

//shifting operation

wire [0:127] key,key2;
assign key[0:95]    = temp_key[0:95];
assign key[96:103]  = temp_key[104:111];
assign key[104:111] = temp_key[112:119];
assign key[112:119] = temp_key[120:127];
assign key[120:127] = temp_key[96:103];

//sub_bytes operation

sbox s1(key[96:99],key[100:103],key2[96:103]);
sbox s2(key[104:107],key[108:111],key2[104:111]);
sbox s3(key[112:115],key[116:119],key2[112:119]);
sbox s4(key[120:123],key[124:127],key2[120:127]);

//multiplication with rcon values
//xor with different columns
//ko is also numbered column wise

assign ko[0:31]  = key2[96:127]^key[0:31]^rcon[0:31]; 
assign ko[32:63]  = key2[96:127]^key[0:31]^key[32:63]^rcon[0:31]; 
assign ko[64:95]  = key2[96:127]^key[0:31]^key[32:63]^key[64:95]^rcon[0:31]; 
assign ko[96:127]  = key2[96:127]^key[0:31]^key[32:63]^key[64:95]^temp_key[96:127]^rcon[0:31]; 

//add round operation

assign r_key[0:127] = mx_key[0:127]^ko[0:127];


endmodule
