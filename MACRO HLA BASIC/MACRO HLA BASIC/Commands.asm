;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; COMMANDS (low level)
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;*********************************************************************
; COMMANDS WITH ADDRESSING MODES
;*********************************************************************

;=====================================================================
; 8-BIT
;=====================================================================

;---------------------------------------------------------------------
; 8-bit LOAD, STORE, COMPARE, SBC ...
;---------------------------------------------------------------------

!macro _L_D_A_ addr_mode, operand {
  !if addr_mode=IMM8|addr_mode=IMM16 {
    lda #<(operand)
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    lda operand
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    lda operand,x
  } else if addr_mode=ABSY8|addr_mode=ABSY16 {
    lda operand,y
  } else if addr_mode=ZPINDY8|addr_mode=ZPINDY16 {
    lda (operand),y
  } else if addr_mode=ZPXIND8|addr_mode=ZPXIND16 {
    lda (operand,x)
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_L_D_A_' ****"
  }
}
!macro _L_D_A_H_I_ addr_mode, operand {
  !if addr_mode=IMM16 {
    lda #>(operand)
  } else if addr_mode=ABS16 {
    lda operand+1
  } else if addr_mode=ABSX16 {
    lda operand+1,x
  } else if addr_mode=ABSY16 {
    lda operand+1,y
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_L_D_A_H_I_' ****"
  }
}
!macro _L_D_X_ addr_mode, operand {
  !if addr_mode=IMM8|addr_mode=IMM16 {
    ldx #<(operand)
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    ldx operand
  } else if addr_mode=ABSY8|addr_mode=ABSY16 {
    ldx operand,y
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_L_D_X_' ****"
  }
}
!macro _L_D_Y_ addr_mode, operand {
  !if addr_mode=IMM8|addr_mode=IMM16 {
    ldy #<(operand)
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    ldy operand
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    ldy operand,x
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_L_D_Y_' ****"
  }
}

!macro _S_T_A_ addr_mode, operand {
  !if addr_mode=IMM8|addr_mode=IMM16 {
    sta #<(operand)
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    sta operand
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    sta operand,x
  } else if addr_mode=ABSY8|addr_mode=ABSY16 {
    sta operand,y
  } else if addr_mode=ZPINDY8|addr_mode=ZPINDY16 {
    sta (operand),y
  } else if addr_mode=ZPXIND8|addr_mode=ZPXIND16 {
    sta (operand,x)
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_S_T_A_' ****"
  }
}
!macro _S_T_A_H_I_ addr_mode, operand {
  !if addr_mode=IMM16 {
    sta #>(operand)
  } else if addr_mode=ABS16 {
    sta operand+1
  } else if addr_mode=ABSX16 {
    sta operand+1,x
  } else if addr_mode=ABSY16 {
    sta operand+1,y
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_S_T_A_H_I_' ****"
  }
}

;---------------------------------------------------------------------
; 8-bit COMPARE
;---------------------------------------------------------------------

!macro _C_M_P_ addr_mode, operand {
  !if addr_mode=IMM8|addr_mode=IMM16 {
    cmp #<(operand)
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    cmp operand
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    cmp operand,x
  } else if addr_mode=ABSY8|addr_mode=ABSY16 {
    cmp operand,y
  } else if addr_mode=ZPINDY8|addr_mode=ZPINDY16 {
    cmp (operand),y
  } else if addr_mode=ZPXIND8|addr_mode=ZPXIND16 {
    cmp (operand,x)
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_C_M_P_' ****"
  }
}
!macro _C_M_P_H_I_ addr_mode, operand {
  !if addr_mode=IMM8|addr_mode=IMM16 {
    cmp #>(operand)
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    cmp operand+1
  } else if addr_mode=ABSY8|addr_mode=ABSY16 {
    cmp operand+1,x
  } else if addr_mode=ABSY16 {
    cmp operand+1,y
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_C_M_P_H_I_' ****"
  }
}
!macro _C_P_X_ addr_mode, operand {
  !if addr_mode=IMM8|addr_mode=IMM16 {
    cpx #<(operand)
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    cpx operand
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_C_P_X_' ****"
  }
}
!macro _C_P_Y_ addr_mode, operand {
  !if addr_mode=IMM8|addr_mode=IMM16 {
    cpy #<(operand)
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    cpy operand
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_C_P_Y_' ****"
  }
}
!macro _C_M_P_R_E_G_ register, addr_mode, operand {
  !if register=AREG {
    +_C_M_P_ addr_mode, operand
  } else if register=XREG {
    +_C_P_X_ addr_mode, operand
  } else if register=YREG {
    +_C_P_Y_ addr_mode, operand
  } else {
    !error "**** ILLEGAL REGISTER IN '_C_M_P_R_E_G_' ****"
  }
}

;---------------------------------------------------------------------
; 8-bit ADDITION, SUBTRACTION
;---------------------------------------------------------------------

