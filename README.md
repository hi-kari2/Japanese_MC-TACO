# Japanese_MC-TACO
MC-TACOは英語による時間的常識データセットである．詳しくはhttps://github.com/CogComp/MCTACO を参照．  
日本語MC-TACOはこれを日本語に翻訳したデータセットである．

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
 `> git clone https://github.com/hi-kari2/Japanese_MC-TACO.git`
 
2. BERTの予測結果を生成する<br>
 `> sh experiments/bert/ja_run_bert_baseline.sh`
 
3. 生成した予測結果を用いて評価を行なう <br>
 `> python evaluator/evaluator.py eval --test_file dataset/test_ja.tsv --prediction_file bert_output/eval_outputs.txt`


## 結果
プログラムを実行した結果として以下が書き出される．  
　`Strict Acc.: 0.3390930064888248`  
　`Avg F1: 0.6123554661179585`
 
予測結果は以下のフォルダに書き出される．  
　`bert\_output/`  


# Masked Language Modeling
日本語MC-TACOのラベルが yes である訓練データを用いたMLMでファインチューニングを行なう．

## 環境構築
上記と同様のパッケージのインストールが必要．

## 使用手順
言語モデルとして cl-tohoku/bert-base-japanese-whole-word-masking を使用する場合を例に示す．

1. データセットとコードをダウンロードする <br>
 `> git clone https://github.com/hi-kari2/Japanese_MC-TACO.git`
 
2. MLMでファインチューニングを行ない，モデルを保存する <br>
    `> sh experiments/bert/run_mlm.sh`
    
3. ファインチューニングしたBERTの予測結果を生成する<br>
　experiments/bert/ja_run_bert_baseline.sh の15行目のコメントアウトを外し，追加してから実行すると，指定のモデルを読み込む．<br>
 `> sh experiments/bert/ja_run_bert_baseline.sh`
 
4. 生成した予測結果を用いて評価を行なう <br>
 `> python evaluator/evaluator.py eval --test_file dataset/test_ja.tsv --prediction_file bert_output/eval_outputs.txt`

## 結果
プログラムを実行した結果として以下が書き出される．<br>
　`Strict Acc.: 0.3652335976928623`  
　`Avg F1: 0.6585188086509655`

予測結果は以下のフォルダに書き出される．<br>
　`bert\_output/`

ファインチューニングしたモデルは以下のフォルダに書き出される．<br>
　`mlm\_bert/`  
cl-tohoku/bert-base-japanese-whole-word-masking を使用してファインチューニングしたモデルをhttps://drive.google.com/file/d/1mohWd1mSdWiDHU1IK1YUvcmgTlRjQ_TX/view?usp=sharing に保存している．

# Questions
何か質問がありましたら，g1820534@is.ocha.ac.jp までご連絡ください．
