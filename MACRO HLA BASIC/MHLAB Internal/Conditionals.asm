;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; IF, JUMPS
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;*********************************************************************
; FAR JUMPS
;*********************************************************************

!macro JCS address {
   bcc ._l_
   jmp address
   ._l_
}
!macro JCC address {
   bcs ._l_
   jmp address
   ._l_
}
!macro JEQ address {
   bne ._l_
   jmp address
   ._l_
}
!macro JNE address {
   beq ._l_
   jmp address
   ._l_
}
!macro JMI address {
   bpl ._l_
   jmp address
   ._l_
}
!macro JPL address {
   bmi ._l_
   jmp address
   ._l_
}
!macro JVS address {
   bvc ._l_
   jmp address
   ._l_
}
!macro JVC address {
   bvs ._l_
   jmp address
   ._l_
}

;*********************************************************************
; IF helpers
;*********************************************************************

!macro _P_U_S_H_I_F_ first_branch, second_branch, is_far {
  +_P_U_S_H_I_F_F_I_R_S_T_ first_branch
  +_P_U_S_H_I_F_S_E_C_O_N_D_ second_branch
  +_P_U_S_H_I_F_I_S_F_A_R_ is_far
}

;*********************************************************************
; IF_FLAG
;*********************************************************************

!macro IF_FLAG_ZERO_SET {
  bne *
  +_P_U_S_H_I_F_ *,0,0
}
!macro IF_FLAG_ZERO_CLEAR {
  beq *
  +_P_U_S_H_I_F_ *,0,0
}
!macro IF_FLAG_CARRY_SET {
  bcc *
  +_P_U_S_H_I_F_ *,0,0
  }
!macro IF_FLAG_CARRY_CLEAR {
  bcs *
  +_P_U_S_H_I_F_ *,0,0
  }
!macro IF_FLAG_OVERFLOW_CLEAR {
  bvs *
  +_P_U_S_H_I_F_ *,0,0
  }
!macro IF_FLAG_OVERFLOW_SET {
  bvc *
  +_P_U_S_H_I_F_ *,0,0
  }
!macro IF_FLAG_NEGATIVE_SET {
  bpl *
  +_P_U_S_H_I_F_ *,0,0
  }
!macro IF_FLAG_NEGATIVE_CLEAR {
  bmi *
  +_P_U_S_H_I_F_ *,0,0
  }
!macro IF_FLAG_POSITIVE {
  +IF_FLAG_NEGATIVE_CLEAR
}

!macro IFFAR_FLAG_ZERO_SET {
  +JNE $0000
  +_P_U_S_H_I_F_ *,0,1
}
!macro IFFAR_FLAG_ZERO_CLEAR {
  +JEQ $0000
  +_P_U_S_H_I_F_ *,0,1
}
!macro IFFAR_FLAG_CARRY_SET {
  +JCC $0000
  +_P_U_S_H_I_F_ *,0,1
}
!macro IFFAR_FLAG_CARRY_CLEAR {
  +JCS $0000
  +_P_U_S_H_I_F_ *,0,1
}
!macro IFFAR_FLAG_OVERFLOW_CLEAR {
  +JVS $0000
  +_P_U_S_H_I_F_ *,0,1
}
!macro IFFAR_FLAG_OVERFLOW_SET {
  +JVC $0000
  +_P_U_S_H_I_F_ *,0,1
}
!macro IFFAR_FLAG_NEGATIVE_SET {
  +JPL $0000
  +_P_U_S_H_I_F_ *,0,1
}
!macro IFFAR_FLAG_NEGATIVE_CLEAR {
  +JMI $0000
  +_P_U_S_H_I_F_ *,0,1
}
!macro IFFAR_FLAG_POSITIVE {
  +IFFAR_FLAG_NEGATIVE_CLEAR
}

;*********************************************************************
; IF_COMPARED_REGISTER_IS
;*********************************************************************

