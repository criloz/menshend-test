all: install-menshend-cli compose create-menshend-services

install-menshend-cli:
	apt-get install -qy curl
	apt-get install -qy unzip
	# @TODO: how to run $(curl -s https://raw.githubusercontent.com/nebtex/menshend/master/stable.txt) instead `latest`
	curl -LO https://github.com/nebtex/menshend/releases/download/latest/menshend_linux_amd64.zip
	unzip menshend_linux_amd64.zip menshend
	cp menshend /usr/local/bin
	rm menshend
	rm menshend_linux_amd64.zip

create-menshend-services:
	# @TODO: Why is not working? find ./sampleServices -type f -exec echo "Creating service '{}', menshend admin apply -api http://ignu.menshend.io/v1 -f '{}'" \;
	menshend admin apply -api http://ignu.menshend.io/v1 -f ./sampleServices/portainer.yml
	menshend admin apply -api http://ignu.menshend.io/v1 -f ./sampleServices/mongo-express.yml
	menshend admin apply -api http://ignu.menshend.io/v1 -f ./sampleServices/pgweb.yml

compose:
	docker-compose up -d