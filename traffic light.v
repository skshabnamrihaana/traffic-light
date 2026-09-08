`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2026 10:39:26 AM
// Design Name: 
// Module Name: traffic light
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module traffic_light_controller(
    input clk,
    input rst,
    output reg [2:0] light_NS, // 3-bit: [Red, Yellow, Green]
    output reg [2:0] light_EW  // 3-bit: [Red, Yellow, Green]
);

    // State Encoding
    parameter S0_NS_GREEN  = 2'b00,
              S1_NS_YELLOW = 2'b01,
              S2_EW_GREEN  = 2'b10,
              S3_EW_YELLOW = 2'b11;

    // Light Color Bit Encodings
    parameter RED    = 3'b100,
              YELLOW = 3'b010,
              GREEN  = 3'b001;

    reg [1:0] current_state, next_state;
    reg [3:0] count; // Counter to keep track of light durations

    // Step 1: FSM State Register (Sequential Logic)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= S0_NS_GREEN;
            count <= 0;
        end else begin
            current_state <= next_state;
            // Reset counter when state changes, otherwise increment
            if (current_state != next_state)
                count <= 0;
            else
                count <= count + 1;
        end
    end

    // Step 2: Next State Combinational Logic
    always @(*) begin
        case(current_state)
            S0_NS_GREEN: begin
                if (count == 4'd7) // Green stays for 8 clock cycles
                    next_state = S1_NS_YELLOW;
                else
                    next_state = S0_NS_GREEN;
            end
            S1_NS_YELLOW: begin
                if (count == 4'd3) // Yellow stays for 4 clock cycles
                    next_state = S2_EW_GREEN;
                else
                    next_state = S1_NS_YELLOW;
            end
            S2_EW_GREEN: begin
                if (count == 4'd7) // Green stays for 8 clock cycles
                    next_state = S3_EW_YELLOW;
                else
                    next_state = S2_EW_GREEN;
            end
            S3_EW_YELLOW: begin
                if (count == 4'd3) // Yellow stays for 4 clock cycles
                    next_state = S0_NS_GREEN;
                else
                    next_state = S3_EW_YELLOW;
            end
            default: next_state = S0_NS_GREEN;
        endcase
    end

    // Step 3: Output Combinational Logic
    always @(*) begin
        case(current_state)
            S0_NS_GREEN:  begin light_NS = GREEN;  light_EW = RED;    end
            S1_NS_YELLOW: begin light_NS = YELLOW; light_EW = RED;    end
            S2_EW_GREEN:  begin light_NS = RED;    light_EW = GREEN;  end
            S3_EW_YELLOW: begin light_NS = RED;    light_EW = YELLOW; end
            default:      begin light_NS = RED;    light_EW = RED;    end
        endcase
    end

endmodule

