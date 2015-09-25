FROM scratch
MAINTAINER joonathan@fiji.ee
EXPOSE 5000
COPY Redirector /
ENTRYPOINT ["/Redirector"]
