`timescale 1ns/1ps

module sequence_detector_tb ();
  reg  i_clk_tb          ;
  reg  i_rst_n_tb        ;
  reg  i_sequence_in_tb  ;
  wire o_detector_out_tb ;

initial begin
  i_rst_n_tb = 1       ;
  i_clk_tb   = 0       ;
  i_sequence_in_tb = 1 ;
  #100
  i_rst_n_tb = 0       ;
  #100
  i_rst_n_tb = 1       ;
  i_sequence_in_tb = 1 ;
  #100
  i_sequence_in_tb = 1 ;
  #100
  i_sequence_in_tb = 0 ;
  #100
  i_sequence_in_tb = 1 ;
  #100
  i_sequence_in_tb = 1 ;
  #100
  i_sequence_in_tb = 1 ;
  #100
  i_sequence_in_tb = 0 ;
  #100
  i_sequence_in_tb = 0 ;
  #100
  i_sequence_in_tb = 1 ;
  #100
  i_sequence_in_tb = 1 ;
  #100
  i_sequence_in_tb = 1 ;
  #100
  i_sequence_in_tb = 1 ;
end

always #50 i_clk_tb = ~i_clk_tb ;

sequence_detector DUT (
  .i_clk(i_clk_tb)                   ,
  .i_rst_n(i_rst_n_tb)               ,
  .i_sequence_in(i_sequence_in_tb)   ,
  .o_detector_out(o_detector_out_tb));

endmodule