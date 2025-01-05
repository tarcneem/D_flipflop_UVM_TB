`ifndef ENV_SV
`define ENV_SV
class Env extends uvm_env;
    `uvm_component_utils(Env)
        scoreboard_dff scr;
        agent_dff ag;
        
        function new(string name ="Env",uvm_component parent);
            super.new(name,parent);
        endfunction
            
     function void build_phase(uvm_phase phase);
        super.build_phase(phase);
       scr=scoreboard_dff::type_id::create("scr",this);
        ag=agent_dff::type_id::create("ag",this);
    
     endfunction
    
     function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      ag.mon.send.connect(scr.recv);
     endfunction
    
    endclass
`endif