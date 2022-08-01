module timer_machinec(
  input     wire  [3:0]    clock_frequency_tm,
  input     wire  [2:0]    state_tm,
       
  output    reg   [28:0]   filling_count_tm,
  output    reg   [28:0]   washing_count_tm,
  output    reg   [28:0]   rinsing_count_tm,
  output    reg   [28:0]   spinning_count_tm);
  
  
  
always@(*)
  begin  
    case(clock_frequency_tm)
    4'b0001:begin           //////// 1MHZ 
                 case(state_tm)
                 3'b000: begin           //Idle
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
           
                 3'b001: begin           //filling water
                             filling_count_tm='d120000000;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
          
                 3'b010: begin           //washing
                             filling_count_tm='b0;
                             washing_count_tm='d300000000;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
                 
                 3'b011: begin           //Rinsing
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='d120000000;
                             spinning_count_tm='b0;
                           end
                 
                 3'b100: begin           //Spinning
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='d60000000;
                           end
                         endcase
                       end
    ///////////////////////////////////                   
    4'b0010:begin       ///2MHZ
                 case(state_tm)
                 3'b000: begin           //Idle
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
           
                 3'b001: begin           //filling water
                             filling_count_tm='d120000000*2;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
          
                 3'b010: begin           //washing
                             filling_count_tm='b0;
                             washing_count_tm='d300000000*2;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
                 
                 3'b011: begin           //Rinsing
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='d120000000*2;
                             spinning_count_tm='b0;
                           end
                 
                 3'b100: begin           //Spinning
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='d60000000*2;
                           end
                         endcase
                       end
             /////////////////////////////
    4'b0100:begin             ////4MHZ
                 case(state_tm)
                 3'b000: begin           //Idle
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
           
                 3'b001: begin           //filling water
                             filling_count_tm='d120000000*4;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
          
                 3'b010: begin           //washing
                             filling_count_tm='b0;
                             washing_count_tm='d300000000*4;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
                 
                 3'b011: begin           //Rinsing
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='d120000000*4;
                             spinning_count_tm='b0;
                           end
                 
                 3'b100: begin           //Spinning
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='d60000000*4;
                           end
                         endcase
                       end
    //////////////////////////////////////////////////
    4'b1000:begin              //8MHZ
                 case(state_tm)
                 3'b000: begin           //Idle
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
           
                 3'b001: begin           //filling water
                             filling_count_tm='d120000000*8;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
          
                 3'b010: begin           //washing
                             filling_count_tm='b0;
                             washing_count_tm='d300000000*8;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
                 
                 3'b011: begin           //Rinsing
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='d120000000*8;
                             spinning_count_tm='b0;
                           end
                 
                 3'b100: begin           //Spinning
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='d60000000*8;
                           end
                         endcase
                       end
    
                              
        endcase
      end
    endmodule
    
                              
          
    
                              
          
    
                              
