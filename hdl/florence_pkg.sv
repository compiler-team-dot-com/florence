/**
 * Package with constants used by Florence.
 */

package florence_pkg;

/////////////////////
//// Parameter Enums //
///////////////////////

typedef enum integer {
  RegFileFF    = 0,
  RegFileFPGA  = 1,
  RegFileLatch = 2
} regfile_e;

typedef enum integer {
  RV32MNone        = 0,
  RV32MSlow        = 1,
  RV32MFast        = 2,
  RV32MSingleCycle = 3
} rv32m_e;

typedef enum integer {
  RV32BNone     = 0,
  RV32BBalanced = 1,
  RV32BFull     = 2
} rv32b_e;

/////////////
// Opcodes //
/////////////

typedef enum logic [6:0] {
  OPCODE_LOAD     = 7'h03,
  OPCODE_MISC_MEM = 7'h0f,
  OPCODE_OP_IMM   = 7'h13,
  OPCODE_AUIPC    = 7'h17,
  OPCODE_STORE    = 7'h23,
  OPCODE_OP       = 7'h33,
  OPCODE_LUI      = 7'h37,
  OPCODE_BRANCH   = 7'h63,
  OPCODE_JALR     = 7'h67,
  OPCODE_JAL      = 7'h6f,
  OPCODE_SYSTEM   = 7'h73
} opcode_e;

////////////////////
// ALU operations //
////////////////////

typedef enum logic [5:0] {
  // Arithmetics
  ALU_ADD,
  ALU_SUB,
  
  // Logics
  ALU_XOR,
  ALU_OR,
  ALU_AND,
  // RV32B
  ALU_XNOR,
  ALU_ORN,
  ALU_ANDN,
  
  // Shifts
  ALU_SRA,
  ALU_SRL,
  ALU_SLL,
  // RV32B
  ALU_SRO,
  ALU_SLO,
  ALU_ROR,
  ALU_ROL,
  ALU_GREV,
  ALU_GORC,
  ALU_SHFL,
  ALU_UNSHFL,
  
  // Comparisons
  ALU_LT,
  ALU_LTU,
  ALU_GE,
  ALU_GEU,
  ALU_EQ,
  ALU_NE,
  // RV32B
  ALU_MIN,
  ALU_MINU,
  ALU_MAX,
  ALU_MAXU,
  
  // Pack
  // RV32B
  ALU_PACK,
  ALU_PACKU,
  ALU_PACKH,
  
  // Sign-Extend
  // RV32B
  ALU_SEXTB,
  ALU_SEXTH,
  
  // Bitcounting
  // RV32B
  ALU_CLZ,
  ALU_CTZ,
  ALU_PCNT,
  
  // Set lower than
  ALU_SLT,
  ALU_SLTU,
  
  // Ternary Bitmanip Operations
  // RV32B
  ALU_CMOV,
  ALU_CMIX,
  ALU_FSL,
  ALU_FSR,
  
  // Single-Bit Operations
  // RV32B
  ALU_SBSET,
  ALU_SBCLR,
  ALU_SBINV,
  ALU_SBEXT,
  
  // Bit Extract / Deposit
  // RV32B
  ALU_BEXT,
  ALU_BDEP,
  
  // Bit Field Place
  // RV32B
  ALU_BFP,
  
  // Carry-less Multiply
  // RV32B
  ALU_CLMUL,
  ALU_CLMULR,
  ALU_CLMULH,
  
  // Cyclic Redundancy Check
  ALU_CRC32_B,
  ALU_CRC32C_B,
  ALU_CRC32_H,
  ALU_CRC32C_H,
  ALU_CRC32_W,
  ALU_CRC32C_W
} alu_op_e;

//////////////////////////////////
// Control and status registers //
//////////////////////////////////

// CSR operations
typedef enum logic [1:0] {
  CSR_OP_READ,
  CSR_OP_WRITE,
  CSR_OP_SET,
  CSR_OP_CLEAR
} csr_op_e;

// Privileged mode
typedef enum logic[1:0] {
  PRIV_LVL_M = 2'b11,
  PRIV_LVL_H = 2'b10,
  PRIV_LVL_S = 2'b01,
  PRIV_LVL_U = 2'b00
} priv_lvl_e;

// Constants for the dcsr.xdebugver fields
typedef enum logic[3:0] {
  XDEBUGVER_NO     = 4'd0, // no external debug support
  XDEBUGVER_STD    = 4'd4, // external debug according to RISC-V debug spec
  XDEBUGVER_NONSTD = 4'd15 // debug not conforming to RISC-V debug spec
} x_debug_ver_e;

//////////////
// WB stage //
//////////////

// Type of instruction present in writeback stage
typedef enum logic[1:0] {
  WB_INSTR_LOAD,  // Instruction is awaiting load data
  WB_INSTR_STORE, // Instruction is awaiting store response
  WB_INSTR_OTHER  // Instruction doesn't fit into above categories
} wb_instr_type_e;
