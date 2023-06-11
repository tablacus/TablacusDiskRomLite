
# Tabacus DISK ROM Lite for MSX Gaku

## 機能概略

このソフトはMSXのDISK環境のソフトをROM化するソフトです。  
ROM起動後にH.GONEでフックして、LOAD、BLOAD、FILESをROMディスクを使うものに置き換えています。  

置き換えにRS-232Cのワークエリアを使用しています。RS-232Cを変更するソフトは動作しないと思われます。

[Tabacus DISK ROM](https://github.com/tablacus/TablacusDiskRom)との違いはMSXのDISK BIOS ROMが不要なことと現時点ではBASIC環境専用という事、対応ディスクが2DD1枚に限定されるという点になります。


## ダウンロード

以下のページの Assets からダウンロードできます。  
https://github.com/tablacus/TablacusDiskRomLite/releases

## DSKファイルのROM化方法

1. Windowsのコマンドラインで`msxcat.bat`を実行してシステムとディスクイメージ`ROM.DSK`を連結する

※DISKROM.BIN(8KB)の後ろに2DDのDSKファイルを連結しさえすればやり方は何を使ってもOKです。

## 実行方法

1. ROMスロットに`MSX.ROM`をセット
2. ROMイメージのタイプを`ASCII-8K`、`Konami-8K`(512MB以下の場合のみ)のいずれかに設定
3. 起動しない場合はリセットする


## 現時点の制限と課題

1. パラメータは文字列しか使えない
`LOAD "FILE.BAS"`の様に必ず、固定の文字列にする必要があります。変数は使えません。またドライブは固定なのでドライブ指定も行わないでください。

2. `LOAD`で扱えるのはBASIC形式のファイル形式に限ります。MSX-BASIC アスキーファイルは扱えません。
BASIC形式でない場合は`File not OPEN`エラーが出ます。MSX DISK BASICで一度LOADしてSAVEして下さい。  
アスキー形式を中間言語に変換する方法を知っている方が居られましたら教えていただけると幸いです。

3. `BLOAD`で`S`オプションは使えません。  
VRAMにどう放り込むか分かっていないのでこちらも情報お待ちしております。

4. `BLOAD`でオフセットの指定も使えません。
BSAVE形式で保存したファイルを保存した場所に読み込むことになります。

5. `BLOAD`,`LOAD`,`RUN`,`FILES`の後ろにマルチステートメントで別の命令を繋ぐことはできません。
別の行で行ってください。

6. `FILES`のパラメータは無効です。

7. BDOSコール(0F37DH)はほんの一部だけ対応
今後、充実させる予定です。

まだまだこれから調整の必要がありますが、どこを優先してほしいとかありましたら……

## ライセンス

[MIT License](https://github.com/tablacus/TablacusDiskRomLite/blob/main/LICENSE)

## 感謝

[HRA!](https://twitter.com/thara1129)さんのMSX Memory Architecture のお陰でメガROMに対応することができました。
本当にありがたいです。

https://github.com/hra1129/msx_documents/blob/main/memory/MSX_memory_architecture.pdf

また、ASCATのMSXテクニカルガイドブック（第4版＋ディスク編）もかなり参考にさせてもらいました。ありがとうございます。