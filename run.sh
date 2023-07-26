#!/bin/bash

#SBATCH --job-name=dual
#SBATCH --nodes=1
#SBATCH --gres=gpu:2
#SBATCH --time=0-12:00:00
#SBATCH --mem=100000MB
#SBATCH --cpus-per-task=16
#SBATCH --partition=P1

python main_reranker.py --model ./models/reranker --data ./data --B 2 --gradient_accumulation_steps 4 --num_workers 2 --warmup_proportion 0.1 --epochs 50 --gpus 0,1 --lr 2e-5 --cands_dir=./data/cands_anncur --eval_method macro --type_model extend_multi --type_bert base --inputmark --type_cands=fixed_negative --training_one_epoch --resume_training --run_id=5chdg8oq
# python main_retriever.py --model ./models/model_dual.pt --data_dir data --B 8 --gradient_accumulation_steps 2 --logging_steps 1000 --k 64 --epochs 50 --lr 0.0002581067486739702 --num_cands 64 --type_cands mixed_negative --cands_ratio 1 --gpus 0,1,2,3 --type_model extend_multi --num_mention_vecs 128 --num_entity_vecs 128 --en_hidden_path=./data/en_hidden_extend_multi/ --store_en_hiddens --entity_bsz 128 --mention_bsz 128 --cands_dir=data/cands_dual --eval_method=micro --num_heads=6 --num_layers=2
# python main_reranker.py --model ./models/reranker --data ./data --B 2  --gradient_accumulation_steps 4 --num_workers 2 --warmup_proportion 0.2 --epochs 3  --gpus 0,1  --lr 1e-5 --cands_dir=./data/cands_dual --eval_method micro --type_model full --type_bert base  --inputmark
# python main_retriever.py --model ./models/model_dual.pt --data_dir data --B 4 --gradient_accumulation_steps 2 --logging_steps 1000 --k 64 --epochs 4 --lr 0.00001 --num_cands 64 --type_cands mixed_negative --cands_ratio 0.5 --gpus 0,1,2,3 --type_model full --num_mention_vecs 128 --num_entity_vecs 128 --en_hidden_path=./data/en_hidden_sum_max/ --store_en_hiddens --entity_bsz 1024 --mention_bsz 1024 --cands_dir=data/cands_dual --eval_method=micro --retriever_path=/home/jylab_share/jongsong/hard-nce-el/models/dual/q0z280i9/pytorch_model.bin --retriever_type=dual
# python main_retriever.py --model ./models/model_dual.pt --data_dir data --B 1 --gradient_accumulation_steps 2 --logging_steps 1000 --k 64 --epochs 4 --lr 0.00001 --num_cands 64 --type_cands mixed_negative --cands_ratio 0.5 --gpus 0,1 --type_model full --num_mention_vecs 128 --num_entity_vecs 128 --entity_bsz 512 --mention_bsz 512 --cands_dir=data/cands_dual --eval_method=micro --retriever_path=/home/jylab_share/jongsong/hard-nce-el/models/dual/q0z280i9/pytorch_model.bin --retriever_type=dual 
# python main_retriever.py --model ./models/model_dual.pt --data_dir data --B 4 --gradient_accumulation_steps 2 --logging_steps 1000 --k 64 --epochs 4 --lr 0.00001 --num_cands 64 --type_cands mixed_negative --cands_ratio 0.5 --gpus 0,1,2,3 --type_model dual --num_mention_vecs 128 --num_entity_vecs 128 --en_hidden_path=./data/en_hidden_path/ --entity_bsz 512 --mention_bsz 512 --resume_training --run_id=q0z280i9 --cands_dir=data/cands_dual --eval_method=micro