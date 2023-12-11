#!/bin/bash

#SBATCH --job-name=nce-el
#SBATCH --nodes=1
#SBATCH --gres=gpu:2
#SBATCH --time=0-12:00:00
#SBATCH --mem=100000MB
#SBATCH --cpus-per-task=16
#SBATCH --partition=P1
#SBATCH --output=slurm_output/%j.out

python main_reranker.py --epochs=5 --bert_lr=1e-05 --lr=1e-05 --type_model=extend_multi_dot --warmup_proportion=0.01 --inputmark --model=./cocondenser.bin --type_cands=mixed_negative --token_type --eval_batch_size=8 --identity_bert --fixed_initial_weight --save_dir=./models --num_layers=2 --num_heads=4 --cands_dir=./data/cands_anncur_top1024 --cocondenser --B=2 --gradient_accumulation_steps=4 --resume_training --run_id=byh82dav
# python main_reranker.py --epochs=20 --lr=2e-05 --type_model=extend_multi_dot --warmup_proportion=0.2 --inputmark --training_one_epoch --anncur --model=./dual_encoder_zeshel.ckpt --type_cands=hard_negative --token_type
#python blink/crossencoder/train_cross.py --act_fn=softplus --architecture=extend_multi --classification_head=dot --learning_rate=2e-05 --n_heads=16 --num_layers=4 --num_train_epochs=500 --optimizer=AdamW --train_batch_size=256 --train_split=1
# python main_r/eranker.py --epochs=20 --lr=2e-05 --type_model=extend_multi_dot --warmup_proportion=0.2 --inputmark --training_one_epoch --anncur --model=./dual_encoder_zeshel.ckpt --model_top=/home/jylab_share/jongsong/BLINK/models/zeshel/crossencoder/extend_extension/m62cweg5/Epochs/epoch_85
# python main_reranker.py --epochs=20 --lr=2e-05 --type_model=extend_multi_dot --warmup_proportion=0.2 --inputmark --training_one_epoch --anncur --model=./dual_encoder_zeshel.ckpt --model_top=/home/jylab_share/jongsong/BLINK/models/zeshel/crossencoder/extend_extension/m62cweg5/Epochs/epoch_85 
# python main_reranker.py --epochs=20 --lr=2e-05 --type_model=extend_multi_dot --warmup_proportion=0.2 --inputmark --training_one_epoch --anncur --model=./dual_encoder_zeshel.ckpt
# python main_reranker.py --epochs=10 --lr=1e-04 --type_model=extend_multi --warmup_proportion=0.2 --inputmark --training_one_epoch --B 4 --num_heads=8 --num_layers=8
# python main_reranker.py --model ./models/reranker --data ./data --B 2 --gradient_accumulation_steps 4 --num_workers 2 --warmup_proportion 0.1 --epochs 50 --gpus 0,1 --lr 2e-5 --cands_dir=./data/cands_anncur --eval_method macro --type_model extend_multi --type_bert base --inputmark --type_cands=fixed_negative --training_one_epoch --resume_training --run_id=5chdg8oq
# python main_retriever.py --model ./models/model_dual.pt --data_dir data --B 8 --gradient_accumulation_steps 2 --logging_steps 1000 --k 64 --epochs 50 --lr 0.0002581067486739702 --num_cands 64 --type_cands mixed_negative --cands_ratio 1 --gpus 0,1,2,3 --type_model extend_multi --num_mention_vecs 128 --num_entity_vecs 128 --en_hidden_path=./data/en_hidden_extend_multi/ --store_en_hiddens --entity_bsz 128 --mention_bsz 128 --cands_dir=data/cands_dual --eval_method=micro --num_heads=6 --num_layers=2
# python main_reranker.py --model ./models/reranker --data ./data --B 2  --gradient_accumulation_steps 4 --num_workers 2 --warmup_proportion 0.2 --epochs 3  --gpus 0,1  --lr 1e-5 --cands_dir=./data/cands_dual --eval_method micro --type_model full --type_bert base  --inputmark
# python main_retriever.py --model ./models/model_dual.pt --data_dir data --B 4 --gradient_accumulation_steps 2 --logging_steps 1000 --k 64 --epochs 4 --lr 0.00001 --num_cands 64 --type_cands mixed_negative --cands_ratio 0.5 --gpus 0,1,2,3 --type_model full --num_mention_vecs 128 --num_entity_vecs 128 --en_hidden_path=./data/en_hidden_sum_max/ --store_en_hiddens --entity_bsz 1024 --mention_bsz 1024 --cands_dir=data/cands_dual --eval_method=micro --retriever_path=/home/jylab_share/jongsong/hard-nce-el/models/dual/q0z280i9/pytorch_model.bin --retriever_type=dual
# python main_retriever.py --model ./models/model_dual.pt --data_dir data --B 1 --gradient_accumulation_steps 2 --logging_steps 1000 --k 64 --epochs 4 --lr 0.00001 --num_cands 64 --type_cands mixed_negative --cands_ratio 0.5 --gpus 0,1 --type_model full --num_mention_vecs 128 --num_entity_vecs 128 --entity_bsz 512 --mention_bsz 512 --cands_dir=data/cands_dual --eval_method=micro --retriever_path=/home/jylab_share/jongsong/hard-nce-el/models/dual/q0z280i9/pytorch_model.bin --retriever_type=dual 
# python main_retriever.py --model ./models/model_dual.pt --data_dir data --B 4 --gradient_accumulation_steps 2 --logging_steps 1000 --k 64 --epochs 4 --lr 0.00001 --num_cands 64 --type_cands mixed_negative --cands_ratio 0.5 --gpus 0,1,2,3 --type_model dual --num_mention_vecs 128 --num_entity_vecs 128 --en_hidden_path=./data/en_hidden_path/ --entity_bsz 512 --mention_bsz 512 --resume_training --run_id=q0z280i9 --cands_dir=data/cands_dual --eval_method=micro
