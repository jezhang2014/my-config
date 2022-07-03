#FROM continuumio/anaconda3
FROM anaconda3:my-conda
RUN mkdir -p /opt/notebooks
CMD ["jupyter", "notebook", "--notebook-dir=/opt/notebooks", "--ip='*'", "--port=8888", "--allow-root"]
