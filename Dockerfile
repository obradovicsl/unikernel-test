FROM gcc:15.2 AS build

WORKDIR /src

COPY ./helloworld.c /src/helloworld.c

RUN set -xe; \
    gcc \
	-Wall -Wextra \
	-static -no-pie \
	-o /helloworld helloworld.c

FROM scratch

COPY --from=build /helloworld /helloworld
