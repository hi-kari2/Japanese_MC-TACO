# Japanese_MC-TACO
MC-TACOは英語による時間的常識データセットである．詳しくはhttps://github.com/CogComp/MCTACO を参照．

## 環境構築
インストールが必要なパッケージ
* python 3.6.8
* transformers 3.5.1
* tensorflow 2.6.2
* torch 1.10.2
* fugashi
* ipadic
* dataclasses

## 使用手順
言語モデルとして cl-tohoku/bert-base-japanese-whole-word-masking を使用する場合を例に示す．

1. データセットとコードをダウンロードする <br>
 '> git clone https://github.com/'
2. BERTの予測結果を生成する<br>
 '> sh experiments/bert/ja\_run\_bert\_baseline.sh'
3. 生成した予測結果を用いて評価を行なう <br>
 '> python evaluator/evaluator.py eval --test\_file dataset/test\_ja.tsv --prediction\_file bert\_output/eval\_outputs.txt'


## 結果
プログラムを実行した結果として以下が書き出される．  
　'Strict Acc.: 0.3390930064888248  
　Avg F1: 0.6123554661179585  '
 
予測結果は以下のフォルダに書き出される．
　'bert\_output/' 
