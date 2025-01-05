

`ifndef SCOREBOARD_DFF_SV
`define SCOREBOARD_DFF_SV
class scoreboard_dff extends uvm_scoreboard;
`uvm_component_utils(scoreboard_dff)
    uvm_analysis_imp#(sequence_item,scoreboard_dff) recv;
    sequence_item trans;
    function new(string name = "scoreboard",uvm_component parent);
super.new(name,parent);
recv=new("recv",this);
trans=new();
    endfunction

     function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     endfunction

     virtual function void write(input sequence_item t);
        trans = t;
       `uvm_info("SCO",$sformatf("Data rcvd from Monitor din: %0d , dout : %0d ",trans.din,trans.dout), UVM_NONE);
       
        
        
         if(trans.dout == trans.din )
            `uvm_info("SCO","Test Passed", UVM_NONE)
        else
            `uvm_info("SCO","Test Failed", UVM_NONE);
        endfunction
       
endclass    
`endif