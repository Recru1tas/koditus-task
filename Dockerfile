# syntax=docker/dockerfile:1

FROM golang:1.22
WORKDIR /app
COPY go.mod go.sum main.go ./

# Download depndencies
RUN go mod download

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-koditus-task

# Expose port
EXPOSE 8080

# Run
CMD ["/docker-koditus-task"]