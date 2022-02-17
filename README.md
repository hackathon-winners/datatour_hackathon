# Geht Dahi

## MVP for the DataTour - "der Tourismus-Hackathon".

### Team Grün

The team members are `Florian Bauer` and `Stefan Fessler`, two friends having fun and hack some ideas together. Our passion is hiking with friends.

## Usage

Recommended usage is of this demo is to type in a tour name or click on a marker.

The current implementation is then moving to the tour start. After a short loading of the mapo the animation is started.

## Demo

[Demo App](https://geht-dahi.at/)

## Missing Features

Currently there is all interaction diabled while the animation is active. It would be great to have a zoom and stop action in the next version.

A button with "my position" to zoom to the `current location` would be very helpfull.

Also currently we donn't the tour ID and any sharing information in the URL, this would be one of the next implementations.

## Frontend

The frontend is a JS web application located in the folder `web_frontend`.
The main entry point's are the `index.html` & `index.js`.

The app is using [Turf](https://turfjs.org/) and [mapbox](https://www.mapbox.com/) for the WebGL rendering of the `open street map` based map.

## TODO's

Currently the Vapor Swift backend is ~~not~~ compiling a `x86-64 docker image`. This has to solved or the image has to be hosted on some arm64 hoster but e.g. Google cloud run only supports linug/amd64.

[Demo API](https://hello-a2qyxcyd4q-ey.a.run.app/tours?count=1&offset=0&random=true)

This solved we can use the API also to provide more dynamic (count, offset, random) / tour of the day informations and also persist the used ones in `postgresql db`.

Before building the backend copy the `Tour_de.json` to `/Resources`. (>100MB -> git lfs)

Currently we use the `api/all.json` file for the frontend until we connect to the Backend. The json file was genereted from the `Tour_de.xml` by uning the `transform.py`.

### Backend 

The `Vapor` backend API is located in the folder `vapor_backend`.
More information: [Vapor](https://vapor.codes/)

## Xcode

You can also run and debug the backend with `Xcode`. (PS: don't forgett to setting the root backend folder to execution path)

## Docker

The docker container can be build with:

`docker compose build`

or multi architecture:

`docker buildx build --platform linux/amd64 --push -t eu.gcr.io/tourdata/tourdata .`

[info](https://www.docker.com/blog/multi-platform-docker-builds/)