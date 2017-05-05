all: install-menshend-cli compose create-services

install-menshend-cli:
	apt-get install -qy curl
	apt-get install -qy unzip
	MENSHEND_STABLE=$(curl -s https://raw.githubusercontent.com/nebtex/menshend/master/stable.txt)
	curl -LO https://github.com/nebtex/menshend/releases/download/$MENSHEND_STABLE/menshend_linux_amd64.zip
	unzip menshend_linux_amd64.zip menshend
	cp menshend-cli/menshend /usr/local/bin
	rm menshend
	rm menshend_linux_amd64.zip
	unset MENSHEND_STABLE 

create-services:
	menshend admin apply -api http://ignu.menshend.io/v1 -f ./sampleServices/portainer.yml

compose:
	docker-compose up -d