;	Tablacus DISK ROM Lite for MSX
;	Programmed by
;	Gaku (Lovers/Tablacus)

	INCLUDE	"DEF.ASM"
	ORG	RUN

; MSX ROM header
	DB	"AB"		; ID for auto-executable ROM
	DW	INIT_ROM	; Main program execution address.
	DW	STATEMENT	; STATEMENT
	DW	DEVICE_ENTRY	; DEVICE
	DW	0		; TEXT
	DW	0,0,0		; Reserved

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
	DB	"Tablacus DISK ROM Lite"
	ALIGN	32
	DB	"v0.7.1.0"
	ALIGN	32
MSG_ERROR_ROM_MODE:
#if exists USE_MORMAL32K_OR_ASCII16
	DB	"Normal ROM/ASCII-16K only!",13,10
#else
	DB	"ASCII-8K/Konami-8K/Konami-SCC only!",13,10
#endif
	ORG	041BDH
	RET

	;MBR_Partition1 (2DDのデータ)
	DB	0		;ブートフラグ
	DB	0,0,0		;パーティションの最初のセクタ番号(CHS方式)
	DB	1		;識別子(FAT12)
	DB	0,0,0		;パーティションの最後のセクタ番号(CHS方式)
	DW	16,0		;パーティションの最初のセクタ番号(LBA方式)
	DW	1440,0		;パーティション内のセクタ数(LBA方式)

#if exists USE_MORMAL32K_OR_ASCII16
#else
	;MBR_Partition2 (2DDのデータ)
	DB	0		;ブートフラグ
	DB	0,0,0		;パーティションの最初のセクタ番号(CHS方式)
	DB	1		;識別子(FAT12)
	DB	0,0,0		;パーティションの最後のセクタ番号(CHS方式)
	DW	16+1440,0	;パーティションの最初のセクタ番号(LBA方式)
	DW	1440,0		;パーティション内のセクタ数(LBA方式)
#endif

	ORG	041FEH
	DB	055H,0AAH	;MBR_Sig

	INCLUDE	"INIT.ASM"
	INCLUDE	"FILE.ASM"
	INCLUDE	"DISK.ASM"
	INCLUDE	"BDOS.ASM"
	INCLUDE	"SLOT.ASM"
LAST	EQU	$$
	DS	01FFFH-LAST
	DB	0

	END
