.PHONY: build
build: Dockerfile entrypoint.sh
	docker build -t cjdns .

run: etc/cjdroute.conf
	mkdir -p etc/cjdns
	./run.sh

etc/cjdroute.conf:
	mkdir _build
	docker run --rm cjdns cjdroute --genconf > _build/cjdroute.conf
	cat _build/cjdroute.conf | docker run -i --rm cjdns cjdroute --cleanconf > etc/cjdroute.conf
