`ifdef RISCV_FORMAL
  `define RVFI
`endif

/**
 * Top level module of the Florence RISC-V core.
 */
module florence_core #(
  parameter bit                 RV32E            = 0'b0,
  parameter ibex_pkg::rv32m_e   RV32M            = ibex_pkg::RV32MNone,
  parameter ibex_pkg::rv32b_e   RV32B            = ibex_pkg::RV32BNone,
  parameter bit                 BranchTargetALU  = 1'b0,
  parameter bit                 WritebackStage   = 1'b0,
  parameter bit                 ICache           = 1'b0,
  parameter bit                 ICacheECC        = 1'b0,
  parameter bit                 BranchPredictor  = 1'b0,
  parameter bit                 DbgTriggerEn     = 1'b0,
  parameter int unsigned        DbgHwBreakNum    = 1,
  parameter bit                 SecureIbex       = 1'b0,
  parameter int unsigned        DmHaltAddr       = 32'h1A110800,
  parameter int unsigned        DmExceptionAddr  = 32'h1A110808
) (
  // Clock and reset
  input logic clk_i,
  input logic rst_ni,

  input logic [31:0] hart_id_i,
  input logic [31:0] boot_addr_i,

  // Instruction memory interface
  output logic instr_req_o,
  input logic instr_gnt_i,
  input logic instr_rvalid_i,
  output logic [31:0] instr_addr_o,
  input logic [31:0] instr_rdata_i,
  input logic instr_err_i,

  // Data memmory interface
  output logic data_req_o,
  input logic data_gnt_i,
  input logic data_rvalid_i,
  output logic data_we_o,
  output logic [3:0] data_be_o,
  output logic [31:0] data_addr_o,
  output logic [31:0] data_wdata_o,
  input logic [31:0] data_rdata_i,
  input logic data_err_i,

  // Interrupt inputs
  input  logic        irq_software_i,
  input  logic        irq_timer_i,
  input  logic        irq_external_i,
  input  logic [14:0] irq_fast_i,
  input  logic        irq_nm_i,       // non-maskeable interrupt

  // Debug interface
  input logic debug_req_i,

  // RISC-V Formal Interface
`ifdef RVFI
  output logic        rvfi_valid,
  output logic [63:0] rvfi_order,
  output logic [31:0] rvfi_insn,
  output logic        rvfi_trap,
  output logic        rvfi_halt,
  output logic        rvfi_intr,
  output logic [ 1:0] rvfi_mode,
  output logic [ 1:0] rvfi_ixl,
  output logic [ 4:0] rvfi_rs1_addr,
  output logic [ 4:0] rvfi_rs2_addr,
  output logic [ 4:0] rvfi_rs3_addr,
  output logic [31:0] rvfi_rs1_rdata,
  output logic [31:0] rvfi_rs2_rdata,
  output logic [31:0] rvfi_rs3_rdata,
  output logic [ 4:0] rvfi_rd_addr,
  output logic [31:0] rvfi_rd_wdata,
  output logic [31:0] rvfi_pc_rdata,
  output logic [31:0] rvfi_pc_wdata,
  output logic [31:0] rvfi_mem_addr,
  output logic [ 3:0] rvfi_mem_rmask,
  output logic [ 3:0] rvfi_mem_wmask,
  output logic [31:0] rvfi_mem_rdata,
  output logic [31:0] rvfi_mem_wdata,
`endif

  // CPU control signals
  input  logic        fetch_enable_i,
  output logic        alert_minor_o,
  output logic        alert_major_o,
  output logic        core_sleep_o
);
