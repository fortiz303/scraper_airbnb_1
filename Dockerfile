# syntax=docker/dockerfile:1
FROM python:3.9-slim-buster

RUN apt update && apt install curl -y
RUN pip install Scrapy scrapy-splash numpy

WORKDIR /app
COPY . .

RUN echo $(pwd)

# Replace splash adress with docker-compose splash service name
RUN sed -i 's|localhost|splash-api-server|' /app/airbnb_scraper/settings.py

VOLUME [ "/data" ]

CMD ["sh", "-c", "scrapy crawl airbnb -o ./data/data_$scraper_airbnb_city.json -a city=$scraper_airbnb_city -a price_lb=$scraper_airbnb_lb -a price_ub=$scraper_airbnb_ub -a checkin=$scraper_airbnb_checkin -a checkout=$scraper_airbnb_checkout -a newonly=$scraper_airbnb_newonly"]