!macro ADD8_TO_A addr_mode, operand {
  clc
  !if addr_mode=IMM8|addr_mode=IMM16 {
    adc #operand
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    adc operand
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    adc operand,x
  } else if addr_mode=ABSY8|addr_mode=ABSY16 {
    adc operand,y
  } else if addr_mode=ZPINDY8|addr_mode=ZPINDY16 {
    adc (operand),y
  } else if addr_mode=ZPXIND8|addr_mode=ZPXIND16 {
    adc (operand,x)
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN 'ADD8_TO_A' ****"
  }
}
!macro ADD8_TO_A_HI addr_mode, operand {
  !if addr_mode=IMM8|addr_mode=IMM16 {
    adc #>(operand)
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    adc operand+1
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    adc operand+1,x
  } else if addr_mode=ABSY8|addr_mode=ABSY16 {
    adc operand+1,y
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN 'ADD8_TO_A_HI' ****"
  }
}
!macro SUB8_FROM_A addr_mode, operand {
  sec
  !if addr_mode=IMM8|addr_mode=IMM16 {
    sbc #<(operand)
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    sbc operand
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    sbc operand,x
  } else if addr_mode=ABSY8|addr_mode=ABSY16 {
    sbc operand,y
  } else if addr_mode=ZPINDY8|addr_mode=ZPINDY16 {
    sbc (operand),y
  } else if addr_mode=ZPXIND8|addr_mode=ZPXIND16 {
    sbc (operand,x)
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN 'SUB8_FROM_A' ****"
  }
}
!macro SUB8_FROM_A_HI addr_mode, operand {
  !if addr_mode=IMM8|addr_mode=IMM16 {
    sbc #>(operand)
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    sbc operand+1
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    sbc operand+1,x
  } else if addr_mode=ABSY8|addr_mode=ABSY16 {
    sbc operand+1,y
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN 'SUB_FROM_A_HI' ****"
  }
}

;---------------------------------------------------------------------
; 8-bit _I_N_C_EMENT, _D_E_C_EMENT
;---------------------------------------------------------------------

!macro _I_N_C_ addr_mode, operand {
   !if addr_mode=ABS8|addr_mode=ABS16 {
    inc operand
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    inc operand,x
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_I_N_C_' ****"
  }
}
!macro _I_N_C_H_I_ addr_mode, operand {
   !if addr_mode=ABS8|addr_mode=ABS16 {
    inc operand+1
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    inc operand+1,x
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_I_N_C_H_I_' ****"
  }
}

!macro _D_E_C_ addr_mode, operand {
   !if addr_mode=ABS8|addr_mode=ABS16 {
    dec operand
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    dec operand,x
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_D_E_C_' ****"
  }
}
!macro _D_E_C_H_I_ addr_mode, operand {
   !if addr_mode=ABS8|addr_mode=ABS16 {
    dec operand+1
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    dec operand+1,x
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN '_D_E_C_H_I_' ****"
  }
}

;---------------------------------------------------------------------
; 8-bit LOGICAL
;---------------------------------------------------------------------

!macro OR_A addr_mode, operand {
  !if addr_mode=IMM8|addr_mode=IMM16 {
    ora #<(operand)
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    ora operand
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    ora operand,x
  } else if addr_mode=ABSY8|addr_mode=ABSY16 {
    ora operand,y
  } else if addr_mode=ZPINDY8|addr_mode=ZPINDY16 {
    ora (operand),y
  } else if addr_mode=ZPXIND8|addr_mode=ZPXIND16 {
    ora (operand,x)
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN 'OR_A' ****"
  }
}
!macro OR_A_HI addr_mode, operand {
  !if addr_mode=IMM8|addr_mode=IMM16 {
    ora #>(operand)
  } else if addr_mode=ABS8|addr_mode=ABS16 {
    ora operand+1
  } else if addr_mode=ABSX8|addr_mode=ABSX16 {
    ora operand+1,x
  } else if addr_mode=ABSY8|addr_mode=ABSY16 {
    ora operand+1,y
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN 'OR_A_HI' ****"
  }
}

;=====================================================================
; 16-BIT
;=====================================================================

;---------------------------------------------------------------------
; 16-bit COMPARE
;---------------------------------------------------------------------

!macro CMP16 addr_mode0, operand0, addr_mode1, operand1 {
  ; works for <, >=
  ; NOT for =,<>

  ; LO-Bytes
  +_L_D_A_ addr_mode0, operand0
  +_C_M_P_ addr_mode1, operand1

  ; HI-Bytes
  !if addr_mode0>IMM16 { ; 8-bit
    lda #0
  } else {               ; 16-bit
    +_L_D_A_H_I_ addr_mode0, operand0
  }
  !if addr_mode0>IMM16 { ; 8-bit
    sbc #0
  } else {               ; 16-bit
    +SUB8_FROM_A_HI addr_mode1, operand1
  }

}
!macro CMP16X addr_mode0, operand0, addr_mode1, operand1 {
  ; works for >, <=
  ; NOT for =,<>
  ; crossed over (hence "X") operands to do the opposite comparisions
  +CMP16 addr_mode1, operand1, addr_mode0, operand0
}



