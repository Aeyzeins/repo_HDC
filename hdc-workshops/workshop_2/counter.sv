module counter #(
//Default data width is in n-bits
    parameter int DWIDTH = 5
    parameter int INC_SIZE = 1;
)(

    input wire clk,
    input wire reset,

    output wire complete
);

    reg [DWIDTH-1:0] count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 1'b0;
            complete <= 1'b0;
        end else if (count == ~(5`b0)) begin
            complete <= 1'b1; 
        end else begin
            count <= count + INC_SIZE;
        end
        

        assign complete = (count == (2**DWIDTH-1) ? 1 : 0);

    end

endmodule