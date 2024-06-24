# koditus-task

This is a repo for source code for the provided task. Main branch serves as a storage for source code of the app. Infrastructure-as-a-Code source is stored in "Infra" branch. 

## Application explanation
Application is written using Go and Gin to serve the API. 

Application runs on **port 8080**. The following endpoints are available:

```
:8080/alive - used for loadbalancer target group to check if target is alive.

:8080/n - where n is the index of fibonacci sequence, i.e. - 10 would return 55 and so on.
```

Application is containerized into a docker image using Github actions and uploaded to dockerhub - *docker.io/recru1tas/koditus-task*. Application is deployed to AWS ECS Fargate using *Infra* branch of this repo. Notes on the deployment can be found in the *Infra* branch README. Actions file can be found in: *.github/workflows*

*Infra* branch has no action file. Since I did not setup terraform cloud it has to be run from the users workstation.

## Notes
Containerization could be improved by using multi-stage Dockerfile to reduce image size significally using alpine image. This is a TODO if work would have continued on this project.

