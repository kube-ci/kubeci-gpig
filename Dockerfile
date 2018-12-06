# build stage
FROM golang:alpine AS build-env
ADD . /go/src/github.com/kube-ci/kubeci-gpig
WORKDIR /go/src/github.com/kube-ci/kubeci-gpig
RUN CGO_ENABLED=0 go build -o goapp && chmod +x goapp

# final stage
FROM alpine
COPY --from=build-env /go/src/github.com/kube-ci/kubeci-gpig/goapp /usr/bin/kubeci-gpig
ENTRYPOINT ["kubeci-gpig"]

# docker build -t kubeci/kubeci-gpig .
# docker run --rm -it kubeci/kubeci-gpig