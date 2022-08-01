module Top_Washing_machine
  ( input     wire             reset,
    input     wire             coin,
    input     wire             double_wash,
    input     wire             pause,
    input     wire    [1:0]    clk_freq_dec_top,
    
    output    reg          wash_done
         );
         
  
 wire    [3:0]    clock_frequency_dec_top;
 wire             clk; 
 
 
 wire  [28:0]   filling_count_top;
 wire  [28:0]   washing_count_top;
 wire  [28:0]   rinsing_count_top;
 wire  [28:0]   spinning_count_top;
 
 reg   [28:0]   filling_timer_top;
 reg   [28:0]   washing_timer_top;
 reg   [28:0]   rinsing_timer_top;
 reg   [28:0]   spinning_timer_top;

 
 

 reg      [2:0]     current_state;
 reg      [2:0]     next_state;
 
 
parameter IDLE    = 3'b000;
parameter FILLING = 3'b001;
parameter WASHING = 3'b010;
parameter RINSING = 3'b011;
parameter SPINNING= 3'b100;



 clk_freq_decoder c0 (.clk_freq_dec(clk_freq_dec_top),
                      .clock_frequency_dec(clock_frequency_dec_top),
                      .clk_gen(clk));
                      
  timer_machinec t0 (.clock_frequency_tm(clock_frequency_dec_top),
                     .state_tm(current_state),
                     .filling_count_tm(filling_count_top),
                     .washing_count_tm(washing_count_top),
                     .rinsing_count_tm(rinsing_count_top),
                     .spinning_count_tm(spinning_count_top));
                                                   


always @(posedge clk or negedge reset)
  begin
     if(!reset)
        begin
          current_state<=IDLE;
          next_state<=IDLE;
            end
    else
      begin
           current_state<=next_state;
      end
    end

always@(*)
   begin
     case(current_state)
       IDLE: begin
                 if(coin)
                   begin
                  filling_timer_top=0; 
                  washing_timer_top=0; 
                  rinsing_timer_top=0; 
                  spinning_timer_top=0;

                  next_state=FILLING;
                   end
                 else
                    begin
                  filling_timer_top=0; 
                  washing_timer_top=0; 
                  rinsing_timer_top=0; 
                  spinning_timer_top=0;
                      end
                    end
                
       FILLING:begin
                  washing_timer_top=0; 
                  rinsing_timer_top=0; 
                  spinning_timer_top=0;

         
               if(filling_timer_top==filling_count_top)
                    begin
                      next_state=WASHING;
                    end
                  else
                    begin
                      next_state=FILLING;
                      end
                   end
                     
        WASHING:begin
                  filling_timer_top=0; 
                  rinsing_timer_top=0; 
                  spinning_timer_top=0;

               if(washing_timer_top==washing_count_top)
                    begin
                      next_state=RINSING;
                    end
                  else
                    begin
                      next_state=WASHING;
                      end
                   end
                      
        RINSING:begin
                  filling_timer_top=0; 
                  washing_timer_top=0; 
                  spinning_timer_top=0;

               if(rinsing_timer_top==rinsing_count_top)
                    begin
                      if(double_wash)
                         next_state=WASHING;
                       else 
                         next_state=SPINNING;
                    end
                  else
                    begin
                      next_state=RINSING;
                      end
                    end
                                  
        SPINNING:begin
                  filling_timer_top=0; 
                  washing_timer_top=0; 
                  rinsing_timer_top=0; 

               if(spinning_timer_top==spinning_count_top)
                    begin
                   wash_done=1;
                   next_state=IDLE; 
                    end
                  else
                    begin
                      next_state=RINSING;
                      end               
                   end  
              endcase
            end
                   

always @(posedge clk )
  begin
     case (current_state)               
   
   FILLING  : begin
                 filling_timer_top<=filling_timer_top+1;
               end
   
   WASHING  : begin
                  washing_timer_top<=washing_timer_top+1;
                end
   
   RINSING  : begin
                rinsing_timer_top<=rinsing_timer_top+1;
              end
   
   SPINNING : begin 
                if(pause)
                  begin
                    spinning_timer_top<=spinning_timer_top;
                  end
                else
                  begin
                  spinning_timer_top=spinning_timer_top+1;
                  end
                end 
            endcase
          end
      endmodule
              
                 