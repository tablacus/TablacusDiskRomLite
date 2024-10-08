
# Tabacus DISK ROM Lite for MSX Gaku

## 機能概略

このソフトはMSXのDISK環境のソフトをROM化するソフトです。  
ROM起動後にH.GONEでフックして、LOAD、BLOAD、FILES、COPYをROMディスクを使うものに置き換えています。  
置き換えでHIMEM等を256バイト前に変更しています。(64KB対応版の場合は576バイト前になります)

[Tabacus DISK ROM](https://github.com/tablacus/TablacusDiskRom)との違いはMSXのDISK BIOS ROMが不要な事になります。  
似非DOSは動くようになりましたが、本家MSX-DOSやMSX-DOS2、RAMディスクを使用したい場合はTabacus DISK ROMがお勧めです。

## ダウンロード

以下のページの Assets からダウンロードできます。  
https://github.com/tablacus/TablacusDiskRomLite/releases

## DSKファイルのROM化方法

1. Windowsのコマンドラインで`msxcat.bat`を実行してシステムとディスクイメージ`ROM.DSK`を連結する

ROMのタイプと64KB対応版の組み合わせで4種類のBINがあります。

BASICで`MKI$`、`CVI`を使わない場合、基本的に64KB対応版は必要ありません。  
似非DOSで使う場合は必ず、64KB対応版を使ってください。

※8KバンクのメガROMの場合(ASCII-8K / Konami-8K / Konami-SCC)はDISKROM.BIN(8KB)の後ろにDSKファイルを連結しさえすればやり方は何を使ってもOKです。(ASCII-8Kの場合は2MBのディスクまで作成することができます)
```bat
copy /b DISKROM.BIN + DISK.DSK DISK.ROM
```
MSX-DOS互換の似非DOSのROMを作成したい場合は64KB対応版のDISKROM64(8KB)の後ろにDSKファイルを連結してください。
```bat
copy /b DISKROM64.BIN + DOSDISK.DSK DOSDISK.ROM
```
※Normal 32KB, 16KバンクのメガROM(ASCII-16K / [Simple MegaROM](https://github.com/hra1129/simple_megarom_cartridge/tree/main))の場合はDISKROM32.BIN(8KB)の後ろにDSKファイルを連結しさえすればやり方は何を使ってもOKです。(ASCII-16Kの場合は4MBのディスクまで作成することができます)
```bat
copy /b DISKROM32.BIN + DISK.DSK DISK32.ROM
```
似非DOSの場合
```bat
copy /b DISKROM64K32.BIN + DOSDISK.DSK DOSDISK32.ROM
```

※8KバンクのメガROMの場合(ASCII-8K / Konami-8K / Konami-SCC)は２枚組をROM化する事もできます。２枚目はBドライブになります。

1. DISKROM.BIN(8KB)/DISKROM64K.BIN(8KB)の後ろにDSKファイルを2つ連結してください。

Windowsのコマンドラインで２枚のイメージファイルを連結する例
```bat
copy /b DISKROM.BIN + DISK1.DSK + DISK2.dsk DISK1_2.ROM
```
```bat
copy /b DISKROM64K.BIN + DISK1.DSK + DISK2.dsk DISK1_2.ROM
```

## 実行方法

### 8KバンクのメガROMの場合(ASCII-8K / Konami-8K / Konami-SCC)

1. ROMスロットに`MSX.ROM`をセット
2. ROMイメージのタイプを`ASCII-8K`、`Konami-8K`か`Konami-SCC`(512MB以下の場合のみ)のいずれかに設定
3. 起動しない場合はリセットする

### Normal 32KB, 16KバンクのメガROM(ASCII-16K / [Simple MegaROM](https://github.com/hra1129/simple_megarom_cartridge/tree/main))の場合

1. ROMスロットに`MSX32.ROM`をセット
2. ROMイメージのタイプを`Normal ROM`に設定
3. 起動しない場合はリセットする

## WebMSX

[WebMSX](https://webmsx.org/)でサンプルの`MSX.ROM`を起動するリンクはこちら

- 8KバンクのメガROM (BASIC)
https://webmsx.org/?MACHINE=MSX2J&P=NODISK&CARTRIDGE1_URL=https://github.com/tablacus/TablacusDiskRomLite/raw/main/MSX.ROM

- Normal 32KBのROM (BASIC)
https://webmsx.org/?MACHINE=MSX2J&P=NODISK&CARTRIDGE1_URL=https://github.com/tablacus/TablacusDiskRomLite/raw/main/MSX32.ROM

- 8KバンクのメガROM (似非DOS)
https://webmsx.org/?MACHINE=MSX2J&P=NODISK&CARTRIDGE1_URL=https://github.com/tablacus/TablacusDiskRomLite/raw/main/MSX64K.ROM

- 8KバンクのメガROM (BASIC)64KB対応版
https://webmsx.org/?MACHINE=MSX2J&P=NODISK&CARTRIDGE1_URL=https://github.com/tablacus/TablacusDiskRomLite/raw/main/MSX64KBAS.ROM

## 現時点の制限と課題

1. ~~パラメータは文字列しか使えない~~  
~~`LOAD "FILE.BAS"`の様に必ず、固定の文字列にする必要があります。変数は使えません。~~

2. ~~`LOAD`で扱えるのはBASIC形式のファイル形式に限ります。MSX-BASIC アスキーファイルは扱えません。~~  
~~BASIC形式でない場合は`File not OPEN`エラーが出ます。MSX DISK BASICで一度LOADしてSAVEして下さい。~~    
~~アスキー形式を中間言語に変換する方法を知っている方が居られましたら教えていただけると幸いです。~~

3. ~~`BLOAD`で`S`オプションは使えません~~  
~~VRAMにどう放り込むか分かっていないのでこちらも情報お待ちしております。~~

4. ~~`BLOAD`でオフセットの指定は使えません。~~  
~~BSAVE形式で保存したファイルを保存した場所に読み込むことになります。~~

5. ~~`BLOAD`,`LOAD`,`RUN`,`FILES`の後ろにマルチステートメントで別の命令を繋ぐことはできません。~~  
~~別の行で行ってください。~~

6. ~~`FILES`のパラメータは無効です。~~

7. ~~BDOSコール(0F37DH)は一部だけ対応~~
~~今後、充実させる予定です。~~

まだまだこれから調整の必要がありますが、どこを優先してほしいとかありましたら……

## ライセンス

[MIT License](https://github.com/tablacus/TablacusDiskRomLite/blob/main/LICENSE)
MIT License のオープンソースです。  

※有料、無料にかかわらず同人ソフトなどに組み込んで配布してもらっても問題ありません。

## 感謝

[HRA!](https://twitter.com/thara1129)さんのMSX Memory Architecture のお陰でメガROMに対応することができました。
本当にありがたいです。

https://github.com/hra1129/msx_documents/blob/main/memory/MSX_memory_architecture.pdf

また、ASCATのMSXテクニカルガイドブック（第4版＋ディスク編）もかなり参考にさせてもらいました。ありがとうございます。

[hide_san(ヒデ)](https://twitter.com/_msx_)さん、[Takashi Kobayashi](https://twitter.com/nf_ban)さん、Lite版でうまく動かないディスクイメージを送っていただきありがとうございます。

[ごりぽん](https://twitter.com/goripon_tw)さん、RAM捜索の方法、ありがとうございます。

[ひぽぽ　(ファミコンGimmick!👍)](https://twitter.com/koichironakaza1)さん、実機でのテスト協力ありがとうございます。

[すーぱーたー⁧⁨ぼ](https://twitter.com/SuperturboZ)さん、DEVICEからの拡張方法のサンプルコードありがとうございます。
