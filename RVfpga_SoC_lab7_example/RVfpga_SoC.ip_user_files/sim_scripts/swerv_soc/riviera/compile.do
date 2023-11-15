vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/swerv_soc/ipshared/9426" "+incdir+../../../bd/swerv_soc/ipshared/736f" "+incdir+../../../bd/swerv_soc/ipshared/64dd/src" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/9426" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/736f" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/64dd/src" \
"../../../bd/swerv_soc/ipshared/9426/axi2wb.v" \
"../../../bd/swerv_soc/ipshared/9426/axi_intercon_wr.v" \
"../../../bd/swerv_soc/ipshared/9426/wb_intercon.v" \
"../../../bd/swerv_soc/ipshared/9426/wb_mux.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/swerv_soc/ipshared/9426" "+incdir+../../../bd/swerv_soc/ipshared/736f" "+incdir+../../../bd/swerv_soc/ipshared/64dd/src" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/9426" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/736f" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/64dd/src" \
"../../../bd/swerv_soc/ipshared/9426/cf_math_pkg.sv" \
"../../../bd/swerv_soc/ipshared/9426/addr_decode.sv" \
"../../../bd/swerv_soc/ipshared/9426/axi_pkg.sv" \
"../../../bd/swerv_soc/ipshared/9426/axi_atop_filter.sv" \
"../../../bd/swerv_soc/ipshared/9426/axi_demux.sv" \
"../../../bd/swerv_soc/ipshared/9426/axi_err_slv.sv" \
"../../../bd/swerv_soc/ipshared/9426/axi_id_prepend.sv" \
"../../../bd/swerv_soc/ipshared/9426/axi_intercon.sv" \
"../../../bd/swerv_soc/ipshared/9426/axi_mux.sv" \
"../../../bd/swerv_soc/ipshared/9426/axi_xbar.sv" \
"../../../bd/swerv_soc/ipshared/9426/counter.sv" \
"../../../bd/swerv_soc/ipshared/9426/delta_counter.sv" \
"../../../bd/swerv_soc/ipshared/9426/fifo_v3.sv" \
"../../../bd/swerv_soc/ipshared/9426/lzc.sv" \
"../../../bd/swerv_soc/ipshared/9426/rr_arb_tree.sv" \
"../../../bd/swerv_soc/ipshared/9426/spill_register.sv" \
"../../../bd/swerv_soc/ipshared/9426/stream_register.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/swerv_soc/ipshared/9426" "+incdir+../../../bd/swerv_soc/ipshared/736f" "+incdir+../../../bd/swerv_soc/ipshared/64dd/src" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/9426" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/736f" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/64dd/src" \
"../../../bd/swerv_soc/ipshared/9426/axi2wb_intcon_wrapper.v" \
"../../../bd/swerv_soc/ip/swerv_soc_axi2wb_intcon_wrapper_0_0/sim/swerv_soc_axi2wb_intcon_wrapper_0_0.v" \
"../../../bd/swerv_soc/ipshared/736f/gpio_top.v" \
"../../../bd/swerv_soc/ipshared/736f/wb_gpio_wrapper.v" \
"../../../bd/swerv_soc/ip/swerv_soc_wb_gpio_wrapper_0_0/sim/swerv_soc_wb_gpio_wrapper_0_0.v" \
"../../../bd/swerv_soc/ip/swerv_soc_bootrom_wrapper_0_0/sim/swerv_soc_bootrom_wrapper_0_0.v" \
"../../../bd/swerv_soc/ip/swerv_soc_syscon_wrapper_0_0/sim/swerv_soc_syscon_wrapper_0_0.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/swerv_soc/ipshared/9426" "+incdir+../../../bd/swerv_soc/ipshared/736f" "+incdir+../../../bd/swerv_soc/ipshared/64dd/src" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/9426" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/736f" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/64dd/src" \
"../../../bd/swerv_soc/ipshared/64dd/src/lib/beh_lib.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/dbg/dbg.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/swerv_types.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/dec/dec.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/dec/dec_decode_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/dec/dec_gpr_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/dec/dec_ib_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/dec/dec_tlu_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/dec/dec_trigger.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/dma/dma_ctrl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/exu/exu.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/exu/exu_alu_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/exu/exu_div_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/exu/exu_mul_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/ifu/ifu.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/ifu/ifu_aln_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/ifu/ifu_bp_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/ifu/ifu_compress_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/ifu/ifu_ic_mem.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/ifu/ifu_ifc_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/ifu/ifu_mem_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/lsu/lsu.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/lsu/lsu_addrcheck.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/lsu/lsu_bus_buffer.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/lsu/lsu_bus_intf.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/lsu/lsu_clkdomain.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/lsu/lsu_dccm_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/lsu/lsu_dccm_mem.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/lsu/lsu_ecc.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/lsu/lsu_lsc_ctl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/lsu/lsu_stbuf.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/lsu/lsu_trigger.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/mem.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/lib/mem_lib.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/pic/pic_ctrl.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/swerv.sv" \
"../../../bd/swerv_soc/ipshared/64dd/src/swerv_wrapper_dmi.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/swerv_soc/ipshared/9426" "+incdir+../../../bd/swerv_soc/ipshared/736f" "+incdir+../../../bd/swerv_soc/ipshared/64dd/src" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/9426" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/736f" "+incdir+../../../../RVfpga_SoC.srcs/sources_1/bd/swerv_soc/ipshared/64dd/src" \
"../../../bd/swerv_soc/ipshared/64dd/src/swerv_wrapper_verilog.v" \
"../../../bd/swerv_soc/ip/swerv_soc_swerv_wrapper_verilog_0_1/sim/swerv_soc_swerv_wrapper_verilog_0_1.v" \
"../../../bd/swerv_soc/sim/swerv_soc.v" \
"../../../bd/swerv_soc/ip/swerv_soc_wb_uart_wrapper_0_0/sim/swerv_soc_wb_uart_wrapper_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

