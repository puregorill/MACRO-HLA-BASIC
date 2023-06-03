;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; LOOPS
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;===============================================================================
; REPEAT/LOOP/BLOCK
;===============================================================================

;*********************************************************************
; LOOP HEADS
;*********************************************************************

!macro REPEAT { ; ... UNTIL
  +_P_U_S_H_L_O_O_P_ *
}
!macro LOOP { ; ... ENDLOOP
  +REPEAT
}
!macro BLOCK { ; ... ENDBLOCK
  +REPEAT
}

;*********************************************************************
; UNTIL
;*********************************************************************

;---------------------------------------------------------------------
; UNTIL_FLAG
;---------------------------------------------------------------------

!macro UNTIL_FLAG_ZERO_SET {
  bne _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTIL_FLAG_ZERO_CLEAR {
  beq _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTIL_FLAG_CARRY_SET {
  bcc _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTIL_FLAG_CARRY_CLEAR {
  bcs _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTIL_FLAG_OVERFLOW_SET {
  bvc _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTIL_FLAG_OVERFLOW_CLEAR {
  bvs _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTIL_FLAG_NEGATIVE_SET {
  bpl _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTIL_FLAG_NEGATIVE_CLEAR {
  bmi _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTIL_FLAG_POSITIVE {
  +UNTIL_FLAG_NEGATIVE_CLEAR
}

!macro UNTILFAR_FLAG_ZERO_SET {
  +JNE _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTILFAR_FLAG_ZERO_CLEAR {
  +JEQ _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTILFAR_FLAG_CARRY_SET {
  +JCC _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTILFAR_FLAG_CARRY_CLEAR {
  +JCS _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTILFAR_FLAG_OVERFLOW_SET {
  +JVC _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTILFAR_FLAG_OVERFLOW_CLEAR {
  +JVS _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTILFAR_FLAG_NEGATIVE_SET {
  +JPL _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTILFAR_FLAG_NEGATIVE_CLEAR {
  +JMI _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro UNTILFAR_FLAG_POSITIVE {
  +UNTILFAR_FLAG_NEGATIVE_CLEAR
}

;---------------------------------------------------------------------
; UNTIL_COMPARED_REGISTER_IS
;---------------------------------------------------------------------

!macro UNTIL_COMPARED_REGISTER_IS_EQUAL {
  +UNTIL_FLAG_ZERO_SET
}
!macro UNTIL_COMPARED_REGISTER_IS_NOT_EQUAL {
  +UNTIL_FLAG_ZERO_CLEAR
}
!macro UNTIL_COMPARED_REGISTER_IS_LOWER {
  +UNTIL_FLAG_CARRY_CLEAR
}
!macro UNTIL_COMPARED_REGISTER_IS_GREATER_OR_EQUAL {
  +UNTIL_FLAG_CARRY_SET
}

!macro UNTILFAR_COMPARED_REGISTER_IS_EQUAL {
  +UNTILFAR_FLAG_ZERO_SET
}
!macro UNTILFAR_COMPARED_REGISTER_IS_NOT_EQUAL {
  +UNTILFAR_FLAG_ZERO_CLEAR
}
!macro UNTILFAR_COMPARED_REGISTER_IS_LOWER {
  +UNTILFAR_FLAG_CARRY_CLEAR
}
!macro UNTILFAR_COMPARED_REGISTER_IS_GREATER_OR_EQUAL {
  +UNTIL_FLAG_CARRY_SET
}

;---------------------------------------------------------------------
; UNTIL_REGISTER_IS
;---------------------------------------------------------------------

!macro UNTIL_REGISTER_IS_EQUAL_TO register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +UNTIL_COMPARED_REGISTER_IS_EQUAL
}
!macro UNTIL_REGISTER_IS_NOT_EQUAL_TO register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +UNTIL_COMPARED_REGISTER_IS_NOT_EQUAL
}
!macro UNTIL_REGISTER_IS_LOWER_THAN register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +UNTIL_COMPARED_REGISTER_IS_LOWER
}
!macro UNTIL_REGISTER_IS_GREATER_OR_EQUAL_THAN register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +UNTIL_COMPARED_REGISTER_IS_GREATER_OR_EQUAL
}

!macro UNTILFAR_REGISTER_IS_EQUAL_TO register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +UNTILFAR_COMPARED_REGISTER_IS_EQUAL
}
!macro UNTILFAR_REGISTER_IS_NOT_EQUAL_TO register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +UNTILFAR_COMPARED_REGISTER_IS_NOT_EQUAL
}
!macro UNTILFAR_REGISTER_IS_LOWER_THAN register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +UNTILFAR_COMPARED_REGISTER_IS_LOWER
}
!macro UNTILFAR_REGISTER_IS_GREATER_OR_EQUAL_THAN register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +UNTILFAR_COMPARED_REGISTER_IS_GREATER_OR_EQUAL
}

;---------------------------------------------------------------------
; UNTIL_VAR8
;---------------------------------------------------------------------

!macro UNTIL_VAR8_IS_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +UNTIL_FLAG_ZERO_SET
}
!macro UNTIL_VAR8_IS_NOT_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +UNTIL_FLAG_ZERO_CLEAR
}
!macro UNTIL_VAR8 addr_mode0, operand0, condition, addr_mode1, operand1 {
  !if condition = IS_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +UNTIL_COMPARED_REGISTER_IS_EQUAL
  } else if condition = IS_NOT_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +UNTIL_COMPARED_REGISTER_IS_NOT_EQUAL
  } else if condition = IS_LOWER_THAN {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +UNTIL_COMPARED_REGISTER_IS_LOWER
  } else if condition = IS_GREATER_OR_EQUAL_THAN {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +UNTIL_COMPARED_REGISTER_IS_GREATER_OR_EQUAL

   ; Swapped operand0 and operand1

  } else if condition = IS_LOWER_OR_EQUAL_THAN {
    +_L_D_A_ addr_mode1, operand1
    +_C_M_P_ addr_mode0, operand0
    +UNTIL_COMPARED_REGISTER_IS_GREATER_OR_EQUAL
  } else if condition = IS_GREATER_THAN {
    +_L_D_A_ addr_mode1, operand1
    +_C_M_P_ addr_mode0, operand0
    +UNTIL_COMPARED_REGISTER_IS_LOWER
  }
}

!macro UNTILFAR_VAR8_IS_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +UNTILFAR_FLAG_ZERO_SET
}
!macro UNTILFAR_VAR8_IS_NOT_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +UNTILFAR_FLAG_ZERO_CLEAR
}
!macro UNTILFAR_VAR8 addr_mode0, operand0, condition, addr_mode1, operand1 {
  !if condition = IS_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +UNTILFAR_COMPARED_REGISTER_IS_EQUAL
  } else if condition = IS_NOT_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +UNTILFAR_COMPARED_REGISTER_IS_NOT_EQUAL
  } else if condition = IS_LOWER_THAN {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +UNTILFAR_COMPARED_REGISTER_IS_LOWER
  } else if condition = IS_GREATER_OR_EQUAL_THAN {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +UNTILFAR_COMPARED_REGISTER_IS_GREATER_OR_EQUAL

   ; Swapped operand0 and operand1

  } else if condition = IS_LOWER_OR_EQUAL_THAN {
    +_L_D_A_ addr_mode1, operand1
    +_C_M_P_ addr_mode0, operand0
    +UNTILFAR_COMPARED_REGISTER_IS_GREATER_OR_EQUAL
  } else if condition = IS_GREATER_THAN {
    +_L_D_A_ addr_mode1, operand1
    +_C_M_P_ addr_mode0, operand0
    +UNTILFAR_COMPARED_REGISTER_IS_LOWER
  }
}

