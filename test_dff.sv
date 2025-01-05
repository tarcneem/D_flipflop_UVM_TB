`ifndef TEST_DFF_SV
`define TEST_DFF_SV
`include "package.sv"
class test_dff extends uvm_test;
    `uvm_component_utils(test_dff)
        function new(string name = "test_dff",uvm_component parent);
            super.new(name,parent);
        endfunction
    
    Env e;
    sequence_dff sq;
    
    function void build_phase(uvm_phase phase);
       super.build_phase(phase);
       e=Env::type_id::create("e",this);
       sq=sequence_dff::type_id::create("sq");
     endfunction
     
     virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        sq.start(e.ag.sqr);
        #50;
        phase.drop_objection(this);
     endtask
     endclass
`endif