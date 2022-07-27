FROM python:3.10-bullseye
ARG OCTOPRINT_VERSION=1.8.1
RUN useradd octoprint -u 1000 -m -d /octoprint
USER 1000
WORKDIR /octoprint
ENV PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/octoprint/.local/bin
RUN git clone --depth=1 -b ${OCTOPRINT_VERSION} https://github.com/OctoPrint/OctoPrint tmp && \
    pip install /octoprint/tmp && \
    rm -rf /octoprint/tmp
CMD /octoprint/.local/bin/octoprint serve
