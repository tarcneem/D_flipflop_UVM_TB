
`ifndef DRIVER_DFF_SV
`define DRIVER_DFF_SV

class driver_dff extends uvm_driver#(sequence_dff);
     //handle  of the interface 
    virtual dff_intf dif;
    //handle of the transaction
    sequence_dff trans;
    //class registeration to factory
    `uvm_component_utils(driver_dff)
    //constructor
    function new(string name="driver_dff",uvm_component parent);
     super.new(name,parent);
    endfunction
    
//build phase
    function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     trans = sequence_dff::type_id::create("trans");
     if(!uvm_config_db#(virtual dff_intf)::get(this,"","dif",dif))
     `uvm_fatal(get_type_name(),{"dif must be set to dif",get_full_name(),".dif"});
    endfunction

    //run_phase
    virtual task run_phase(uvm_phase phase);
     forever begin
    // Retrieve the next transaction from the sequence
        seq_item_port.get_next_item(trans);
     // Drive the transaction data to the DUT through the interface
        dif.din<=trans.din;
    // Complete the transaction

        seq_item_port.item_done(trans);
     end

    endtask
endclass
`endif