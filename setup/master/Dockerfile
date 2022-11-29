FROM golang:1.19.2-alpine

RUN apk --no-cache add gcc g++ bash make

WORKDIR /go/src/app

COPY . .

RUN go mod init master
RUN go mod tidy

EXPOSE 5000

RUN GOOS=linux go build -ldflags="-s -w" -o ./bin/master ./main.go

ENTRYPOINT ["./bin/master"]