#!/usr/bin/env bash

python experiments/bert/run_mlm.py \
  --train_data_file data_mlm/mlm_input.txt \
  --model_name_or_path cl-tohoku/bert-base-japanese-whole-word-masking \
  --do_train \
  --output_dir mlm_bert \
  --line_by_line \
  --mlm

