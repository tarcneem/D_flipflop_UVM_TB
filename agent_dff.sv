

`ifndef AGENT_DFF_SV
`define AGENT_DFF_SV
class agent_dff extends uvm_agent;
    //class registeration to factory
`uvm_component_utils(agent_dff)
  //constructor
    function new(string name="agent_dff",uvm_component parent);
        super.new(name,parent);
    endfunction
//components handles 
    driver_dff drv;
    monitor_dff mon;
    sequencer sqr;
    //build phase 

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //if the agent is active then instantiate all three components else create only monitor
    if(get_is_active()==UVM_ACTIVE)begin
     drv=driver_dff::type_id::create("drv",this);
     sqr=sequencer::type_id::create("sqr",this);
    end
    mon=monitor_dff::type_id::create("mon",this);
    endfunction


    //connect phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
     if(get_is_active()==UVM_ACTIVE)
     drv.seq_item_port.connect(sqr.seq_item_export);
    endfunction
endclass
`endif