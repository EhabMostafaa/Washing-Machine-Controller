module timer_machinec#(parameter FILLING_COUNT_TM=29'd120000000,
                       parameter WASHING_COUNT_TM=29'd300000000,
                       parameter RINSING_COUNT_TM=29'd120000000,
                       parameter SPINNING_COUNT_TM=29'd60000000)
(
  input     wire  [3:0]    clock_frequency_tm,
  input     wire  [2:0]    state_tm,
       
  output    reg   [31:0]   filling_count_tm,
  output    reg   [31:0]   washing_count_tm,
  output    reg   [31:0]   rinsing_count_tm,
  output    reg   [31:0]   spinning_count_tm);
  
  
  
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
                             filling_count_tm=FILLING_COUNT_TM;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
          
                 3'b010: begin           //washing
                             filling_count_tm='b0;
                             washing_count_tm=WASHING_COUNT_TM;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
                 
                 3'b011: begin           //Rinsing
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm=RINSING_COUNT_TM;
                             spinning_count_tm='b0;
                           end
                 
                 3'b100: begin           //Spinning
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm=SPINNING_COUNT_TM;
                           end
                 default:begin
                            filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
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
                             filling_count_tm=FILLING_COUNT_TM*2;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
          
                 3'b010: begin           //washing
                             filling_count_tm='b0;
                             washing_count_tm=WASHING_COUNT_TM*2;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
                 
                 3'b011: begin           //Rinsing
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm=RINSING_COUNT_TM*2;
                             spinning_count_tm='b0;
                           end
                 
                 3'b100: begin           //Spinning
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm=SPINNING_COUNT_TM*2;
                           end
                 default:begin
                            filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
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
                             filling_count_tm=FILLING_COUNT_TM*4;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
          
                 3'b010: begin           //washing
                             filling_count_tm='b0;
                             washing_count_tm=WASHING_COUNT_TM*4;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
                 
                 3'b011: begin           //Rinsing
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm=RINSING_COUNT_TM*4;
                             spinning_count_tm='b0;
                           end
                 
                 3'b100: begin           //Spinning
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm=SPINNING_COUNT_TM*4;
                           end
                 default:begin
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
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
                             filling_count_tm=FILLING_COUNT_TM*8;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
          
                 3'b010: begin           //washing
                             filling_count_tm='b0;
                             washing_count_tm=WASHING_COUNT_TM*8;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
                 
                 3'b011: begin           //Rinsing
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm=RINSING_COUNT_TM*8;
                             spinning_count_tm='b0;
                           end
                 
                 3'b100: begin           //Spinning
                             filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm=SPINNING_COUNT_TM*8;
                           end
                 default:begin
                            filling_count_tm='b0;
                             washing_count_tm='b0;
                             rinsing_count_tm='b0;
                             spinning_count_tm='b0;
                           end
                         endcase
                       end
    
                              
        endcase
      end
    endmodule
    
                              
          
    
                              
          
    
                              
