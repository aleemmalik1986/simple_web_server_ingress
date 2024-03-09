FROM golang:1.22

WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod ./
RUN go mod download && go mod verify

COPY . .
RUN go build -v -o /usr/local/bin/app ./...
EXPOSE 8080
CMD ["app"]


#build docker image local
#docker build -t my-golang-app .
#build docker image to push in repo
#docker build -t aleemmalikaws/test:my-golang-app-v1 .
#push docker image
#docker push aleemmalikaws/test:my-golang-app-v1
#run docker image no command prompt
#docker run -it -p 8080:8080 --rm --name my-running-app my-golang-app 
#run docker by mounting local code to docker
#docker run -p 8080:8080 -v $(pwd):/usr/src/app my-golang-app
#run docker interactively to get bash shell
#docker run -it -p 8080:80 --rm --name my-running-app my-golang-app /bin/bash
#list docker images
#docker images ls
#list docker images in repo
#docker images aleemmalikaws/test



#How to use it with helm
#create helm chart
#helm create myapp
#check helm syntax
#helm lint ./myapp
#Configure the chart add repo and image name and set nodeport to access it in values.yaml
#Configure service in templates service.yaml modify target port 8080 and give you name to port
#install app
#helm install mygolangapp ./myapp/
#helm list application
#helm list
#remove app
#helm uninstall mygolangapp

