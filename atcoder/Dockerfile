FROM python:3.8.2
RUN apt update \
  && apt install -y nodejs npm \
  && npm install -g atcoder-cli \
  && pip install numpy==1.18.2 scipy==1.4.1 scikit-learn==0.22.2.post1 numba==0.48.0 networkX==2.4 online-judge-tools \
  && mkdir /work
COPY template.json /root/.config/atcoder-cli-nodejs/python/
COPY main.py /root/.config/atcoder-cli-nodejs/python/
RUN acc config default-template python
RUN echo "function accn() { \n acc new \$1 -c all && cd \$1; \n }" >> ~/.bashrc
RUN echo "alias acct='oj t -c \"python main.py\"'" >> ~/.bashrc
RUN echo "alias accs='acc s'" >> ~/.bashrc
RUN echo "alias remove='rm'" >> ~/.bashrc
RUN echo "alias rm=''" >> ~/.bashrc
WORKDIR /work