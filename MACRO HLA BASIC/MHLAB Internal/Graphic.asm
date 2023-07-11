;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; GRAPHIC
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

; Source: https://codebase64.org/doku.php?id=base:vicii_memory_organizing

; $D018/53272/VIC+24:   Memory Control Register

   ; +----------+-------------------------------------------------------------+
   ; | Bits 7-4 |   Screen Memory Base Address (relative to VIC bank)         |
   ; | Bit  3   |   Bitmap-Mode: Select Base Address (relative to VIC bank)   |
   ; | Bits 3-1 |   Character Dot-Data Base Address (relative to VIC bank)    |
   ; | Bit  0   |   Unused                                                    |
   ; +----------+-------------------------------------------------------------+

!macro CHARMEM charpos {
  lda $D018 ; 53272
  and #%11110000
  ora #(charpos*2)
  sta $D018  
}

;-------------------------------------------------------------------------------------------------
; "charpos" | ora | bits 3-1 | charmem address 
; in $D018  |     |          | Bank 0          | Bank 1       | Bank 2          | Bank 3
;-------------------------------------------------------------------------------------------------
; 0         |  0  | xxxx000x | $0000      0    | $4000  16384 | $8000  32768    | $C000  49152  
; 1         |  2  | xxxx001x | $0800   2048    | $4800  18432 | $8800  34816    | $C800  51200
; 2         |  4  | xxxx010x | $1000   4096 *1 | $5000  20480 | $9000  36864 *1 | $D000  53248 *3
; 3         |  6  | xxxx011x | $1800   6144 *2 | $5800  22528 | $9800  38912 *2 | $D800  55296 *4
; 4         |  8  | xxxx100x | $2000   8192    | $6000  24576 | $A000  40960 *B | $E000  57344 *K
; 5         | 10  | xxxx101x | $2800  10240    | $6800  26624 | $A800  43008 *B | $E800  59392 *K
; 6         | 12  | xxxx110x | $3000  12288    | $7000  28672 | $B000  45056 *B | $F000  61440 *K
; 7         | 14  | xxxx111x | $3800  14336    | $7800  30720 | $B800  47104 *B | $F800  63488 *K
;------------------------------------------------------------------------------------------------
; *1 CHARROM image in Bank 0 & 2 (default: UpGfx CharSet)
; *2 CHARROM image in Bank 0 & 2 (LoUp CharSet)
; *3 actual physical CHARACTER ROM/GENERATOR (default: UpGfx CharSet) (and I/0 Area)
; *4 actual physical CHARACTER ROM/GENERATOR (LoUp CharSet) (and I/0 Area)
; *B BASIC ROM
; *K KERNAL ROM

!macro COPYCHARROM vic_bank, charpos {

  +MEMORYCONFIG MEMORYCONFIG_BASIC_CHARROM_KERNAL, AREG, 1

  ; Number of bytes to copy + 256    
  ldy #<(4096+256)
  ldx #>(4096+256)
    
  ; Source charpos ENDaddress + 1 (CHARACTER ROM)
  +LET16 ABS16, 90, IMM16, $E000 ; $DFFF+1

  ; Target charpos ENDaddress + 1
  +LET16 ABS16, 88, IMM16, (vic_bank*$4000)+(charpos*2048)+4096
  
  ; Calls BASIC ROM Routine to copy bytes
  jsr $A3F3
  
  +MEMORYCONFIG MEMORYCONFIG_DEFAULT_BASIC_IO_KERNAL, AREG, 1 
  
}

;------------------------------------------------------------------
; "vic_bank" | ora | bits 1-0 | address
;  in $DD00  |     |          |
;------------------------------------------------------------------
; 0          |  3  | xxxxxx11 | $0000-$3FFF   with CHARROM image
; 1          |  2  | xxxxxx10 | $4000-$7FFF
; 2          |  1  | xxxxxx01 | $8000-$BFFF   with CHARROM image
; 3          |  0  | xxxxxx00 | $C000-$FFFF
;------------------------------------------------------------------

!macro VICBANK vic_bank {  
  lda $DD00
  and #%11111100
  ora #(3-vic_bank)
  sta $DD00
}
; "vic_bank" is the same as in COPYCHARROM

!macro SCREENMEM vic_bank, screen_pos {
  lda $D018
  and #%00001111
  ora #(16*screen_pos)
  sta $D018
  lda #((($4000*vic_bank)/256)+((screen_pos*1024)/256))
  sta 648 ; page number of screen for kernal
}

!macro VICTEXTMEM set_vic_bank, vic_bank, charpos, copy_chars, screen_pos {

  !if copy_chars=TRUE {
    +COPYCHARROM vic_bank, charpos
  }
  !if charpos<>IGNORE {
    +CHARMEM charpos
  }
  !if screen_pos<>IGNORE {
    +SCREENMEM vic_bank, screen_pos
  }
  !if set_vic_bank<>TRUE {
    +VICBANK vic_bank
  }
  

}

;-------------------------------------------------------------------------------------------------
; "screen_pos" | ora | bits 7-4 | screen memory address
;   in $D018   |     |          | Bank 0          
;-------------------------------------------------------------------------------------------------
;  0           |   0 | 0000xxxx | $0000      0    |
;  1           |  16 | 0001xxxx | $0400   1024    |
;  2           |  32 | 0010xxxx | $0800   2048    |
;  3           |  48 | 0011xxxx | $0c00   3072    |
;  4           |  64 | 0100xxxx | $1000   4096 *1 |
;  5           |  80 | 0101xxxx | $1400   5120 *1 |
;  6           |  96 | 0110xxxx | $1800   6144 *2 |
;  7           | 112 | 0111xxxx | $1c00   7168 *2 |
;  8           | 128 | 1000xxxx | $2000   8192    |
;  9           | 144 | 1001xxxx | $2400   9216    |
; 10           | 160 | 1010xxxx | $2800  10240    |
; 11           | 176 | 1011xxxx | $2c00  11264    |
; 12           | 192 | 1100xxxx | $3000  12288    |
; 13           | 208 | 1101xxxx | $3400  13312    |
; 14           | 224 | 1110xxxx | $3800  14336    |
; 15           | 240 | 1111xxxx | $3c00  15360    |
;-------------------------------------------------------------------------------------------------
; *1 CHARROM image in Bank 0 & 2 (default: UpGfx CharSet) - No screen possible
; *2 CHARROM image in Bank 0 & 2 (LoUp CharSet) - No screen possible
; *  No screen possible

; $D018 = %0000xxxx -> screenmem is at $0000
; $D018 = %0001xxxx -> screenmem is at $0400
; $D018 = %0010xxxx -> screenmem is at $0800
; $D018 = %0011xxxx -> screenmem is at $0c00
; $D018 = %0100xxxx -> screenmem is at $1000
; $D018 = %0101xxxx -> screenmem is at $1400
; $D018 = %0110xxxx -> screenmem is at $1800
; $D018 = %0111xxxx -> screenmem is at $1c00
; $D018 = %1000xxxx -> screenmem is at $2000
; $D018 = %1001xxxx -> screenmem is at $2400
; $D018 = %1010xxxx -> screenmem is at $2800
; $D018 = %1011xxxx -> screenmem is at $2c00
; $D018 = %1100xxxx -> screenmem is at $3000
; $D018 = %1101xxxx -> screenmem is at $3400
; $D018 = %1110xxxx -> screenmem is at $3800
; $D018 = %1111xxxx -> screenmem is at $3c00

; charpos is relative to VIC bank

