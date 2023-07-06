;******************************************************************************
;  MacroHLA: MEMORY (do not change)
;******************************************************************************

;---------------------------------------------------------------------
; BASIC START LINE WITH SYS
;---------------------------------------------------------------------

!macro BASIC_SYS_LINE basic_start_address, line_number, use_COLON, use_REM, text {

  *=basic_start_address

  !word .__M_H_L_A__l_i_n_k__             ; Link bytes
  !word  line_number                      ; Line number
  !byte  $9E                              ; "SYS" Token
  .__M_H_L_A__S_Y_S___t_a_r_g_e_t__ = *
  !text  "0000"                           ; Placeholder
  !if use_COLON = TRUE {
    !text ":"
  }
  !if use_REM = TRUE {
    !byte $8F                             ; "REM" Token
  }
  !text text

.__M_H_L_A__l_i_n_k__:
  !byte  0,0,0                            ; end of basic line (3*zero)

  ; now refit the __M_H_L_A__S_Y_S___t_a_r_g_e_t__

  .__M_H_L_A__c_u_r_r_e_n_t__P_C__ = *
   * = .__M_H_L_A__S_Y_S___t_a_r_g_e_t__

  .__M_H_L_A__t_h_o_u_s_a_n_d_s__ = (.__M_H_L_A__c_u_r_r_e_n_t__P_C__)/1000
  .__M_H_L_A__h_u_n_d_r_e_d_s__ = (.__M_H_L_A__c_u_r_r_e_n_t__P_C__-.__M_H_L_A__t_h_o_u_s_a_n_d_s__*1000)/100
  .__M_H_L_A__t_e_n_t_h_s__ = (.__M_H_L_A__c_u_r_r_e_n_t__P_C__-.__M_H_L_A__t_h_o_u_s_a_n_d_s__*1000-.__M_H_L_A__h_u_n_d_r_e_d_s__*100)/10
  .__M_H_L_A__o_n_e_s__ = (.__M_H_L_A__c_u_r_r_e_n_t__P_C__-.__M_H_L_A__t_h_o_u_s_a_n_d_s__*1000-.__M_H_L_A__h_u_n_d_r_e_d_s__*100-.__M_H_L_A__t_e_n_t_h_s__*10)

  !text "0"+.__M_H_L_A__t_h_o_u_s_a_n_d_s__
  !text "0"+.__M_H_L_A__h_u_n_d_r_e_d_s__
  !text "0"+.__M_H_L_A__t_e_n_t_h_s__
  !text "0"+.__M_H_L_A__o_n_e_s__

  *=.__M_H_L_A__c_u_r_r_e_n_t__P_C__

  ;!message "1000  = ",.__M_H_L_A__t_h_o_u_s_a_n_d_s__
  ;!message "100   = ",.__M_H_L_A__h_u_n_d_r_e_d_s__
  ;!message "10    = ",.__M_H_L_A__t_e_n_t_h_s__
  ;!message "1     = ",.__M_H_L_A__o_n_e_s__
  ;!message "link  = ",.__M_H_L_A__c_u_r_r_e_n_t__P_C__

}


!macro MEMORYCONFIG memoryconfig, use_register, set_interrupt {

  !if memoryconfig<>MEMORYCONFIG_DEFAULT_BASIC_IO_KERNAL & set_interrupt=1 {
    sei
  }
  
  !if use_register=AREG {
    lda #memoryconfig
    sta $01
  } else if use_register=XREG {
    ldx #memoryconfig
    stx $01
  } else {
    ldy #memoryconfig
    sty $01
  }
  
  !if memoryconfig=MEMORYCONFIG_DEFAULT_BASIC_IO_KERNAL & set_interrupt=1 {
    cli
  }

}
;---------------------------------------------------------------------
; "memoryconfig"
;---------------------------------------------------------------------

; The mappings from combining these 3 bits are listed below. 
; Higher bits of location $01 are used for other purposes and default to %00110xxx.

                                         ; ----------------------------------------------------------
                                         ; $01 value     $A000-BFFF  $D000-DFFF  $E000-FFFF   Notes
                                         ; ----------------------------------------------------------
MEMORYCONFIG_ALLRAM=$30                  ; $30 +48 %000      RAM         RAM         RAM
MEMORYCONFIG_RAM_CHARROM_RAM=$31         ; $31 +49 %001      RAM       CHARROM       RAM
MEMORYCONFIG_RAM_CHARROM_KERNAL=$32      ; $32 +50 %010      RAM       CHARROM      KERNAL
MEMORYCONFIG_BASIC_CHARROM_KERNAL=$33    ; $33 +51 %011     BASIC      CHARROM      KERNAL
MEMORYCONFIG_ALLRAM2=$34                 ; $34 +52 %100      RAM         RAM         RAM
MEMORYCONFIG_RAM_IO_RAM=$35              ; $35 +53 %101      RAM         I/O         RAM    
MEMORYCONFIG_RAM_IO_KERNAL=$36           ; $36 +54 %110      RAM         I/O        KERNAL
MEMORYCONFIG_DEFAULT_BASIC_IO_KERNAL=$37 ; $37 +55 %111     BASIC        I/O        KERNAL   Default

; *WARNING*: Don't use INC $01 to switch modes from %111 to %000, as that will turn on the tape write head
;            on the next bit up and do bad/unintentional things if there's stuff attached to the tape port.

; *CAREFUL*: set "sei" if you are using non default configurations (and maybe "cli" when default again)

;---------------------------------------------------------------------
; "use_register": "AREG" or "XREG" or "YREG"
;---------------------------------------------------------------------

;---------------------------------------------------------------------
; "set_interrupt": 1 = use "sei", "sei", 0 = don't
;---------------------------------------------------------------------

