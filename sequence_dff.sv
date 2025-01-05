`ifndef SEQUENCE_DFF_SV
`define SEQUENCE_DFF_SV

class sequence_dff extends uvm_sequence#(sequence_item);

//class registeration to factory
    `uvm_object_utils(sequence_dff)

    //constructor
    function new(string name="sequence_dff");
      super.new(name);
    endfunction

    //body task

    virtual task body();
     //create instance of transaction 
      sequence_dff  trans=sequence_item::type_id::create("trans"); 

        start_item(trans);
        trans.randomize();
        finish_item(trans);
    endtask
endclass
`endif