!macro IF_COMPARED_REGISTER_IS_EQUAL {
  +IF_FLAG_ZERO_SET
}
!macro IF_COMPARED_REGISTER_IS_NOT_EQUAL {
  +IF_FLAG_ZERO_CLEAR
}
!macro IF_COMPARED_REGISTER_IS_LOWER {
  +IF_FLAG_CARRY_CLEAR
}
!macro IF_COMPARED_REGISTER_IS_GREATER_OR_EQUAL {
  +IF_FLAG_CARRY_SET
}

!macro IFFAR_COMPARED_REGISTER_IS_EQUAL {
  +IFFAR_FLAG_ZERO_SET
}
!macro IFFAR_COMPARED_REGISTER_IS_NOT_EQUAL {
  +IFFAR_FLAG_ZERO_CLEAR
}
!macro IFFAR_COMPARED_REGISTER_IS_LOWER {
  +IFFAR_FLAG_CARRY_CLEAR
}
!macro IFFAR_COMPARED_REGISTER_IS_GREATER_OR_EQUAL {
  +IFFAR_FLAG_CARRY_SET
}

;*********************************************************************
; IF_REGISTER_IS
;*********************************************************************

!macro IF_REGISTER_IS_EQUAL_TO register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +IF_COMPARED_REGISTER_IS_EQUAL
}
!macro IF_REGISTER_IS_NOT_EQUAL_TO register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +IF_COMPARED_REGISTER_IS_NOT_EQUAL
}
!macro IF_REGISTER_IS_LOWER_THAN register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +IF_COMPARED_REGISTER_IS_LOWER
}
!macro IF_REGISTER_IS_GREATER_OR_EQUAL_THAN register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +IF_COMPARED_REGISTER_IS_GREATER_OR_EQUAL
}

!macro IFFAR_REGISTER_IS_EQUAL_TO register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +IFFAR_COMPARED_REGISTER_IS_EQUAL
}
!macro IFFAR_REGISTER_IS_NOT_EQUAL_TO register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +IFFAR_COMPARED_REGISTER_IS_NOT_EQUAL
}
!macro IFFAR_REGISTER_IS_LOWER_THAN register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +IFFAR_COMPARED_REGISTER_IS_LOWER
}
!macro IFFAR_REGISTER_IS_GREATER_OR_EQUAL_THAN register, addr_mode, operand {
  +_C_M_P_R_E_G_ register, addr_mode, operand
  +IFFAR_COMPARED_REGISTER_IS_GREATER_OR_EQUAL
}

;*********************************************************************
; IF_VAR8
;*********************************************************************

!macro IF_VAR8_IS_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +IF_FLAG_ZERO_SET
}
!macro IF_VAR8_IS_NOT_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +IF_FLAG_ZERO_CLEAR
}
!macro IF_VAR8 addr_mode0, operand0, condition, addr_mode1, operand1 {
  !if condition = IS_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +IF_COMPARED_REGISTER_IS_EQUAL
  } else if condition = IS_NOT_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +IF_COMPARED_REGISTER_IS_NOT_EQUAL
  } else if condition = IS_LOWER_THAN {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +IF_COMPARED_REGISTER_IS_LOWER
  } else if condition = IS_GREATER_OR_EQUAL_THAN {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +IF_COMPARED_REGISTER_IS_GREATER_OR_EQUAL

   ; Swapped operand0 and operand1

  } else if condition = IS_LOWER_OR_EQUAL_THAN {
    +_L_D_A_ addr_mode1, operand1
    +_C_M_P_ addr_mode0, operand0
    +IF_COMPARED_REGISTER_IS_GREATER_OR_EQUAL
  } else if condition = IS_GREATER_THAN {
    +_L_D_A_ addr_mode1, operand1
    +_C_M_P_ addr_mode0, operand0
    +IF_COMPARED_REGISTER_IS_LOWER
  }
}

