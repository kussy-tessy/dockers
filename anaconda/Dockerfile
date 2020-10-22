FROM continuumio/anaconda3
EXPOSE 8888
WORKDIR /work
CMD bash -c "jupyter notebook --notebook-dir=/work --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='' && bash"