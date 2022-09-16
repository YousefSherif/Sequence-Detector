module sequence_detector (
  input  wire i_clk          ,
  input  wire i_rst_n        ,
  input  wire i_sequence_in  ,
  output reg  o_detector_out);

  parameter  S0 = 3'b000 ,
             S1 = 3'b001 ,
             S2 = 3'b011 ,
             S3 = 3'b010 ,
             S4 = 3'b110 ;
  
  reg [2:0] current_state ,
            next_state    ;

always @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n) current_state <= S0         ;
    else         current_state <= next_state ;
  end

always @(*) begin
  case(current_state) 
    S0: begin
      if(i_sequence_in == 0)
        next_state = S0 ;
      else
        next_state = S1 ;
    end
    S1: begin
      if(i_sequence_in == 0)
        next_state = S0 ;
      else
        next_state = S2 ;
    end
    S2: begin
      if(i_sequence_in == 0)
        next_state = S3 ;
      else
        next_state = S2 ;
    end
    S3: begin
      if(i_sequence_in == 0)
        next_state = S0 ;
      else
        next_state = S4 ;
    end
    S4: begin
      if(i_sequence_in == 0)
        next_state = S0 ;
      else
        next_state = S2 ;
    end
    default: next_state = S0 ;
  endcase
end

always @(*) begin 
  case(current_state) 
    S0:     o_detector_out = 0 ;
    S1:     o_detector_out = 0 ;
    S2:     o_detector_out = 0 ;
    S3:     o_detector_out = 0 ;
    S4:     o_detector_out = 1 ;
    default:o_detector_out = 0 ;
  endcase
end
  
endmodule
