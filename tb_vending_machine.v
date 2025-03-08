module tb_vending_machine();
    // Defining the inputs and the outputs
    reg [1:0] item;
    reg five_in, ten_in, clk, rst;
    wire change, dispense;

    // Calling the module
    vending_machine VM(.item(item), .five_in(five_in), .ten_in(ten_in), .clk(clk), .rst(rst), .change(change), .dispense(dispense));

    // Initializing the clock value
    initial clk = 1;

    // Updating clock value at a regular interval
    always #5 clk = ~clk;

    // Input beginning
    initial begin
        // Initializing the values
        item = 2'b01; // Select Item_1
        five_in = 0;
        ten_in = 0;
        rst = 0;

        // Reset the machine
        #10 rst = 1;
        #20 rst = 0;

        // Test Item_1 (cost = 15)
        #50 five_in = 1; // Insert 5
        #50 five_in = 0;
        #50 ten_in = 1; // Insert 10
        #50 ten_in = 0;

        // Check outputs
        $display("Item: %b, Dispense: %b, Change: %b", item, dispense, change);

        #50 ten_in = 1; // Insert 10
        #50 ten_in = 0;
        #50 ten_in = 1; // Insert 10
        #50 ten_in = 0;
        $display("Item: %b, Dispense: %b, Change: %b", item, dispense, change);

        // Test Item_2 (cost = 25)
        #10 rst=1;
        #20 rst=0;
        #50 item = 2'b10;
        #50 five_in = 1; // Insert 5
        #50 five_in = 0;
        #50 ten_in = 1; // Insert 10
        #50 ten_in = 0;
        #50 ten_in = 1; // Insert another 10
        #50 ten_in = 0;

        // Check outputs
        $display("Item: %b, Dispense: %b, Change: %b", item, dispense, change);

        // Test Item_3 (cost = 35)
        #10 rst=1;
        #20 rst=0;
        #50 item = 2'b11;
        #50 ten_in = 1; // Insert 10
        #50 ten_in = 0;
        #50 ten_in = 1; // Insert 10
        #50 ten_in = 0;
        #50 ten_in = 1; // Insert another 10
        #50 ten_in = 0;
        #50 ten_in = 1; // Insert another 10
        #50 ten_in = 0;

        // Check outputs
        $display("Item: %b, Dispense: %b, Change: %b", item, dispense, change);

     
    end

    // Dumping the file and variables
    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, tb_vending_machine);
    end
endmodule
