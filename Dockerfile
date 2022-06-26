# Alpine is chosen for its small footprint
# compared to Ubuntu
FROM golang:1.18-alpine as development

# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git

# Set the current working directory inside the container
WORKDIR /app

# Download necessary Go modules
COPY go.mod ./
COPY go.sum ./
RUN go mod download

# Copy source code into the image
COPY . .

# Install Reflex for development
RUN go install github.com/cespare/reflex@latest

# Compile the app
# RUN go build -o /go-api

# Expose port
EXPOSE 8080

# Start app
# CMD [ "/go-api" ]
CMD reflex -g '*.go' go run main.go --start-service