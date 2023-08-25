module counter(
    input wire clk,
    input wire rst,
    output reg [3:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0000;  // Reset the counter to 0
        else
            count <= count + 1;  // Increment the counter
    end

endmodule