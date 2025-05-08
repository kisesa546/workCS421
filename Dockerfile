FROM python:3.13-bookworm

WORKDIR /app

COPY ./requrements.txt .

RUN pip install --no-cache-dir -r requrements.txt

COPY . .

RUN python manage.py makemigrations

RUN python manage.py migrate

CMD python manage.py runserver

EXPOSE 8000