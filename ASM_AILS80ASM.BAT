rem
rem Tablacus DISK ROM for MSX assemble batch for AILZ80ASM
rem <https://github.com/AILight/AILZ80ASM>
rem

set ASM=\tool\AILSZ80\AILZ80ASM.exe

%ASM% -lst -bin DISKROM.BIN -i DISKROM.ASM -f -gap 0 -sym
%ASM% -lst -bin DISKROM32.BIN -i DISKROM32.ASM -f -gap 0 -sym
%ASM% -lst -bin DISKROM64K.BIN -i DISKROM64K.ASM -f -gap 0 -sym
%ASM% -lst -bin DISKROM64K32.BIN -i DISKROM64K32.ASM -f -gap 0 -sym

msxcat
