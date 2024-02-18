FROM nvcr.io/nvidia/pytorch:22.05-py3

EXPOSE 6006 6007 6008 6009
RUN python3 -m pip --no-cache-dir install --upgrade \
    mxnet>=1.4.0 \
    gluonnlp==0.10.0 \
    sentencepiece>=0.1.6 \
    onnxruntime>=0.3.0 \
    transformers==4.14.1 \
    omegaconf==2.1.0 \
    gpustat==0.6.0 \
    sentence_transformers==2.1.0 \
    huggingface_hub==0.10.0 \
    gdown \
    && \
apt update && \
apt install -y \
    tmux \
    htop \
    ncdu \
    vim \
    && \
apt clean && \
apt autoremove && \
rm -rf /var/lib/apt/lists/* /tmp/* && \
mkdir /Sentence-Embedding-Is-All-You-Need
COPY . /Sentence-Embedding-Is-All-You-Need/
WORKDIR /Sentence-Embedding-Is-All-You-Need
#RUN cd /Sentence-Embedding-Is-All-You-Need \
#    && \
#bash get_model_checkpoint.sh