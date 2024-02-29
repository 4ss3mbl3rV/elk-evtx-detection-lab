FROM python:3.7
RUN pip install elasticsearch progressbar2 termcolor evtx tqdm urllib3
RUN pip install evtx2es==1.3.1
RUN apt update
RUN apt install -y jq curl
WORKDIR /datasets
COPY install-datasets.sh /datasets
ENTRYPOINT ["sh", "/datasets/install-datasets.sh"]
