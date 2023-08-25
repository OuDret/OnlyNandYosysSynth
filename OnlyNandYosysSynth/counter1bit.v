module counter1bit(
    input wire clk,
    input wire rst,
    output reg [0:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 1'b0;  // Reset the counter to 0
        else
            count <= count + 1;  // Increment the counter
    end

endmodule
