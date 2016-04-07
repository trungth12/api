## README

INITIAL SET UP
brew update
brew install docker
brew install docker-compose
brew install docker-machine

DEVELOPMENT ENVIRONMENT
git clone api folder

docker-machine start
docker-machine env
docker-compose up -d


Create DB
docker exect -it api_db rake db:create