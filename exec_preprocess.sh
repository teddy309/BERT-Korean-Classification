#!/bin/bash
#bash 파일 설정? bash/python 설정. ( #!/usr/bin/env bash 혹은 #!/bin/bash )

#global 환경변수 설정.
export INPUTPATH_DATA=./data
export INPUTPATH_TXT_TRAIN=$INPUTPATH_DATA/ratings_train.txt #input_path_train
export INPUTPATH_TXT_TEST=$INPUTPATH_DATA/ratings_test.txt #input_path_test

export OUTPUTDIR=./preprocessed
export OUTPUT_TRAINFILE_NAME=$OUTPUTDIR/preprocessedTrain.jsonl #output_path_train
export OUTPUT_TESTFILE_NAME=$OUTPUTDIR/preprocessedTest.jsonl #output_path_test

#train data
python preprocess.py \
	    --input_path=$INPUTPATH_TXT_TRAIN \
	        --output_path=$OUTPUT_TRAINFILE_NAME

#test data
python preprocess.py \
	    --input_path=$INPUTPATH_TXT_TEST \
	        --output_path=$OUTPUT_TESTFILE_NAME
