# Use the same base image as the devcontainer
FROM mcr.microsoft.com/devcontainers/base:alpine3.23

# Install Python and PDF processing packages via apk (only pypdf is available)
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-pypdf

# Install remaining PDF packages via pip (use --break-system-packages for Alpine's externally managed environment)
RUN pip install --break-system-packages --no-cache-dir --upgrade pip && \
    pip install --break-system-packages --no-cache-dir pdfplumber pymupdf pdfminer.six
