FROM rocker/geospatial:3.6.0

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  pdftk \
  libpoppler-cpp-dev \
  libgsl0-dev \
  libsodium-dev
  
RUN install2.r --error \
  magick \
  staplr \
  pdftools \
  printr \
  officer \
  available \
  googledrive \
  here

RUN installGithub.r --deps TRUE \
	dirkschumacher/encryptedRmd
