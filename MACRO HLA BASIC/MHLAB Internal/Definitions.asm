;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
; DEFINITIONS
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;*********************************************************************
; Addressing Modes
;*********************************************************************

IMM8=-1    ; e.g. sta #value
ABS8=-2    ; e.g. sta value
ABSX8=-3   ; e.g. sta value,x
ABSY8=-4   ; e.g. sta value,y
ZPXIND8=-5 ; e.g. sta (value,x)
ZPINDY8=-6 ; e.g. sta (value),y
ABSS=-7    ; only for synthetic commands (e.g. PRINT) - "S" means synthetic or something like simulated
INDS=-8    ; -"-
INDXS=-9   ; -"-
INDYS=-10  ; -"-

; IMM16 must stay the first of the 16-bit entries
; for example CMP16 <- take a look there why!
IMM16=-50
ABS16=-51
ABSX16=-52
ABSY16=-53
ZPXIND16=-54
ZPINDY16=-55

AREG=-97
XREG=-98
YREG=-99

_T_M_P_0_=0 ; Values to avoid autocomplete with local labels
_T_M_P_1_=0
_T_M_P_2_=0

IGNORE = -99999999999
TRUE=1
FALSE=0

;*********************************************************************
; RAM positions
;*********************************************************************

; $0057-$005B: Arithmetic register #3 (5 bytes) (87-91)
_A_R_3__57_=$57
_A_R_3__58_=$58
_A_R_3__59_=$59
_A_R_3__5A_=$5A
_A_R_3__5B_=$5B

;*********************************************************************
; Comparision Constants
;*********************************************************************

IS_EQUAL_TO=-1
IS_NOT_EQUAL_TO=-2
IS_LOWER_THAN=-3
IS_GREATER_OR_EQUAL_THAN=-4
IS_LOWER_OR_EQUAL_THAN=-5
IS_GREATER_THAN=-6

;*********************************************************************
; C64 ROM Addresses
;*********************************************************************

STROUT0=$AB1E  ; PRINT 0-terminated String pointed to by [Y,A]
CHROUT=$F1CA   ; PRINT Character in [A]
BSOUT=CHROUT
INTOUT=$BDCD   ; PRINT Adddres/Unsigned Integer/Word in [X,A]
CHRIN=$FFCF
GETIN=$FFE4
_C_L_R_S_C_R_=$E544
_S_E_T_C_U_R_=$FFF0

;*********************************************************************
; C64 COLOR CONTROL CODES
;*********************************************************************

COLOR_Black = 144
COLOR_White = 5
COLOR_Red = 28
COLOR_Cyan = 159
COLOR_Purple = 156
COLOR_Green = 30
COLOR_Blue = 31
COLOR_Yellow = 158
COLOR_Orange = 129
COLOR_Brown = 149
COLOR_Light_Red = 150
COLOR_Dark_Grey = 151
COLOR_Grey = 152
COLOR_Light_Green = 153
COLOR_Light_Blue = 154
COLOR_Light_Grey = 155

;*********************************************************************
; C64 OTHER CONTROL CODES
;*********************************************************************

CTRL_Return = 13
CTRL_LoUpCharSet = 14
CTRL_UpGfxCharSet = 142
CTRL_Home = 19
CTRL_Del = 20

CTRL_Space = 32

CTRL_RvsOn = 18
CTRL_RvsOff = 146

CTRL_CurDown = 17
CTRL_CurUp = 145
CTRL_CurLeft = 157
CTRL_CurRight = 29

CTRL_ClearScreen = 147
CTRL_ShiftClrHome = CTRL_ClearScreen

;*********************************************************************
; C64 POKECOLORs
;*********************************************************************

POKECOLOR_Black = 0
POKECOLOR_White = 1
POKECOLOR_Red = 2
POKECOLOR_Cyan = 3
POKECOLOR_Purple = 4
POKECOLOR_Green = 5
POKECOLOR_Blue = 6
POKECOLOR_Yellow = 7
POKECOLOR_Orange = 8
POKECOLOR_Brown = 9
POKECOLOR_Light_Red = 10
POKECOLOR_Dark_Grey = 11
POKECOLOR_Grey = 12
POKECOLOR_Light_Green = 13
POKECOLOR_Light_Blue = 14
POKECOLOR_Light_Grey = 15

