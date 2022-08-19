`timescale 1ns/1ns

module Washing_machine_tb();
  
  reg           reset_tb;
  reg           coin_tb;
  reg           double_wash_tb;
  reg           pause_tb;
  reg  [1:0]    clk_freq_dec_top_tb;
  
  wire          clk_tb;
  wire          wash_done_tb;
  wire [2:0]    current_state_tb;
  
parameter FILLING_COUNT_TB=32'd12;
parameter WASHING_COUNT_TB=32'd30;
parameter RINSING_COUNT_TB=32'd12;
parameter SPINNING_COUNT_TB=32'd6;

parameter FIRST_FREQ_TB =1;
parameter SECOND_FREQ_TB=2;
parameter THIRD_FREQ_TB =4;
parameter FOURTH_FREQ_TB=8;
  
  
Top_Washing_machine #(.FILLING_COUNT_TOP (FILLING_COUNT_TB),
                      .WASHING_COUNT_TOP (WASHING_COUNT_TB),
                      .RINSING_COUNT_TOP (RINSING_COUNT_TB),
                      .SPINNING_COUNT_TOP(SPINNING_COUNT_TB),
                      .FIRST_FREQ_TOP (FIRST_FREQ_TB) ,
                      .SECOND_FREQ_TOP(SECOND_FREQ_TB),
                      .THIRD_FREQ_TOP (THIRD_FREQ_TB),
                      .FOURTH_FREQ_TOP(FOURTH_FREQ_TB))
                    t0 (.reset(reset_tb),
                        .coin(coin_tb),
                        .double_wash(double_wash_tb),
                        .pause(pause_tb),
                        .clk_freq_dec_top(clk_freq_dec_top_tb),
                        .wash_done(wash_done_tb),
                        .current_state(current_state_tb),
                        .clk_top(clk_tb));
                        
                        
                        
initial 
    begin
      reset_tb=0;
      coin_tb=0;
      double_wash_tb=0;
      pause_tb=0;
      clk_freq_dec_top_tb=2'b00;
     
      reset_tb=0;
      #250;
      reset_tb=1;
      #245;
      reset_tb=0;
       $display(" >>>>    ALL THESE CASES DONE IN  FIRST FREQUENCY AND THE REST WILL BE OKAY     <<<<\n\n \n");          
       ///////////////////////////case test //////////////////
     $display("first case to check reset \n");          
      if(wash_done_tb==0)
        begin
             $display ("case correct\n reset=%b ,   coin=%b , double wash=%b , pause=%b  , clk freq dec=%2b , wash done =%b \n ",reset_tb,coin_tb,double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
         end
      else
       begin
              $display ("case false \n reset=%b ,   coin=%b , double wash=%b , pause=%b  , clk freq dec=%2b , wash done =%b  \n",reset_tb,coin_tb,double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
                 end
    
    ////////////////////second case to check coin =1  clk frequency 1MHZ///////////////////     

        $display("second case to check reset \n");          
    #5 ;
    reset_tb=1;
    
     coin_tb=1;
     clk_freq_dec_top_tb=2'b00;
     double_wash_tb=0;
     pause_tb=0;      

    #50000;
     $display("second case to check first frequency 1MHZ false\n");          
      if(wash_done_tb==0)
        begin
          $display ("case correct\n reset=%b ,   coin=%b , double wash=%b  , pause=%b  , clk freq dec=%2b , wash done =%b \n ",reset_tb,coin_tb, double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
            end
      else
       begin
              $display ("case false \n reset=%b ,   coin=%b ,double wash=%b  , pause=%b  , clk freq dec=%2b , wash done =%b  \n",reset_tb,coin_tb, double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
                 end
     
     #10000;
  
    $display("Third case to check first frequency 1MHZ true\n");          
      if(wash_done_tb==1)
        begin
          $display ("case correct\n reset=%b ,  coin=%b ,   double wash=%b , pause=%b , clk freq dec=%2b , wash done =%b \n ",reset_tb,coin_tb,double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
            end
      else
       begin
          $display ("case false\n reset=%b ,  coin=%b ,   double wash=%b , pause=%b , clk freq dec=%b , wash done =%b \n ",reset_tb,coin_tb,double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
                 end
         ////////////////////////////////////////////////////////////////////////////////
      reset_tb=0;
      #250;
      reset_tb=1;
      #250;


     coin_tb=1;
     clk_freq_dec_top_tb=2'b00;
     double_wash_tb=1;
     pause_tb=0;            

     
    #60000;
     $display("Fourth case to check first frequency 1MHZ Double wash <false>\n");          
      if(wash_done_tb==0)
        begin
          $display ("case correct\n reset=%b ,   coin=%b , double wash=%b  , pause=%b  , clk freq dec=%2b , wash done =%b \n ",reset_tb,coin_tb, double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
            end
      else
       begin
              $display ("case false \n reset=%b ,   coin=%b ,double wash=%b  , pause=%b  , clk freq dec=%2b , wash done =%b  \n",reset_tb,coin_tb, double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
                 end
     
     #42000;
  
    $display("Fifth case to check first frequency 1MHZ Double wash <<true>\n");          
      if(wash_done_tb==1)
        begin
          $display ("case correct\n reset=%b ,  coin=%b ,   double wash=%b , pause=%b , clk freq dec=%2b , wash done =%b \n ",reset_tb,coin_tb,double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
            end
      else
       begin
          $display ("case false\n reset=%b ,  coin=%b ,   double wash=%b , pause=%b , clk freq dec=%b , wash done =%b \n ",reset_tb,coin_tb,double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
                 end      
                 ///////////////////////////////////////////////////

 reset_tb=0;
      #250;
      reset_tb=1;
      #250;


     coin_tb=0;

     #500;
     ////////////////////////////////////////////////////////////////////////
     
     coin_tb=1;
     clk_freq_dec_top_tb=2'b00;
     double_wash_tb=0;
     pause_tb=1;            

     
     #60000;
     $display("Sexth case to check first frequency 1MHZ pause <false>\n");          
      if(wash_done_tb==0)
        begin
          $display ("case correct\n reset=%b ,   coin=%b , double wash=%b  , pause=%b  , clk freq dec=%2b , wash done =%b \n ",reset_tb,coin_tb, double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
            end
      else
       begin
              $display ("case false \n reset=%b ,   coin=%b ,double wash=%b  , pause=%b  , clk freq dec=%2b , wash done =%b  \n",reset_tb,coin_tb, double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
                 end
     pause_tb=0; 
     #6000;
  
    $display("Seventh case to check first frequency 1MHZ pause <<true>\n");          
      if(wash_done_tb==1)
        begin
          $display ("case correct\n reset=%b ,  coin=%b ,   double wash=%b , pause=%b , clk freq dec=%2b , wash done =%b \n ",reset_tb,coin_tb,double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
            end
      else
       begin
          $display ("case false\n reset=%b ,  coin=%b ,   double wash=%b , pause=%b , clk freq dec=%b , wash done =%b \n ",reset_tb,coin_tb,double_wash_tb, pause_tb,clk_freq_dec_top_tb,  wash_done_tb    );   
                 end      
     /////////////////////////////////////////////////////////////////////////////////////////////////////////
   
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#50 ;
$stop;
                    //////////////////////////////////////////////////////// 
 end
 endmodule                          