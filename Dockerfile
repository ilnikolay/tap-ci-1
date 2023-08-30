ARG PYTHON_VERSION

FROM python:${PYTHON_VERSION}

ARG POETRY_VERSION
ARG TERRAFORM_VERSION
ARG DBT_VERSION

ENV POETRY_VERSION=${POETRY_VERSION}
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION} 
ENV DBT_VERSION=${DBT_VERSION}

RUN apt-get update \
  && apt-get install -y gnupg software-properties-common wget git \
  && wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor > /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  && gpg --no-default-keyring \
  --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  --fingerprint \
  && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
  https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  tee /etc/apt/sources.list.d/hashicorp.list \
  && apt-get update && apt-get install -y terraform=$TERRAFORM_VERSION \
  && pip install dbt-core==$DBT_VERSION \
  && pip install dbt-snowflake==$DBT_VERSION \
  && pip install poetry==$POETRY_VERSION \
  && rm -rf /var/lib/apt/lists/*
