# ADL HW1
## r11922a05 資工IA碩一 林聖硯

### Environment setting
```shell
conda create -f environment.yml
make
conda activate adl-hw1
pip install -r requirements.txt
bash download.sh
```
### How to predict result with testing data and submit
```shell
```

### How to reproduce
```shell
```

TODO: modify directory layout
### Directory layout
    ├── build                   # Compiled 
    ├── docs                    # 
    ├── src                     # Source files 
    ├── test                    # Automated 
    ├── tools                   # Tools and utilities
    ├── LICENSE
    └── README.md

## How to reproduce training results

## How to do testing

## Environment
```shell
# If you have conda, we recommend you to build a conda environment called "adl-hw1"
make
conda activate adl-hw1
pip install -r requirements.txt
# Otherwise
pip install -r requirements.in
```

## Preprocessing
```shell
# To preprocess intent detectiona and slot tagging datasets
bash preprocess.sh
```

## Intent detection
```shell
python train_intent.py
```
