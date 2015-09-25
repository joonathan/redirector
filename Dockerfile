FROM scratch
MAINTAINER joonathan@fiji.ee
EXPOSE 5000
COPY redirector /
ENTRYPOINT ["/redirector"]
