# syntax=docker/dockerfile:1

FROM golang:1.22
WORKDIR /app
COPY go.mod go.sum main.go ./

# Download depndencies
RUN go mod download

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-fibo-seq

# Expose port
EXPOSE 8080

# Run
CMD ["/docker-fibo-seq"]