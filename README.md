# scraper_airbnb

## Change Log

- `checkin`, `checkout` and `newonly` variables converted to class variables.

- Changed splash-server url from `localhost` to docker-compose splash-server service url `splash-api-server`

- Removed unnecessary files and folders

- Created Dockerfile that sets python arguments from environment variables.

- Created docker-compose file that supports splash-server and multiple scraper service.

## Folder Structure

```bash
.
├── Dockerfile
├── README.md
├── airbnb_scraper
│   ├── __init__.py
│   ├── items.py
│   ├── middlewares.py
│   ├── pipelines.py
│   ├── settings.py
│   └── spiders
│       ├── __init__.py
│       └── airbnb.py
├── data                  ---> Docker volume folder
├── docker-compose.yml
└── scrapy.cfg
```

## Building Image

Use following command to build image:

```bash
docker-compose -f .\docker-compose.yml build
```

## Running Image

Use following command to run image:

```bash
docker-compose -f .\docker-compose.yml up
```

## Stopping Image

Use following command to run image:

```bash
docker-compose -f .\docker-compose.yml down

#if you want to remove volume also
docker-compose -f .\docker-compose.yml down -v
```

## Using Volumes

You can use following volume types:

* Docker named volume (Preferred):

```yml
volumes:
  - "scraper_airbnb_data:/app/data"
```

* Linux style mount volume

```yml
volumes:
  - "./data:/app/data"
```

* Windows style mount volume

```yml
volumes:
  - "C:/...fullpath.../scraper_airbnb/data:/app/data"
```




