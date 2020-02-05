FROM alpine:3.10

LABEL "com.github.actions.name"="Upload Artifact"
LABEL "com.github.actions.description"="Upload artifacts to GitHub releases"
LABEL "com.github.actions.icon"="tag"
LABEL "com.github.actions.color"="green"

ENV GHR_FORK tcnksm/ghr
ENV GHR_VERSION 0.12.0

RUN apk add --no-cache curl zip

RUN sh -c "curl --silent -L https://github.com/${GHR_FORK}/releases/download/v${GHR_VERSION}/ghr_v${GHR_VERSION}_linux_amd64.tar.gz > ghr_v${GHR_VERSION}_linux_amd64.tar.gz" && \
    sh -c "tar xvzf ghr_v${GHR_VERSION}_linux_amd64.tar.gz" && \
    sh -c "mv ghr_v${GHR_VERSION}_linux_amd64/ghr /usr/local/bin/" && \
    sh -c "rm -rf ghr_v${GHR_VERSION}_linux_amd64 ghr_v${GHR_VERSION}_linux_amd64.tar.gz"

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