!macro IFFAR_VAR8_IS_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +IFFAR_FLAG_ZERO_SET
}
!macro IFFAR_VAR8_IS_NOT_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +IFFAR_FLAG_ZERO_CLEAR
}
!macro IFFAR_VAR8 addr_mode0, operand0, condition, addr_mode1, operand1 {
  !if condition = IS_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +IFFAR_COMPARED_REGISTER_IS_EQUAL
  } else if condition = IS_NOT_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
      +IFFAR_COMPARED_REGISTER_IS_NOT_EQUAL
  } else if condition = IS_LOWER_THAN {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +IFFAR_COMPARED_REGISTER_IS_LOWER
  } else if condition = IS_GREATER_OR_EQUAL_THAN {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    +IFFAR_COMPARED_REGISTER_IS_GREATER_OR_EQUAL

   ; Swapped operand0 and operand1:

  } else if condition = IS_LOWER_OR_EQUAL_THAN {
    +_L_D_A_ addr_mode1, operand1
    +_C_M_P_ addr_mode0, operand0
    +IFFAR_COMPARED_REGISTER_IS_GREATER_OR_EQUAL
  } else if condition = IS_GREATER_THAN {
    +_L_D_A_ addr_mode1, operand1
    +_C_M_P_ addr_mode0, operand0
    +IFFAR_COMPARED_REGISTER_IS_LOWER
  }
}

;*********************************************************************
; IF_VAR16
;*********************************************************************

!macro IF_VAR16_IS_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +OR_A_HI addr_mode, operand
  +IF_FLAG_ZERO_SET
}
!macro IF_VAR16_IS_NOT_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +OR_A_HI addr_mode, operand
  +IF_FLAG_ZERO_CLEAR
}
!macro IF_VAR16 addr_mode0, operand0, condition, addr_mode1, operand1 {

  ._s_c_n_d_=0

  !if condition = IS_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    bne *
    ._f_r_s_t_=*

    +_L_D_A_H_I_ addr_mode0, operand0
    !if addr_mode1<=IMM16 {
      +_C_M_P_H_I_ addr_mode1, operand1
      ; otherwise ommit compare, it is 8-Bit -> if it is 0 (bne) then its fine
    }
    bne *
    ._s_c_n_d_=*

  } else if condition = IS_NOT_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    bne ._l_0_

    +_L_D_A_H_I_ addr_mode0, operand0
    !if addr_mode1<=IMM16 {
      +_C_M_P_H_I_ addr_mode1, operand1
      ; otherwise ommit compare, it is 8-Bit -> if it is 0 (bne) then its fine
    }
    beq *
    ._f_r_s_t_=*
    ._l_0_

  } else if condition = IS_LOWER_THAN {
    +CMP16 addr_mode0, operand0, addr_mode1, operand1
    bcs *
    ._f_r_s_t_=*

  } else if condition = IS_LOWER_OR_EQUAL_THAN {
    +CMP16X addr_mode0, operand0, addr_mode1, operand1
    bcc *
    ._f_r_s_t_=*

  } else if condition = IS_GREATER_THAN {
    +CMP16X addr_mode0, operand0, addr_mode1, operand1
    bcs *
    ._f_r_s_t_=*

  } else if condition = IS_GREATER_OR_EQUAL_THAN {
    +CMP16 addr_mode0, operand0, addr_mode1, operand1
    bcc *
    ._f_r_s_t_=*

  }
  +_P_U_S_H_I_F_ ._f_r_s_t_,._s_c_n_d_,0
}

