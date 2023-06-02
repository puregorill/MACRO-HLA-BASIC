;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; INPUT OUTPUT
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;*********************************************************************
; PRINT, SCREEN OUTPUT, SCREEN CONTROL
;*********************************************************************

!macro PRINTS string_addr_mode, string_address {
  !if string_addr_mode=ABSS {
    lda #<string_address
    ldy #>string_address
  } else if string_addr_mode=INDS {
    lda string_address
    ldy string_address+1
  } else if string_addr_mode=INDXS {
    lda string_address,x
    ldy string_address+1,x
  } else {
    !error "**** ERROR: NOT SUPPORTED STRING ADDRESSING MODE IN 'PRINT' ****"
  }
  jsr STROUT0
}
!macro PRINT string_address {
  lda #<string_address
  ldy #>string_address
  jsr STROUT0
}
!macro CLEAR_SCREEN {
  jsr _C_L_R_S_C_R_
}
!macro PRINTCHR addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  jsr CHROUT
}
!macro PRINTCR {
  lda #13
  jsr CHROUT
}
!macro PRINTNUM addr_mode, operand {
  !if addr_mode>IMM16 {
    ; ---- 8-Bit ----
    !if addr_mode=IMM8 {
      ldx #<(operand)
      lda #0
    } else if addr_mode=ABS8 {
      ldx operand
      lda #0
    } else if addr_mode=ABSX8 {
      lda operand,x
      txa
      lda #0
    } else if addr_mode=ABSY8 {
      ldx operand,y
      lda #0
    } else if addr_mode=ZPINDY8 {
      lda (operand),y
      tax
      lda #0
    } else if addr_mode=ZPXIND8 {
      lda (operand,x)
      tax
      lda #0
    } else {
      !error "**** ILLEGAL 8-BIT ADDRESSING MODE IN 'PRINTNUM' ****"
    }
  } else {
    ; ---- 16-Bit ----
    !if addr_mode=IMM16 {
      ldx #<(operand)
      lda #>(operand)
    } else if addr_mode=ABS16 {
      ldx operand
      lda operand+1
    } else if addr_mode=ABSX16 {
      lda operand,x
      txa
      lda operand+1,x
    } else if addr_mode=ABSY16 {
      ldx operand,y
      lda operand+1,y
    } else {
      !error "**** ILLEGAL 16-BIT ADDRESSING MODE IN 'PRINTNUM' ****"
    }
  }
  jsr INTOUT
}
!macro PRINTNUM_XREG {
  lda #0
  jsr INTOUT
}
!macro PRINTNUM_AREG {
  tax
  lda #0
  jsr INTOUT
}

!macro LOCATE addr_mode_xpos, xpos, addr_mode_ypos, ypos {
  ; yes, it is swapped x=ypos and y=xpos

  ; this needs more work!

  !if addr_mode_xpos=IMM8 {
    ldx #ypos
    ldy #xpos
  } else {
    !error "**** ILLEGAL ADDRESSING MODE IN 'LOCATE' ****"
  }
  clc
  jsr _S_E_T_C_U_R_
}