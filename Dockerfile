FROM python:3.10-slim
WORKDIR /code
ENV FLASK_APP=app/app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    musl-dev \
    libffi-dev \
    libssl-dev && \
    rm -rf /var/lib/apt/lists/*
COPY app/requirements.txt .
RUN pip install -r app/requirements.txt
COPY . .
CMD ["flask", "run", "--debug"]
