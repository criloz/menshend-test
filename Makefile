all: install-menshend-cli compose create-services

install-menshend-cli:
	apt-get install -qy curl
	apt-get install -qy unzip
	curl -LO https://github.com/nebtex/menshend/releases/download/$(curl -s https://raw.githubusercontent.com/nebtex/menshend/master/stable.txt)/menshend_linux_amd64.zip
	mkdir menshend-cli
	unzip menshend_linux_amd64.zip -d menshend-cli
	cp menshend-cli/menshend /usr/local/bin
	rm -rf menshend-cli
	rm menshend_linux_amd64.zip 

create-services:
	menshend admin apply -api http://ignu.menshend.io/v1 -f ./sampleServices/portainer.yml

compose:
	docker-compose up -d