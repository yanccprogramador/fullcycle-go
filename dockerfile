FROM golang:alpine AS builder

WORKDIR /src
COPY . .
RUN go build main.go

FROM scratch

WORKDIR /
COPY --from=builder /src / 
CMD ["./main"]