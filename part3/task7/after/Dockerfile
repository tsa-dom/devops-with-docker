FROM node:16-alpine as build

WORKDIR /

COPY . .

WORKDIR /frontend
RUN npm ci --production && \
    npm run build && \
    npm run transfer

FROM python:3-alpine
COPY --from=build /backend /src/

WORKDIR /src

RUN pip install -r requirements.txt

WORKDIR /src/app

RUN python manage.py collectstatic --no-input

ENV PYTHONUNBUFFERED=1

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]