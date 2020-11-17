
_main:

;main.c,5 :: 		void main() {
;main.c,8 :: 		T0CON = 0B00101000;
	MOVLW       40
	MOVWF       T0CON+0 
;main.c,16 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
