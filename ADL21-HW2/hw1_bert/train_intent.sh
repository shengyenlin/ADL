python3 intent_train.py \
    --train_file data/intent/train_organized.json \
    --valid_file data/intent/eval_organized.json \
    --model_name bert-base-uncased
    --train_batch_size 32 \
    --train_batch_size 64 \
    --lr 3e-5 \
    --weight_decay 1e-2;