FROM registry.access.redhat.com/ubi9:latest AS builder

WORKDIR /usr/local/bin

RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

COPY . /usr/share/architecture

WORKDIR /usr/share/architecture

RUN kustomize build examples/va/hci/control-plane/nncp -o /tmp/01-nncp.yaml

FROM scratch

COPY --from=builder /tmp/01-nncp.yaml /01-nncp.yaml