;---------------------------------------------------------------------
; UNTIL_VAR16
;---------------------------------------------------------------------

!macro UNTIL_VAR16_IS_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +OR_A_HI addr_mode, operand
  +UNTIL_FLAG_ZERO_SET
}
!macro UNTIL_VAR16_IS_NOT_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +OR_A_HI addr_mode, operand
  +UNTIL_FLAG_ZERO_CLEAR
}
!macro UNTIL_VAR16 addr_mode0, operand0, condition, addr_mode1, operand1 {

  !if condition = IS_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    bne _L_O_O_P_L_V_L_1_

    +_L_D_A_H_I_ addr_mode0, operand0
    !if addr_mode1<=IMM16 {
      +_C_M_P_H_I_ addr_mode1, operand1
      ; otherwise ommit compare, it is 8-Bit -> if it is 0 (bne) then its fine
    }
    bne _L_O_O_P_L_V_L_1_

  } else if condition = IS_NOT_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    bne ._l_

    +_L_D_A_H_I_ addr_mode0, operand0
    !if addr_mode1<=IMM16 {
      +_C_M_P_H_I_ addr_mode1, operand1
      ; otherwise ommit compare, it is 8-Bit -> if it is 0 (bne) then its fine
    }
    beq _L_O_O_P_L_V_L_1_
    ._l_

  } else if condition = IS_LOWER_THAN {
    +CMP16 addr_mode0, operand0, addr_mode1, operand1
    bcs _L_O_O_P_L_V_L_1_

  } else if condition = IS_LOWER_OR_EQUAL_THAN {
    +CMP16X addr_mode0, operand0, addr_mode1, operand1
    bcc _L_O_O_P_L_V_L_1_

  } else if condition = IS_GREATER_THAN {
    +CMP16X addr_mode0, operand0, addr_mode1, operand1
    bcs _L_O_O_P_L_V_L_1_

  } else if condition = IS_GREATER_OR_EQUAL_THAN {
    +CMP16 addr_mode0, operand0, addr_mode1, operand1
    bcc _L_O_O_P_L_V_L_1_

  }

  +_P_O_P_L_O_O_P_

}

