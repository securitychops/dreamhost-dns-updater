FROM python:3.9.4-buster

RUN apt-get update && \
    apt-get install \
    git \
    -y

WORKDIR /tmp/bender

RUN git clone https://github.com/gsiametis/dreampy_dns.git

# get known good version
RUN cd /tmp/bender/dreampy_dns/ && git reset --hard b45e02952efb7f022f938c39d1a03129f36b9d82

RUN apt-get remove git -y

RUN sed -i 's/#Python version check/import os/' /tmp/bender/dreampy_dns/dreampy_dns.py
RUN sed -i 's/API_Key = ""/API_Key = os.getenv("DREAMHOST_API_KEY", "NOT_SET_IN_ENV")/' /tmp/bender/dreampy_dns/dreampy_dns.py
RUN sed -i 's/domain = ""/domain = sys.argv[1]/' /tmp/bender/dreampy_dns/dreampy_dns.py

COPY start.sh .

ENTRYPOINT [ "bash" ]
CMD [ "/tmp/bender/start.sh" ]
