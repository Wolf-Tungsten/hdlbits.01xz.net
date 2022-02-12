module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    assign heater = (mode == 1'b1) && too_cold;
    assign aircon = (mode == 1'b0) && too_hot;
    assign fan = fan_on | heater | aircon;
    
endmodule