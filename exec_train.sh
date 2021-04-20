#!/bin/bash
#bash 파일 설정? bash/python 설정. ( #!/usr/bin/env bash 혹은 #!/bin/bash )


#global 환경변수 설정.
export PATH_INPUTDATA=./preprocessed
export INPUT_PATH=$PATH_INPUTDATA/preprocessedTrain.jsonl #jsonl file #/home/nlplab/lssTestDir/bert_korean_classifier/BERT-Korean-Classification/preprocessedTrain.jsonl #jsonl file
export CONFIG_PATH=None #ini file for telegram_sender
export SAVE_DIR=./output #'/home/nlplab/lssTestDir/bert_korean_classifier/BERT-Korean-Classification/output' #string써주는게 아닌가??

export WARMUP=500 #(int) default=500
export WEIGHTDECAY=0.1 #lambda값 설정(lr에 따라 다르게 설정해서 fitting) default=0.1
export MODEL_VERSION='lr5e-5_wm500_wd0.1' #(string) lr[learningRate]_wm[WARMUP]_wd[WEIGHTDECAY] #lr_LR_wm_WARMUP_WEIGHTDECAY

export BATCH_SIZE=4 #(int) default=4
export LEARNING_RATE=0.00002 #(float) [5e-1:0.00005,]
export MAX_EPOCHS=10 #(int) default=10
export BERT='koBERT' #(string) [BERT, KoBERT, KcBERT]

export GPU_NUM=1 #(int) [0:use cpu, 1:singleGPU , 1+:distributedGPU]
export NUM_WORKERS=0 #(int) number of workers at DataLoader. default=0


#train data: setting by all default values
python train.py \
	--input_path=$INPUT_PATH \
	--config_path $CONFIG_PATH \
	--save_dir=$PATH_SAVE_DIR \
	--model $BERT \
	--version $MODEL_VERSION \
	--warm_up $WARMUP \
	--weight_decay $WEIGHTDECAY \
	--cuda_device $GPU_NUM \
	--max_epochs $MAX_EPOCHS \
	--save_dir $SAVE_DIR \
	--batch_size $BATCH_SIZE \
	--lr $LEARNING_RATE \
	--num_workers $NUM_WORKERS

