
`ifndef sequence_item_sv
`define sequence_item_sv

`include "uvm_macros.svh"
import uvm_pkg::*; 

class sequence_item extends uvm_sequence_item;

    //constructor
    function new(string name ="sequence_item");
       super.new(name);
    endfunction

    //data members
  
    rand logic din;
    logic dout;
    

    //macro fields and class registeration
`uvm_object_utils_begin(sequence_item)
`uvm_field_int(din,UVM_DEFAULT);
`uvm_field_int(dout,UVM_DEFAULT);
`uvm_object_utils_end

endclass


`endif // End of include guard