!macro IFFAR_VAR16_IS_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +OR_A addr_mode, operand+1
  +IFFAR_FLAG_ZERO_SET
}
!macro IFFAR_VAR16_IS_NOT_ZERO addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  +OR_A addr_mode, operand+1
  +IFFAR_FLAG_ZERO_CLEAR
}
!macro IFFAR_VAR16 addr_mode0, operand0, condition, addr_mode1, operand1 {

  ._s_c_n_d_=0

  !if condition = IS_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    bne ._l_0_

    +_L_D_A_H_I_ addr_mode0, operand0
    !if addr_mode1<=IMM16 {
      +_C_M_P_H_I_ addr_mode1, operand1
      ; otherwise ommit compare, it is 8-Bit -> if it is 0 (bne) then its fine
    }
    beq ._l_1_
    ._l_0_
    jmp $0000
    ._f_r_s_t_=*
    ._l_1_

  } else if condition = IS_NOT_EQUAL_TO {
    +_L_D_A_ addr_mode0, operand0
    +_C_M_P_ addr_mode1, operand1
    bne ._l_2_

    +_L_D_A_H_I_ addr_mode0, operand0
    !if addr_mode1<=IMM16 {
      +_C_M_P_H_I_ addr_mode1, operand1
      ; otherwise ommit compare, it is 8-Bit -> if it is 0 (bne) then its fine
    }
    +JEQ *
    ._f_r_s_t_=*
    ._l_2_

  } else if condition = IS_LOWER_THAN {
    +CMP16 addr_mode0, operand0, addr_mode1, operand1
    +JCS *
    ._f_r_s_t_=*

  } else if condition = IS_LOWER_OR_EQUAL_THAN {
    +CMP16X addr_mode0, operand0, addr_mode1, operand1
    +JCC *
    ._f_r_s_t_=*

  } else if condition = IS_GREATER_THAN {
    +CMP16X addr_mode0, operand0, addr_mode1, operand1
    +JCS *
    ._f_r_s_t_=*

  } else if condition = IS_GREATER_OR_EQUAL_THAN {
    +CMP16 addr_mode0, operand0, addr_mode1, operand1
    +JCS *
    ._f_r_s_t_=*

  }

  +_P_U_S_H_I_F_ ._f_r_s_t_,._s_c_n_d_,1
}

;*********************************************************************
; ELSE, ENDIF, ENDIFS
;*********************************************************************

!macro _E_N_D_I_F_ {
  !if _I_F_I_S_F_A_R_L_V_L_1_=0 {
    ._p_c_=*
    *=_I_F_F_I_R_S_T_L_V_L_1_-1
    !byte ._p_c_-_I_F_F_I_R_S_T_L_V_L_1_
    !if _I_F_S_E_C_O_N_D_L_V_L_1_>0 {
      *=_I_F_S_E_C_O_N_D_L_V_L_1_-1
      !byte ._p_c_-_I_F_S_E_C_O_N_D_L_V_L_1_
    }
    *=._p_c_
  } else {
    ._p_c_=*
    *=_I_F_F_I_R_S_T_L_V_L_1_-3
    jmp ._p_c_
    *=._p_c_
  }
  ; don't POP here, we need stack position in ELSE
}
!macro ELSE {
  jmp $0000
  +_E_N_D_I_F_
  _I_F_F_I_R_S_T_L_V_L_1_=*
  _I_F_S_E_C_O_N_D_L_V_L_1_=0
  _I_F_I_S_F_A_R_L_V_L_1_=1
}
!macro ENDIF {
  +_E_N_D_I_F_
  +_P_O_P_I_F_F_I_R_S_T_
  +_P_O_P_I_F_S_E_C_O_N_D_
  +_P_O_P_I_F_I_S_F_A_R_
}
!macro _E_N_D_I_F_S_ number {
  ; C64Studio shows the ._i_ in the menu of keywords
  !for ._i_=1 to number
    +_E_N_D_I_F_
    +_P_O_P_I_F_F_I_R_S_T_
    +_P_O_P_I_F_S_E_C_O_N_D_
    +_P_O_P_I_F_I_S_F_A_R_
  !end
}
!macro ENDIFS number {
  +_E_N_D_I_F_S_ number
  ; C64Studio shows the ._i_ in the menu of keywords  
}
!macro _E_L_S_E_S_ number {
  ; C64Studio shows the ._i_ in the menu of keywords
  jmp $0000
  !for ._i_=1 to number
    +_E_N_D_I_F_
    +_P_O_P_I_F_F_I_R_S_T_
    +_P_O_P_I_F_S_E_C_O_N_D_
    +_P_O_P_I_F_I_S_F_A_R_
  !end
  +_P_U_S_H_I_F_ *, 0, 1
}

!macro ELSES number {
  +_E_L_S_E_S_ number
  ; C64Studio shows the ._i_ in the menu of keywords
}

