;	Tablacus DISK ROM Lite for MSX
;	Programmed by
;	Gaku (Lovers/Tablacus)
;
	INCLUDE	"DEF.ASM"

USE_NORMAL_32K_ROM		EQU	1	;ノーマル32KB ROMを作成する

	ORG	RUN

; MSX ROM header
	DB	"AB"   ; ID for auto-executable ROM
	DW	INIT_ROM   ; Main program execution address.
	DW	STATEMENT  ; STATEMENT
	DW	0      ; DEVICE
	DW	0      ; TEXT
	DW	0,0,0  ; Reserved

	JP	DISKIO
	JP	DSKCHG
	JP	GETDPB
	JP	CHOICE
	JP	DSKFMT
	JP	DSKSTP
	JP	BASENT
	SCF
	JP	DSKFMT
	JP	DSKSTP
	NOP
	JP	GETSLT
	LD	HL,(0F34BH)
	RET

	ORG	0407FH
	RET
; Version
	DB	"Tablacus DISK ROM Lite v0.2.0.4",0

	ORG	040FFH
	RET

	INCLUDE	"INIT.ASM"
	INCLUDE	"FILE.ASM"
	INCLUDE	"DISK.ASM"
	INCLUDE	"BDOS.ASM"
LAST_ADR:

	END
