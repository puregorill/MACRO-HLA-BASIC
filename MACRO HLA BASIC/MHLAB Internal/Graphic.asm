;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; GRAPHIC
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

!macro CHARMEM position {
  lda $d018 ; 53272
  and #%11110000
  ora #(position*2)
  sta $d018  
}
;-------------------------------------------------------------------------------------------------
; "position" | and | bits     | charmem address + current VIC bank
;  in $d018  |     |          | hex        dez
;-------------------------------------------------------------------------------------------------
; 0          |  0  | xxxx000x | $0000      0
; 1          |  2  | xxxx001x | $0800      2048
; 2          |  4  | xxxx010x | $1000      4096  ROM Image in Bank 0 & 2 (default: UpGfx CharSet)
; 3          |  6  | xxxx011x | $1800      6144  ROM Image in Bank 0 & 2 (LoUp CharSet)
; 4          |  8  | xxxx100x | $2000      8192
; 5          | 10  | xxxx101x | $2800     10240
; 6          | 12  | xxxx110x | $3000     12288
; 7          | 14  | xxxx111x | $3800     14336
;-------------------------------------------------------------------------------------------------
; position is relative to VIC bank

!macro COPYCHARROM vic_bank, position {

  ; _T_M_P_0_=(vic_bank*$4000)+(position*2048)
  ; _T_M_P_1_=_T_M_P_0_+2047
  
  +MEMORYCONFIG MEMORYCONFIG_BASIC_CHARROM_KERNAL, AREG, 1

  ; Number of bytes to copy + 256    
  ldy #<(4096+256)
  ldx #>(4096+256)
    
  ; Source position ENDaddress + 1 (CHARACTER ROM)
  +LET16 ABS16, 90, IMM16, $E000 ; $DFFF+1

  ; Target position ENDaddress + 1
  +LET16 ABS16, 88, IMM16, (vic_bank*$4000)+(position*2048)+4096
  
  ; Calls BASIC ROM Routine to copy bytes
  jsr $a3f3
  
  +MEMORYCONFIG MEMORYCONFIG_DEFAULT_BASIC_IO_KERNAL, AREG, 1 
  
}
;---------------------------------------------
; "vic_bank" | and | bits     | address
;  in $dd00  |     |          | 
;---------------------------------------------
; 0          |     | xxxxxx11 | $0000-$3fff
; 1          |     | xxxxxx10 | $4000-$7fff
; 2          |     | xxxxxx01 | $8000-$bfff
; 3          |     | xxxxxx00 | $c000-$ffff
;---------------------------------------------
; "position" is the same as in CHARMEM

!macro VICBANK vic_bank {  
  lda $dd00
  and #%11111100
  !if vic_bank=3 {
    ora #%00000000
  } else if vic_bank=1 {
    ora #%00000010 
  } else if vic_bank=2 {
    ora #%00000001 ; (with CHARMEM image)
  } else {
    ora #%00000011 ; default bank 0 (with CHARMEM image)

  }
  sta $dd00
}
; "vic_bank" is the same as in COPYCHARROM