!macro UNTILFAR_VAR16_IS_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +OR_A_HI addr_mode, operand
  +UNTILFAR_FLAG_ZERO_SET
}
!macro UNTILFAR_VAR16_IS_NOT_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +OR_A_HI addr_mode, operand
  +UNTILFAR_FLAG_ZERO_CLEAR
}
!macro UNTILFAR_VAR16 addr_mode0, operand0, condition, addr_mode1, operand1 {

  !if condition = IS_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +JNE _L_O_O_P_L_V_L_1_

    +_L_D_A_H_I_ addr_mode0, operand0
    !if addr_mode1<=IMM16 {
      +_C_M_P_H_I_ addr_mode1, operand1
      ; otherwise ommit compare, it is 8-Bit -> if it is 0 (bne) then its fine
    }
    +JNE _L_O_O_P_L_V_L_1_

  } else if condition = IS_NOT_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    bne ._l_

    +_L_D_A_H_I_ addr_mode0, operand0
    !if addr_mode1<=IMM16 {
      +_C_M_P_H_I_ addr_mode1, operand1
      ; otherwise ommit compare, it is 8-Bit -> if it is 0 (bne) then its fine
    }
    +JEQ _L_O_O_P_L_V_L_1_
    ._l_

  } else if condition = IS_LOWER_THAN {
    +CMP16 addr_mode0, operand0, addr_mode1, operand1
    +JCS _L_O_O_P_L_V_L_1_

  } else if condition = IS_LOWER_OR_EQUAL_THAN {
    +CMP16X addr_mode0, operand0, addr_mode1, operand1
    +JCC _L_O_O_P_L_V_L_1_

  } else if condition = IS_GREATER_THAN {
    +CMP16X addr_mode0, operand0, addr_mode1, operand1
    +JCS _L_O_O_P_L_V_L_1_

  } else if condition = IS_GREATER_OR_EQUAL_THAN {
    +CMP16 addr_mode0, operand0, addr_mode1, operand1
    +JCC _L_O_O_P_L_V_L_1_

  }

  +_P_O_P_L_O_O_P_

}

