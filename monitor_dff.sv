`ifndef monitor_dff_sv
`define monitor_dff_sv
import uvm_pkg::*;  // Import UVM package
`include "uvm_macros.svh"
`include "sequence_item.sv" 

class monitor_dff extends uvm_driver#(sequence_item);
    `uvm_component_utils(monitor_dff)
    
    virtual dff_intf dif;
         uvm_analysis_port #(sequence_item) send;
         sequence_item trans;

    function new(string name ="monitor_dff",uvm_component parent);
    super.new(name,parent);
    send=new("send",this);
    req=new();
    endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dff_intf )::get(this," ","dif",dif))
    `uvm_error(get_type_name(),"unable to access interface");
  endfunction

virtual task run_phase(uvm_phase phase);
forever begin
    #10;
    trans.din=dif.din;
    trans.dout=dif.dout;
    `uvm_info(get_type_name(),$sformatf("signals sampled are : din= %d  dout=%d ",trans.din,trans.dout),UVM_LOW);
send.write(trans);
end

endtask

endclass
`endif // End of include guard
