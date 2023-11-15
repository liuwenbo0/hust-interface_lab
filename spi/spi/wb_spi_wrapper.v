
module wb_spi_wrapper(
	input 						wb_clk_i,
	input 						wb_rst_i,
	// WISHBONE interface
	input  [31:0] 	 			wb_adr_i,
	input  [31:0] 	 			wb_dat_i,
	output [31:0] 	 			wb_dat_o,
	input 						wb_we_i,
	input 						wb_stb_i,
	input 						wb_cyc_i,
	input  [3:0]				wb_sel_i,
	output 						wb_ack_o,
	// SPI	signals
	output wire        			o_accel_sclk,
    output wire        			o_accel_cs_n,
    output [7:0]        	    o_accel_mosi,
    input  [7:0]         		i_accel_miso,
	output wire					spi_irq,
	
	//user add interface
	input                       clk,
	input                       rst_n,
	input                       sw,
	output reg                  [7:0] AN,
	output reg                  [6:0] Digits_Bits
);

	wire [7:0] 		       		spi_rdt;
	
	assign wb_dat_o = {24'd0,spi_rdt};

	simple_spi spi(
		// Wishbone slave interface
		.clk_i  (wb_clk_i),
		.rst_i  (~wb_rst_i),
		.adr_i  (wb_adr_i[2]? 3'd0 : wb_adr_i[5:3]),
		.dat_i  (wb_dat_i[7:0]),
		.we_i   (wb_we_i),
		.cyc_i  (wb_cyc_i),
		.stb_i  (wb_stb_i),
		.dat_o  (spi_rdt),
		.ack_o  (wb_ack_o),
		.inta_o (spi_irq),
		// SPI interface
		.sck_o  (o_accel_sclk),
		.ss_o   (o_accel_cs_n),
		.mosi_o (o_accel_mosi),
		.miso_i (i_accel_miso)
	);

  reg data;
  reg [7:0] Data_Reg;
  reg [9:0] counter;
  initial begin
    Data_Reg = 8'b00000000;
    AN = 8'b1111_1110;
    data = 1'b0;
    counter = 10'd0;
  end
  always @(posedge clk)
    if (rst_n)
      begin
        Data_Reg = 8'b00000000;
      end
    else if (wb_cyc_i & wb_stb_i & wb_ack_o & wb_we_i)
      begin
        Data_Reg = (sw)?8'b11111111:wb_dat_i[7:0];
      end
    else if (wb_cyc_i & wb_stb_i & wb_ack_o & ~wb_we_i)
      begin
        Data_Reg = (sw)?spi_rdt[7:0]:8'b00000000;
    end

  always @(posedge clk) begin
    if(!rst_n) begin
      AN = 8'b1111_1110;
      data = 1'b0;
      counter = 10'd0;
    end
    else if(counter == 200) begin
      counter = 10'd0;
      if(AN == 8'b0111_1111) AN = 8'b1111_1110;
      else AN = (AN << 1) + 8'b1;
      
      case(AN)
        8'b1111_1110: data = Data_Reg[0];
        8'b1111_1101: data = Data_Reg[1];
        8'b1111_1011: data = Data_Reg[2];
        8'b1111_0111: data = Data_Reg[3];
        8'b1110_1111: data = Data_Reg[4];
        8'b1101_1111: data = Data_Reg[5];
        8'b1011_1111: data = Data_Reg[6];
        8'b0111_1111: data = Data_Reg[7];
      endcase
      
      case(data)
        1'b0: Digits_Bits = 7'b000_0001;
        1'h1: Digits_Bits = 7'b100_1111;
        default: 
            Digits_Bits = 7'b000_0000;
      endcase
    end
    else counter = counter + 1;
  end
	

endmodule
