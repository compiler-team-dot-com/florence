`timescale 1ns / 1ps

module top(BTN, LED);
    
  input wire BTN;
  output wire LED;

  assign LED = BTN;
    
endmodule
