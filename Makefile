all: install-menshend-cli compose start-services create-menshend-services

install-menshend-cli:
	apt-get install -qy curl
	apt-get install -qy unzip
	# @TODO: how to run $(curl -s https://raw.githubusercontent.com/nebtex/menshend/master/stable.txt) instead `latest`
	curl -LO https://github.com/nebtex/menshend/releases/download/latest/menshend_linux_amd64.zip
	unzip menshend_linux_amd64.zip menshend
	cp menshend /usr/local/bin
	rm menshend
	rm menshend_linux_amd64.zip

start-services:
	docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer --no-auth

create-menshend-services:
	menshend admin apply -api http://ignu.menshend.io/v1 -f ./sampleServices/portainer.yml

compose:
	docker-compose up -d