FROM python:3.11.10-slim-bookworm
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 PIP_NO_CACHE_DIR=1
RUN useradd --system --uid 10001 --create-home --shell /usr/sbin/nologin appuser
WORKDIR /usr/local/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY --chown=10001:10001 . .
USER 10001
EXPOSE 8080
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:8080", "--log-file", "-", "--access-logfile", "-", "--workers", "2", "--keep-alive", "0"]
