`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//only denominations of 5 and 10 are to be used(5,10 rupee coins)
//For first item 
//value of first item is 15
module Item_1(
input clk,rst,
input five_in,
input ten_in,
output reg change,
output reg dispense);

localparam S0=0,
 S5=1,
 S10=2,
 S15=3,
 S20=4;

reg [3:0] present_state,next_state;

always@(posedge clk or negedge rst)
begin 
if(rst)
begin
present_state<=S0;
next_state<=S0;
end
else 
present_state<=next_state;
end

always@(five_in or ten_in)
begin 
case(present_state)
S0: begin 
if(five_in) 
begin   
next_state<=S5;
{dispense,change}=2'b00;
end
else if(ten_in)
begin   
next_state<=S10;
{dispense,change}=2'b00;
end 
else 
begin 
next_state<=S0;
{dispense,change}=2'b00;
end 
end 

S5: begin 
if(five_in) 
begin   
next_state<=S10;
{dispense,change}=2'b00;
end
else if(ten_in)
begin   
next_state<=S15;
{dispense,change}=2'b10;
end 
else 
begin 
next_state<=S5;
{dispense,change}=2'b00;
end 
end 

S10: begin 
if(five_in) 
begin   
next_state<=S15;
{dispense,change}=2'b10;
end
else if(ten_in)
begin   
next_state<=S20;
{dispense,change}=2'b11;
end 
else 
begin 
next_state<=S10;
{dispense,change}=2'b00;
end 
end 

S15:
begin   
next_state<=S0;
{dispense,change}=2'b00;
end 

S20:
begin 
next_state<=S0;
{dispense,change}=2'b00;
end 

default:
begin 
next_state<=S0;
{dispense,change}=2'b00;
end 
endcase 
end 
endmodule


//For second item
//value of second item is 25
module Item_2(
input clk,rst,
input five_in,
input ten_in,
output reg change,
output reg dispense);

localparam S0=0,
 S5=1,
 S10=2,
 S15=3,
 S20=4,
 S25=5,
 S30=6;

reg [3:0] present_state,next_state;

always@(posedge clk or negedge rst)
begin 
if(rst)
begin 
present_state<=S0;
next_state<=S0;
end 
else 
present_state<=next_state;
end

always@(five_in or ten_in)
begin 
case(present_state)
S0: begin 
if(five_in) 
begin   
next_state<=S5;
dispense=0;
change=0;
end
else if(ten_in)
begin   
next_state<=S10;
dispense=0;
change=0;
end 
else 
begin 
next_state<=S0;
dispense=0;
change=0;
end 
end 

S5: begin 
if(five_in) 
begin   
next_state<=S10;
dispense=0;
change=0;
end
else if(ten_in)
begin   
next_state<=S15;
dispense=0;
change=0;
end 
else 
begin 
next_state<=S5;
dispense=0;
change=0;
end 
end 

S10: begin 
if(five_in) 
begin   
next_state<=S15;
{dispense,change}=2'b00;
end
else if(ten_in)
begin   
next_state<=S20;
{dispense,change}=2'b00;
end 
else 
begin 
next_state<=S10;
{dispense,change}=2'b00;
end 
end 

S15:
begin 
if(five_in) 
begin   
next_state<=S20;
{dispense,change}=2'b00;
end
else if(ten_in)
begin   
next_state<=S25;
{dispense,change}=2'b10;
end 
else 
begin 
next_state<=S15;
{dispense,change}=2'b00;
end 
end 

S20:
begin 
if(five_in) 
begin   
next_state<=S25;
{dispense,change}=2'b10;
end
else if(ten_in)
begin   
next_state<=S30;
{dispense,change}=2'b11;
end 
else 
begin 
next_state<=S20;
{dispense,change}=2'b00;
end 
end

S25:
begin   
next_state<=S0;
{dispense,change}=2'b00;
end 

S30:
begin 
next_state<=S0;
{dispense,change}=2'b00;
end 

default:
begin 
next_state<=S0;
{dispense,change}=2'b00;
end 
endcase 
end 
endmodule

//For 3rd item
//value of item is 35
module Item_3(
input clk,rst,
input five_in,
input ten_in,
output reg change,
output reg dispense);

localparam S0=0,
 S5=1,
 S10=2,
 S15=3,
 S20=4,
 S25=5,
 S30=6,
 S35=7,
 S40=8;

reg [3:0] present_state,next_state;

always@(posedge clk or negedge rst)
begin 
if(rst)
begin   
present_state<=S0;
next_state<=S0;
end 
else 
present_state<=next_state;
end

always@(five_in or ten_in)
begin 
case(present_state)
S0: begin 
if(five_in) 
begin   
next_state<=S5;
{dispense,change}=0;
end
else if(ten_in)
begin   
next_state<=S10;
{dispense,change}=0;
end 
else 
begin 
next_state<=S0;
{dispense,change}=0;
end 
end 

S5: begin 
if(five_in) 
begin   
next_state<=S10;
{dispense,change}=0;
end
else if(ten_in)
begin   
next_state<=S15;
{dispense,change}=0;
end 
else 
begin 
next_state<=S5;
{dispense,change}=0;
end 
end 

S10: begin 
if(five_in) 
begin   
next_state<=S15;
{dispense,change}=2'b00;
end
else if(ten_in)
begin   
next_state<=S20;
{dispense,change}=2'b00;
end 
else 
begin 
next_state<=S10;
{dispense,change}=2'b00;
end 
end 

S15:
begin 
if(five_in) 
begin   
next_state<=S20;
{dispense,change}=2'b00;
end
else if(ten_in)
begin   
next_state<=S25;
{dispense,change}=2'b00;
end 
else 
begin 
next_state<=S15;
{dispense,change}=2'b00;
end 
end 

S20:
begin 
if(five_in) 
begin   
next_state<=S25;
{dispense,change}=2'b00;
end
else if(ten_in)
begin   
next_state<=S30;
{dispense,change}=2'b00;
end 
else 
begin 
next_state<=S20;
{dispense,change}=2'b00;
end 
end 

S25:
begin 
if(five_in) 
begin   
next_state<=S30;
{dispense,change}=2'b00;
end
else if(ten_in)
begin   
next_state<=S35;
{dispense,change}=2'b10;
end 
else 
begin 
next_state<=S25;
{dispense,change}=2'b00;
end 
end 

S30:
begin 
if(five_in) 
begin   
next_state<=S35;
{dispense,change}=2'b10;
end
else if(ten_in)
begin   
next_state<=S40;
{dispense,change}=2'b11;
end 
else 
begin 
next_state<=S30;
{dispense,change}=2'b00;
end 
end 

S35:
begin 
next_state<=S0;
{dispense,change}=2'b00;
end 

S40:
begin 
next_state<=S0;
{dispense,change}=2'b00;
end 

default:
begin 
next_state<=S0;
{dispense,change}=2'b00;
end 
endcase 
end 
endmodule

module vending_machine(
input [1:0] item,
input five_in,
input ten_in,
input clk,
input rst,
output reg dispense,change);

wire C1,C2,C3,C4,D1,D2,D3,D4;
Item_1 I1(.five_in(five_in),.ten_in(ten_in),.clk(clk),.rst(rst),.dispense(D1),.change(C1));
Item_2 I2(.five_in(five_in),.ten_in(ten_in),.clk(clk),.rst(rst),.dispense(D2),.change(C2));
Item_3 I3(.five_in(five_in),.ten_in(ten_in),.clk(clk),.rst(rst),.dispense(D3),.change(C3));

always@(*)
begin 
if(item==1)
begin 
change=C1;
dispense=D1;
end 

else if(item==2)
begin 
change=C2;
dispense=D2;
end 

else if(item==3)
begin 
change=C3;
dispense=D3;
end 
end 
endmodule