;*********************************************************************
; ENDLOOP/ENDBLOCK
;*********************************************************************

!macro ENDLOOP {
  jmp _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro ENDBLOCK {
  +_P_O_P_L_O_O_P_
}

;===============================================================================
; FOR ... NEXT
;===============================================================================

;*********************************************************************
; FOR_X, FOR_Y
;*********************************************************************

!macro FOR_X start_addr_mode, start_operand {
  !if start_addr_mode=XREG {
    ; do nothing
  } else if start_addr_mode=AREG {
    tax
  } else if start_addr_mode=YREG {
    tya
    tax
  } else {
    +_L_D_X_ start_addr_mode, start_operand
  }
  +_P_U_S_H_L_O_O_P_ *
}
!macro NEXT_UNTIL_X_DOWNTO_ZERO {
  dex
  bne _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXT_UNTIL_X_DOWNTO_MINUS {
  dex
  bpl _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXT_UNTIL_X_UPTO_ZERO {
  inx
  bne _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXT_UNTIL_X_UPTO_MINUS {
  inx
  bpl _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXT_UNTIL_X_DOWNTO end_addr_mode, end_operand {
  dex
  +_C_P_X_ end_addr_mode, end_operand
  bne _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXT_UNTIL_X_UPTO end_addr_mode, end_operand {
  inx
  +_C_P_X_ end_addr_mode, end_operand
  bne _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}

!macro FOR_Y start_addr_mode, start_operand {
  !if start_addr_mode=YREG {
    ; do nothing
  } else if start_addr_mode=AREG {
    tay
  } else if start_addr_mode=XREG {
    tax
    tay
  } else {
    +_L_D_Y_ start_addr_mode, start_operand
  }
  +_P_U_S_H_L_O_O_P_ *
}
!macro NEXT_UNTIL_Y_DOWNTO_ZERO {
  dey
  bne _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXT_UNTIL_Y_DOWNTO_MINUS {
  dey
  bpl _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXT_UNTIL_Y_UPTO_ZERO {
  iny
  bne _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXT_UNTIL_Y_UPTO_MINUS {
  iny
  bpl _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXT_UNTIL_Y_DOWNTO end_addr_mode, end_operand {
  dey
  +_C_P_Y_ end_addr_mode, end_operand
  bne _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXT_UNTIL_Y_UPTO end_addr_mode, end_operand {
  iny
  +_C_P_Y_ end_addr_mode, end_operand
  bne _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}

!macro NEXTFAR_UNTIL_X_DOWNTO_ZERO {
  dex
  +JNE _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXTFAR_UNTIL_X_DOWNTO_MINUS {
  dex
  +JPL bpl _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXTFAR_UNTIL_X_UPTO_ZERO {
  inx
  +JNE _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXTFAR_UNTIL_X_UPTO_MINUS {
  inx
  +JPL bpl _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXTFAR_UNTIL_X_DOWNTO end_addr_mode, end_operand {
  dex
  +_C_P_X_ end_addr_mode, end_operand
  +JNE _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXTFAR_UNTIL_X_UPTO end_addr_mode, end_operand {
  inx
  +_C_P_X_ end_addr_mode, end_operand
  +JNE _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}

!macro NEXTFAR_UNTIL_Y_DOWNTO_ZERO {
  dey
  +JNE _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXTFAR_UNTIL_Y_DOWNTO_MINUS {
  dey
  +JPL _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXTFAR_UNTIL_Y_UPTO_ZERO {
  iny
  +JNE _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXTFAR_UNTIL_Y_UPTO_MINUS {
  iny
  +JPL _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXTFAR_UNTIL_Y_DOWNTO end_addr_mode, end_operand {
  dey
  +_C_P_Y_ end_addr_mode, end_operand
  +JNE _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXTFAR_UNTIL_Y_UPTO end_addr_mode, end_operand {
  iny
  +_C_P_Y_ end_addr_mode, end_operand
  +JNE _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}

;*********************************************************************
; FOR_VAR8
;*********************************************************************

!macro FOR_VAR8 loopvar_addr_mode, loop_operand, start_addr_mode, start_operand {
  +LET8 loopvar_addr_mode, loop_operand, start_addr_mode, start_operand
  +_P_U_S_H_L_O_O_P_ *
}

;*********************************************************************
; NEXT_UNTIL_VAR8
;*********************************************************************

!macro NEXT_UNTIL_VAR8_DOWNTO_ZERO loopvar_addr_mode, loopvar_operand {
  +_D_E_C_ loopvar_addr_mode, loopvar_operand
  bne _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXT_UNTIL_VAR8_DOWNTO_ZERO_STEP loop_addr_mode, loopvar_operand, step_addr_mode, step_operand {
  +SUB8 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  bne _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}

!macro NEXT_UNTIL_VAR8_UPTO_ZERO loop_addr_mode, loopvar_operand {
  +_I_N_C_ loopvar_addr_mode, loopvar_operand
  bne _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXT_UNTIL_VAR8_UPTO_ZERO_STEP loop_addr_mode, loopvar_operand, step_addr_mode, step_operand {
  +ADD8 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  bne _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}

!macro NEXT_UNTIL_VAR8_DOWNTO loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand {
  +_D_E_C_ loopvar_addr_mode, loopvar_operand
  +UNTIL_VAR8 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}
!macro NEXT_UNTIL_VAR8_DOWNTO_STEP loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand, step_addr_mode, step_operand {
  +SUB8 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +UNTIL_VAR8 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}

!macro NEXT_UNTIL_VAR8_UPTO loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand {
  +_I_N_C_ loopvar_addr_mode, loopvar_operand
  +UNTIL_VAR8 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}
!macro NEXT_UNTIL_VAR8_UPTO_STEP loopvar_addr_mode, loopvar_operand, end_addr_mode, end_operand, step_addr_mode, step_operand {
  +ADD8 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +UNTIL_VAR8 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}

; -----------------------------

!macro NEXTFAR_UNTIL_VAR8_DOWNTO_ZERO loopvar_addr_mode, loopvar_operand {
  +_D_E_C_ loopvar_addr_mode, loopvar_operand
  +JNE _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXTFAR_UNTIL_VAR8_DOWNTO_ZERO_STEP loop_addr_mode, loopvar_operand, step_addr_mode, step_operand {
  +SUB8 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +JNE _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}

!macro NEXTFAR_UNTIL_VAR8_UPTO_ZERO loop_addr_mode, loopvar_operand {
  +_I_N_C_ loopvar_addr_mode, loopvar_operand
  +JNE _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}
!macro NEXTFAR_UNTIL_VAR8_UPTO_ZERO_STEP loop_addr_mode, loopvar_operand, step_addr_mode, step_operand {
  +ADD8 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +JNE _L_O_O_P_L_V_L_1_
  +_P_O_P_L_O_O_P_
}

!macro NEXTFAR_UNTIL_VAR8_DOWNTO loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand {
  +_D_E_C_ loopvar_addr_mode, loopvar_operand
  +UNTILFAR_VAR8 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}
!macro NEXTFAR_UNTIL_VAR8_DOWNTO_STEP loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand, step_addr_mode, step_operand {
  +SUB8 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +UNTILFAR_VAR8 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}

!macro NEXTFAR_UNTIL_VAR8_UPTO loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand {
  +_I_N_C_ loopvar_addr_mode, loopvar_operand
  +UNTILFAR_VAR8 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}
!macro NEXTFAR_UNTIL_VAR8_UPTO_STEP loopvar_addr_mode, loopvar_operand, end_addr_mode, end_operand, step_addr_mode, step_operand {
  +ADD8 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +UNTILFAR_VAR8 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}

;*********************************************************************
; FOR_VAR16
;*********************************************************************

!macro FOR_VAR16 loopvar_addr_mode, loopvar_operand, start_addr_mode, start_operand {
  +LET16 loopvar_addr_mode, loopvar_operand, start_addr_mode, start_operand
  +_P_U_S_H_L_O_O_P_ *
}

;*********************************************************************
; NEXT_UNTIL_VAR16
;*********************************************************************

!macro NEXT_UNTIL_VAR16_DOWNTO_ZERO loopvar_addr_mode, loopvar_operand {
  +DEC16 loopvar_addr_mode, loopvar_operand
  +UNTIL_VAR16_IS_ZERO loopvar_addr_mode, loopvar_operand
}
!macro NEXT_UNTIL_VAR16_DOWNTO_ZERO_STEP loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand {
  +SUB16 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +UNTIL_VAR16_IS_ZERO loopvar_addr_mode, loopvar_operand
}

!macro NEXT_UNTIL_VAR16_UPTO_ZERO loopvar_addr_mode, loopvar_operand {
  +INC16 loopvar_addr_mode, loopvar_operand
  +UNTIL_VAR16_IS_ZERO loopvar_addr_mode, loopvar_operand
}
!macro NEXT_UNTIL_VAR16_UPTO_ZERO_STEP loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand {
  +ADD16 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +UNTIL_VAR16_IS_ZERO loopvar_addr_mode, loopvar_operand
}

!macro NEXT_UNTIL_VAR16_DOWNTO loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand {
  +DEC16 loopvar_addr_mode, loopvar_operand
  +UNTIL_VAR16 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}
!macro NEXT_UNTIL_VAR16_DOWNTO_STEP loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand, step_addr_mode, step_operand {
  +SUB16 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +UNTIL_VAR16 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}

!macro NEXT_UNTIL_VAR16_UPTO loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand {
  +INC16 loopvar_addr_mode, loopvar_operand
  +UNTIL_VAR16 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}
!macro NEXT_UNTIL_VAR16_UPTO_STEP loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand, step_addr_mode, step_operand {
  +ADD16 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +UNTIL_VAR16 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}

; -----------------------------

!macro NEXTFAR_UNTIL_VAR16_DOWNTO_ZERO loopvar_addr_mode, loopvar_operand {
  +DEC16 loopvar_addr_mode, loopvar_operand
  +UNTILFAR_VAR16_IS_ZERO loopvar_addr_mode, loopvar_operand
}
!macro NEXTFAR_UNTIL_VAR16_DOWNTO_ZERO_STEP loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand {
  +SUB16 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +UNTIL_VAR16_IS_ZERO loopvar_addr_mode, loopvar_operand
}

!macro NEXTFAR_UNTIL_VAR16_UPTO_ZERO loopvar_addr_mode, loopvar_operand {
  +INC16 loopvar_addr_mode, loopvar_operand
  +UNTIL_VAR16_IS_ZERO loopvar_addr_mode, loopvar_operand
}
!macro NEXTFAR_UNTIL_VAR16_UPTO_ZERO_STEP loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand {
  +ADD16 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +UNTIL_VAR16_IS_ZERO loopvar_addr_mode, loopvar_operand
}

!macro NEXTFAR_UNTIL_VAR16_DOWNTO loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand {
  +DEC16 loopvar_addr_mode, loopvar_operand
  +UNTILFAR_VAR16 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}
!macro NEXTFAR_UNTIL_VAR16_DOWNTO_STEP loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand, step_addr_mode, step_operand {
  +SUB16 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +UNTILFAR_VAR16 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}

!macro NEXTFAR_UNTIL_VAR16_UPTO loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand {
  +INC16 loopvar_addr_mode, loopvar_operand
  +UNTILFAR_VAR16 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}
!macro NEXTFAR_UNTIL_VAR16_UPTO_STEP loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand, step_addr_mode, step_operand {
  +ADD16 loopvar_addr_mode, loopvar_operand, loopvar_addr_mode, loopvar_operand, step_addr_mode, step_operand
  +UNTILFAR_VAR16 loopvar_addr_mode, loopvar_operand, condition, end_addr_mode, end_operand
}

