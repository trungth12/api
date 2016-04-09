## INITIAL SET UP

*INSTALLATION ON MACOSX*

```
brew update
brew install docker
brew install docker-compose
brew install docker-machine
```

*INSTALLATION ON WINDOWS*

- Install `DockerToolbox`

*DEVELOPMENT ENVIRONMENT*

```
docker-machine start
docker-machine env
docker-compose up -d
```

*CREATE DB*

- Config database in `config/database.yml`
- Run command
```
docker-compose run rb1 bin/rake db:create
docker-compose run rb1 bin/rake db:migrate
```

*RUN TEST*

```
docker-compose run rb1 bin/rails test
```

### Contributing guidelines

- Clone project
- Pull from `origin/master`
- Checkout new feature
- Commit and send pull request