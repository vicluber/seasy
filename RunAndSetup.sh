#!/bin/bash


echo "Setup and run? (y/n)"
read initialize

dockerContainer=seasy-workspace

runDocker() {
	docker-compose up -d
}
runComposer() {
	docker exec $dockerContainer composer update
}
runNmp() {
	docker exec $dockerContainer npm install
}
runArtisan() {
	docker exec $dockerContainer php artisan key:generate
}
if [ "$initialize" == "y" ] 
	then 
		echo "### Running docker-compose ###"
		
		runDocker

		runComposer

		runNmp

		runArtisan
fi