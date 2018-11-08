FROM tensorflow/tensorflow:1.7.1-devel-gpu



COPY install-pycuda.sh /tmp/
RUN  /tmp/install-pycuda.sh
RUN  rm /tmp/install-pycuda.sh  

COPY install-deep-photo-style-transfer.sh /tmp/
RUN  /tmp/install-deep-photo-style-transfer.sh  
RUN  rm /tmp/install-deep-photo-style-transfer.sh

ADD  vgg19.npy /style-transfer/vgg19





