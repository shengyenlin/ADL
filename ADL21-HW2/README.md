# Description

  * Code based on huggingface's example multiple-choice and question-answering pipelines:
    * https://github.com/huggingface/transformers/blob/main/examples/pytorch/multiple-choice/run_swag_no_trainer.py
    * https://github.com/huggingface/transformers/blob/main/examples/pytorch/question-answering/
  * Tried different pretrained models from huggingface hub, some of the best performing were:
    * `IDEA-CCNL/Erlangshen-DeBERTa-v2-97M-Chinese`
    * `hfl/chinese-roberta-wwm-ext`
    * `hfl/chinese-macbert-base`
    * `hfl/chinese-bert-wwm-ext`
  * Some models especially IDEA-CCNL's models are biased towards simplified inputs, while this task's input is traditional.
    Implemented a fix (`--init-trad` flag) to initialize tokenizer and embeddings for traditional tokens from simplified.
  * For context selection, quickly hitting ~95-96% accuracy ceiling even on small subsets of data.
    Probably in big part due to the fact that for about 3-4% of inputs, the answer does not lie in the first 512 characters.
    Most pre-trained models are limited to 512 sequence length so hard to fix this directly in modelling.
    Let's fix this up during eval - run context 512-seq context selection model a couple times,
    at offset 0 and 384 into contexts, then pick the maximum score between two runs.
    This gives about +1-1.5% context selection accuracy boost.
  * For QA, tried a custom head which concatenates/sums hidden states from last k BERT layers as inputs into the final linear layer.
    BERT paper's recommendation is to concatenate last 4 when finetuning, but huggingface pipelines by default only use last layer.
    Observed some small accuracy boosts.
  * Ensembling: trained multiple QA models from several different pretrained models.
    Averaging their scores after `prelim_predictions` generation during postprocessing.
    ideally should've averaged start/end_logits but that would have been trickier to implement due to
    the need to align them first as different models use different tokenizers.
    Gives +1.5% exact match boost going from single model to 3-model ensemble.

Some more ideas to try:
  * try bigger 24-layers models and bigger ensemble
  * differential learning rates - smaller lr's for earlier layers
  * different architectures for prediction head, e.g. two linear layers, attention layer
  * different pooling strategies (e.g. max+mean) between encoder and prediction head for context selection model
    https://www.kaggle.com/code/rhtsingh/utilizing-transformer-representations-efficiently
