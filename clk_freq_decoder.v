`timescale 1ns/1ns

module clk_freq_decoder#(parameter  FIRST_FREQ =1,
                         parameter  SECOND_FREQ=2,
                         parameter  THIRD_FREQ =4,
                         parameter  FOURTH_FREQ=8)
 (
input     wire    [1:0]    clk_freq_dec,
output    reg     [3:0]    clock_frequency_dec,
output    reg              clk_gen);



real        clk_per;
real        clk_half;

always@(*)
  begin
    case(clk_freq_dec)
      2'b00:begin
                clock_frequency_dec=FIRST_FREQ ;
                clk_per =(1.0*(1000))/(clock_frequency_dec);
                clk_half=clk_per/2;
           end   
      2'b01:begin
                clock_frequency_dec=SECOND_FREQ ;
                clk_per =(1.0*(1000))/(clock_frequency_dec);
                clk_half=clk_per/2;
           end
      2'b10:begin
                clock_frequency_dec=THIRD_FREQ ;
                clk_per =(1.0*(1000))/(clock_frequency_dec);
                clk_half=clk_per/2;
           end
      2'b11:begin
                clock_frequency_dec=FOURTH_FREQ ;
                clk_per =(1.0*(1000))/(clock_frequency_dec);
                clk_half=clk_per/2;
           end
    endcase
  end
  
  initial
   begin
     clk_gen=0;
     end
  always
  begin
      #clk_half;  clk_gen=~clk_gen;
end  
 endmodule
    
        
  
      
