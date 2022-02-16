# Geht Dahi

## MVP for the DataTour - "der Tourismus-Hackathon".

### Team Grün

The team members are Florian Bauer and Stefan Fessler, two friends having fun and hack some ideas together.

## Usage

Recommended usage is of this demo is to type in a tour name or click on a marker.

The current implementation is then moving to the tour start. After leading all data the animation is started. 

## Demo

[Demo](https://geht-dahi.at/)

## Missing Features

Currently there is all interaction diabled while the animation is active. IT would be great to have a zoom and stop action with an (open source) PR.

Also currently we donn't the tour ID and any sharing information, this would be one of the next implementations.

## TODO's

Currently the Vapor Swift backend is ~~not~~ compiling a `x86-64` docker image. This has to solved or the image has to be hosted on some `arm64` hoster but e.g. Google cloud run only supports `linux/amd64` witch is `x86-64`.

This solved, we could now use the API also to provide more dynamic (random) / tour of the day informations and also persist the used ones in postgresql db.

Before building the backend copy the Tour_de.json to `/Resources`. (>100MB -> git lfs)

### Docker

The docker container can be build with: (inside folder `vapor_backend`)

`docker compose build`

or multi architecture:

`docker buildx build --platform linux/amd64 --push -t eu.gcr.io/tourdata/tourdata .`

[info](https://www.docker.com/blog/multi-platform-docker-builds/)

### Xcode

Or with debug run with Xcode (by settung the root backend folder to execution path).