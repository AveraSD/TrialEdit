# TrialEdit

This shiny application is for editing existing clinical trials and it is dockerized.

The following steps helps to set up the application:

### Install Docker Desktop and if using WSL, make sure WSL integration is enabled.

### From terminal, to build docker image using docker-compose, go the folder where it is located and do

`docker-compose up --build`

### This builds the docker images and containers. To check the docker images

`docker ps`

### To clean up and remove docker images and containers

`docker-compose down`

### Access the Shiny app through a web browser at:

http://127.0.0.1:3838/TrialEdit/


