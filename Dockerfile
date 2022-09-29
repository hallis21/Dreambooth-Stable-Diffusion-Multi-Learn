FROM pytorch/pytorch
RUN apt update
RUN apt -y install git
RUN git clone https://github.com/hallis21/Dreambooth-Stable-Diffusion-Multi-Learn.git
WORKDIR /workspace/Dreambooth-Stable-Diffusion-Multi-Learn
RUN pip install omegaconf
RUN pip install einops
RUN pip install pytorch-lightning==1.6.5
RUN pip install test-tube
RUN pip install transformers
RUN pip install kornia
RUN pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
RUN pip install -e git+https://github.com/openai/CLIP.git@main#egg=clip
RUN pip install setuptools==59.5.0
RUN pip install pillow==9.0.1
RUN pip install torchmetrics==0.6.0
RUN pip install -e .
RUN pip install protobuf==3.20.1
RUN pip install gdown
RUN pip install pydrive
RUN pip install -qq diffusers["training"]==0.3.0 transformers ftfy
RUN pip install -qq "ipywidgets>=7,<8"
RUN pip install huggingface_hub
RUN pip install ipywidgets==7.7.1


RUN git clone https://github.com/djbielejeski/Stable-Diffusion-Regularization-Images-person_ddim.git
RUN mkdir -p outputs/txt2img-samples/samples/person_ddim
RUN mv -v Stable-Diffusion-Regularization-Images-person_ddim/person_ddim/*.* outputs/txt2img-samples/samples/person_ddim
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]