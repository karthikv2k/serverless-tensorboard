ARG TF_VERSION=1.13.1
FROM tensorflow/tensorflow:${TF_VERSION}
ENV LOG_DIR "/tmp"
ENV PORT "8080"
CMD [ "/bin/bash", "-c", "/usr/local/bin/tensorboard --logdir ${LOG_DIR} --host 0.0.0.0 --port ${PORT}"]
