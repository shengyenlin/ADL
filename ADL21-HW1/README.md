# ADL HW1
## r11922a05 資工IA碩一 林聖硯

### Set up environment
```shell
conda create -f environment.yml
make
conda activate adl-hw1
pip install -r requirements.txt
```

### Download cache and ckpt files
```shell
bash download.sh
```

### Directory layout
- The directory should look like this after runnning all the command above
```
ADL21-HW1/ 
┣ cache/ 
┃ ┣ intent/ 
┃ ┃ ┣ embeddings.pt
┃ ┃ ┣ intent2idx.json
┃ ┃ ┣ vocab.json
┃ ┃ ┗ vocab.pkl
┃ ┗ slot/
┃   ┣ embeddings.pt
┃   ┣ intent2idx.json
┃   ┣ tag2idx.json
┃   ┗ vocab.pkl
┣ ckpt/
┃ ┣ intent/
┃ ┃ ┗ best_intent.ckpt
┃ ┗ slot/
┃   ┗ best_slot.ckpt
┣ data/
┃ ┣ intent/
┃ ┃ ┣ eval.json
┃ ┃ ┣ test.json
┃ ┃ ┗ train.json
┃ ┗ slot/
┃   ┣ eval.json
┃   ┣ test.json
┃   ┗ train.json
┣ Makefile
┣ README.md
┣ dataset.py
┣ environment.yml
┣ intent_cls.sh
┣ model.py
┣ nb-intent.ipynb
┣ nb-slot.ipynb
┣ requirements.txt
┣ test_intent.py
┣ test_slot.py
┣ test_slot.sh
┣ train_intent.py
┣ train_slot.py
┣ train_slot.sh
┣ slot_tag.sh
┣ train_intent_cv.sh
┣ train_slot_cv.sh
┗ utils.py
```

### Predict result with testing data and submit
```shell
bash ./intent_cls.sh /path/to/test.json /path/to/pred.csv
bash ./slot_tag.sh /path/to/test.json /path/to/pred.csv
```

### How to reproduce `best_intent.ckpt`
- Run all cells in `nb-intent.ipynb`
    - Split training data into multiple cross-validation files
    - Download and parse pre-trained embeddings
    - Generate vocab and embedding matrix
- run the following command
```shell
bash train_intent_cv.sh
```
- If you want to do cross validation for hyperparameter tuning, run
```shell
python3 train_intent.py --data_dir data/intent --ckpt_dir ckpt/intent --device cuda
```

### How to reproduce `best_slot.ckpt`
- Run all cells in `nb-slot.ipynb`
    - Split training data into multiple cross-validation files
    - Download and parse pre-trained embeddings
    - Generate vocab and embedding matrix
- run the following command
```shell
bash train_slot.sh
```
- If you want to do cross validation for hyperparameter tuning, run
```shell
python3 train_intent.py --data_dir data/intent --ckpt_dir ckpt/intent --device cuda
```