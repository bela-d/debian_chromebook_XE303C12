all:	check run

check:
	docker run --rm -v "$(shell pwd)/scripts":/mnt mvdan/shfmt -d /mnt/build.sh
	docker run --rm -v "$(shell pwd)/scripts":/mnt mvdan/shfmt -d /mnt/docker_build.sh
	docker run --rm -v "$(shell pwd)/scripts":/mnt mvdan/shfmt -d /mnt/install.sh

format:
	docker run --rm -v "$(shell pwd)/scripts":/mnt mvdan/shfmt -w /mnt/build.sh
	docker run --rm -v "$(shell pwd)/scripts":/mnt mvdan/shfmt -w /mnt/docker_build.sh
	docker run --rm -v "$(shell pwd)/scripts":/mnt mvdan/shfmt -w /mnt/install.sh

build:
	bash ./scripts/docker_build.sh || true

.PHONY: check format build
