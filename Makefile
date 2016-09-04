.PHONY: build
build: Dockerfile entrypoint.sh
	docker build -t cjdns .

run: etc/cjdroute.conf
	mkdir -p etc/cjdns
	docker run -it --rm --cap-add=NET_ADMIN --device=/dev/net/tun --volume="$(shell pwd)/etc:/etc/cjdns" cjdns /entrypoint.sh

etc/cjdroute.conf:
	mkdir _build
	docker run --rm cjdns cjdroute --genconf > _build/cjdroute.conf
	cat _build/cjdroute.conf | docker run -i --rm cjdns cjdroute --cleanconf > etc/cjdroute.conf