;*********************************************************************
; OR_TRUE, ENDOR
;*********************************************************************

; BROKEN --- DOES NOT WORK

!macro ENDORS number {
  jmp ._l_
  +ENDIFS number
  jmp $0000
  +  +_P_U_S_H_I_F_ *,0,1
  ._l_
}

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; SELECT CASE
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

!macro SELECT_REGISTER register {
  _S_E_L_E_C_T_R_E_G_=register
  _S_E_L_N_O_=0
  +_C_L_R_S_E_L_E_C_T_
}
!macro SELECT_VAR8 addr_mode, operand {
  +_L_D_A_ addr_mode, operand
  _S_E_L_E_C_T_R_E_G_=AREG
  _S_E_L_N_O_=0
  +_C_L_R_S_E_L_E_C_T_
}
!macro CASE_IS_ZERO {
  ; CASE_ZERO is only allowed as first (!) CASE statement !!!
  _C_A_S_E_A_D_D_R_=*
  bne *
  _S_E_L_N_O_=_S_E_L_N_O_+1
}
!macro CASE addr_mode, operand {
  !if _S_E_L_N_O_<>0 {
    +_P_U_S_H_S_E_L_E_C_T_ *
    jmp $0000
    ._p_c_=*
    *=_C_A_S_E_A_D_D_R_
    bne ._p_c_
    *=._p_c_
  }
  +_C_M_P_R_E_G_ _S_E_L_E_C_T_R_E_G_, addr_mode, operand
  _C_A_S_E_A_D_D_R_=*
  bne *
  _S_E_L_N_O_=_S_E_L_N_O_+1
}
!macro ENDSELECT {
  !if _C_A_S_E_A_D_D_R_<>0 {
    ._p_c_=*
    *=_C_A_S_E_A_D_D_R_
    bne ._p_c_
    *=._p_c_
  }
  !for ._i_=1 to _S_E_L_N_O_-1
    ._p_c_=*
    *=_S_E_L_E_C_T_L_V_L_1_
    jmp ._p_c_
    *=._p_c_
    +_P_O_P_S_E_L_E_C_T_
  !end
}
!macro DEFAULT {
  +_P_U_S_H_S_E_L_E_C_T_ *
  jmp $0000
  ._p_c_=*
  *=_C_A_S_E_A_D_D_R_
  bne ._p_c_
  *=._p_c_
  _C_A_S_E_A_D_D_R_=0
  _S_E_L_N_O_=_S_E_L_N_O_+1
}

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; ON GOTO/GOSUB
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;*********************************************************************
; ON_GOSUB (RAM only, uses self modifying code)
;*********************************************************************

; Jump table addresses MUST NOT be -1

!macro ON_GOSUB_VAR8 addr_mode, operand, jump_table_address {

  +_L_D_A_ addr_mode, operand
  asl
  tax

  ; --- Method: self modifying code ---

  lda jump_table_address,x
  sta ._j_+1
  lda jump_table_address+1,x
  sta ._j_+2
  ._j_
  jsr $0000

}
!macro ON_GOSUB_LH_VAR8 addr_mode, operand, jump_table_address_lo_bytes, jump_table_address_hi_bytes  {

  +_L_D_A_ addr_mode, operand
  tax

  ; --- Method: self modifying code ---

  lda jump_table_address_lo_bytes,x
  sta ._j_+1
  lda jump_table_address_hi_bytes,x
  sta ._j_+2
  ._j_
  jsr $0000

}

!macro ON_GOSUB_AREG jump_table_address {

  asl
  tax

  ; --- Method: self modifying code ---

  lda jump_table_address,x
  sta ._j_+1
  lda jump_table_address+1,x
  sta ._j_+2
  ._j_
  jsr $0000

}
!macro ON_GOSUB_LH_AREG jump_table_address_lo_bytes, jump_table_address_hi_bytes  {

  tax

  ; --- Method: self modifying code ---

  lda jump_table_address_lo_bytes,x
  sta ._j_+1
  lda jump_table_address_hi_bytes,x
  sta ._j_+2
  ._j_
  jsr $0000

}

