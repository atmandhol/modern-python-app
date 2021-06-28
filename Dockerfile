# This dockerfile is a 2 stage build to build an optimized image
# Stage 1: Download the buster image for the build stage
FROM python:3.7.10-buster AS compile-img
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential gcc

# Copy only the required files for running pip install
RUN mkdir /app
COPY requirements.txt /app
WORKDIR /app

# Setup virtualenv which will be copied to next stage
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install requirements
RUN pip install --upgrade pip
RUN pip install --no-cache-dir --quiet -r requirements.txt

# Stage 2: Create the runtime image which copies the output from build stage and ignores the rest
FROM python:3.7.10-slim AS runtime-img
COPY --from=compile-img /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY configuration /app/configuration
COPY src /app/src
COPY main.py /app
WORKDIR /app

# RUN uvicorn server
EXPOSE $PORT
CMD ["uvicorn", "main:app", "--workers=3", "--no-access-log", "--loop=uvloop", "--timeout-keep-alive=60", "--host=0.0.0.0"]