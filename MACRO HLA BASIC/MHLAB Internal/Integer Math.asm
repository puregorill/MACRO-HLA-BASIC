;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; INTEGER MATH
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;*******************************************************************************
; 8-BIT
;*******************************************************************************

!macro LET8 target_addr_mode, target_operand, source_addr_mode, source_operand {
  +_L_D_A_ source_addr_mode, source_operand
  +_S_T_A_ target_addr_mode, target_operand
}
!macro ADD8 target_addr_mode, target_value, source0_addr_mode, source0_operand, source1_addr_mode, source1_operand {
  +_L_D_A_ source0_addr_mode, source0_operand
  +ADD8_TO_A source1_addr_mode, source1_operand
  +_S_T_A_ target_addr_mode, target_value
}
!macro SUB8 target_addr_mode, target_value, source0_addr_mode, source0_operand, source1_addr_mode, source1_operand {
  +_L_D_A_ source0_addr_mode, source0_operand
  +SUB8_FROM_A source1_addr_mode, source1_operand
  +_S_T_A_ target_addr_mode, target_value
}

;*******************************************************************************
; 16-BIT
;*******************************************************************************

!macro LET16 target_addr_mode, target_operand, source_addr_mode, source_operand {
  +_L_D_A_ source_addr_mode, source_operand
  +_S_T_A_ target_addr_mode, target_operand
  !if source_addr_mode>IMM16 { ; 8-bit
    lda #0
  } else { ; 16-bit
  +_L_D_A_H_I_ source_addr_mode, source_operand
  }
  +_S_T_A_H_I_ target_addr_mode, target_operand
}
!macro INC16 addr_mode, operand {
  +_I_N_C_ addr_mode, operand
  bne ._l_
  +_I_N_C_H_I_ addr_mode, operand
._l_
}
!macro DEC16 addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  bne ._l_
  +_D_E_C_H_I_ addr_mode, operand
._l_
  +_D_E_C_ addr_mode, operand
}
!macro ADD16 target_addr_mode, target_operand, source0_addr_mode, source0_operand, source1_addr_mode, source1_operand {
  !if source1_addr_mode>IMM16 { ; 16-bit
    +_L_D_A_ source0_addr_mode, source0_operand
    +ADD8_TO_A source1_addr_mode, source1_operand
    +_S_T_A_ target_addr_mode, target_operand
    +_L_D_A_H_I_ source0_addr_mode, source0_operand
    +ADD8_TO_A_HI source1_addr_mode, source1_operand
    +_S_T_A_H_I_ target_addr_mode, target_operand
  } else { ; 8-bit
    +_L_D_A_ source0_addr_mode, source0_operand
    +ADD8_TO_A source1_addr_mode, source1_operand
    +_S_T_A_ target_addr_mode, target_operand
    bcc ._l_
    +_I_N_C_H_I_ target_addr_mode, target_operand
    ._l_
  }
}
!macro SUB16 target_addr_mode, target_operand, source0_addr_mode, source0_operand, source1_addr_mode, source1_operand {
  !if source1_addr_mode>IMM16 { ; 16-bit
    +_L_D_A_ source0_addr_mode, source0_operand
    +SUB8_FROM_A source1_addr_mode, source1_operand
    +_S_T_A_ target_addr_mode, target_operand
    +_L_D_A_H_I_ source0_addr_mode, source0_operand
    +SUB8_FROM_A_HI source1_addr_mode, source1_operand
    +_S_T_A_H_I_ target_addr_mode, target_operand
  } else { ; 8-bit
    +_L_D_A_ source0_addr_mode, source0_operand
    +SUB8_FROM_A source1_addr_mode, source1_operand
    +_S_T_A_ target_addr_mode, target_operand
    bcs ._l_
    +_D_E_C_H_I_ target_addr_mode, target_operand
    ._l_
  }
}