!macro ON_GOSUB_XREG jump_table_address {

  txa
  asl
  tax

  ; --- Method: self modifying code ---

  lda jump_table_address,x
  sta ._j_+1
  lda jump_table_address+1,x
  sta ._j_+2
  ._j_
  jsr $0000

}
!macro ON_GOSUB_LH_XREG jump_table_address_lo_bytes, jump_table_address_hi_bytes  {

  ; --- Method: self modifying code ---

  lda jump_table_address_lo_bytes,x
  sta ._j_+1
  lda jump_table_address_hi_bytes,x
  sta ._j_+2
  ._j_
  jsr $0000

}

!macro ON_GOSUB_YREG jump_table_address {

  tya
  asl
  tay

  ; --- Method: self modifying code ---

  lda jump_table_address,y
  sta ._j_+1
  lda jump_table_address+1,y
  sta ._j_+2
  ._j_
  jsr $0000

}
!macro ON_GOSUB_LH_YREG jump_table_address_lo_bytes, jump_table_address_hi_bytes  {

  ; --- Method: self modifying code ---

  lda jump_table_address_lo_bytes,y
  sta ._j_+1
  lda jump_table_address_hi_bytes,y
  sta ._j_+2
  ._j_
  jsr $0000

}

;*********************************************************************
; ON_GOTO (usable for ROM, uses Wozniak's "rts" trick)
;*********************************************************************

; Needs jump table addresses -1

!macro ON_GOTO_VAR8 addr_mode, operand, jump_table_address {

  +_L_D_A_ addr_mode, operand
  asl
  tax

  ; --- Method: Wozniak's "rts" trick  ---

  lda jump_table_address+1,x
  pha
  lda jump_table_address,x
  pha
  rts

}
!macro ON_GOTO_LH_VAR8 addr_mode, operand, jump_table_address_lo_bytes, jump_table_address_hi_bytes {

  +_L_D_A_ addr_mode, operand
  tax

  ; --- Method: Wozniak's "rts" trick  ---

  lda jump_table_address_hi_bytes,x
  pha
  lda jump_table_address_lo_bytes,x
  pha
  rts

}

!macro ON_GOTO_AREG addr_mode, operand, jump_table_address {

  asl
  tax

  ; --- Method: Wozniak's "rts" trick  ---

  lda jump_table_address+1,x
  pha
  lda jump_table_address,x
  pha
  rts

}
!macro ON_GOTO_LH_AREG addr_mode, operand, jump_table_address_lo_bytes, jump_table_address_hi_bytes {

  tax

  ; --- Method: Wozniak's "rts" trick  ---

  lda jump_table_address_hi_bytes,x
  pha
  lda jump_table_address_lo_bytes,x
  pha
  rts

}

!macro ON_GOTO_XREG addr_mode, operand, jump_table_address {

  txa
  asl
  tax

  ; --- Method: Wozniak's "rts" trick  ---

  lda jump_table_address+1,x
  pha
  lda jump_table_address,x
  pha
  rts

}
!macro ON_GOTO_LH_XREG addr_mode, operand, jump_table_address_lo_bytes, jump_table_address_hi_bytes {

  ; --- Method: Wozniak's "rts" trick  ---

  lda jump_table_address_hi_bytes,x
  pha
  lda jump_table_address_lo_bytes,x
  pha
  rts

}

!macro ON_GOTO_YREG addr_mode, operand, jump_table_address {

  tya
  asl
  tay

  ; --- Method: Wozniak's "rts" trick  ---

  lda jump_table_address+1,y
  pha
  lda jump_table_address,y
  pha
  rts

}
!macro ON_GOTO_LH_YREG addr_mode, operand, jump_table_address_lo_bytes, jump_table_address_hi_bytes {

  ; --- Method: Wozniak's "rts" trick  ---

  lda jump_table_address_hi_bytes,y
  pha
  lda jump_table_address_lo_bytes,y
  pha
  rts

}



