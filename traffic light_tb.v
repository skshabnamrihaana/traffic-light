

module tb_traffic_light_controller();

    // Inputs to Design Under Test (DUT)
    reg clk;
    reg rst;

    // Outputs from DUT
    wire [2:0] light_NS;
    wire [2:0] light_EW;

    // Instantiate the traffic light controller
    traffic_light_controller uut (
        .clk(clk),
        .rst(rst),
        .light_NS(light_NS),
        .light_EW(light_EW)
    );

    // Generate Clock: Toggles every 5ns (10ns clock period)
    always begin
        #5 clk = ~clk;
    end

    // Test Sequence
    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;

        // Apply Reset for 20ns
        #20;
        rst = 0;

        // Let simulation run for 300ns to see full transitions
        #300;
        
        $finish; 
    end
    
    // Monitor Outputs in Console
    initial begin
        $monitor("Time = %0t | Reset = %b | NS Light (R-Y-G) = %b | EW Light (R-Y-G) = %b", 
                 $time, rst, light_NS, light_EW);
    end

endmodule

   
