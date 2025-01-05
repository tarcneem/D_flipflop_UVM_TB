
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "dff.sv"
`include "dff_intf.sv"
`include "test_dff.sv"
module top();
    dff_intf dif();
    dff dut(.din(dif.din),.dout(dif.dout),.clk(dif.clk),.rst(dif.rst));
  initial begin
      uvm_config_db#(virtual dff_intf)::set(null,"*","dif",dif);
     run_test("test_dff");
  end
  
  endmodule