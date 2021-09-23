FROM python:3

RUN apt-get update
RUN apt-get install curl
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt-get install -y nodejs

WORKDIR /

COPY . .

WORKDIR /frontend
RUN npm ci --production
RUN npm run build
RUN npm run transfer

WORKDIR /backend

RUN pip install -r requirements.txt

WORKDIR /backend/app

RUN python manage.py collectstatic --no-input

ENV PYTHONUNBUFFERED=1

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]