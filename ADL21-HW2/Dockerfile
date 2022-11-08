FROM docker.io/pytorch/pytorch:1.12.1-cuda11.3-cudnn8-runtime

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        git \
        git-lfs

ENV CONDA_OVERRIDE_CUDA=11.3

COPY requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt

CMD jupyter retro --allow-root --ip=0.0.0.0 --port=8888 --no-browser

# === Sample commands ===
#
# podman build -f Dockerfile -t ntuimage
#
# podman run \
#   --hooks-dir=.../oci-nvidia-hook \
#   --name=ntu \
#   --publish-all \
#   --replace \
#   --rm \
#   --workdir=$PWD \
#   -v $PWD:$PWD \
#   -v $HOME/.jupyter:/root/.jupyter \
#   -p 8888:8888 \
#   -p 6006:6006 \
#   -it \
#   ntuimage
#
# podman exec -it ntu bash
