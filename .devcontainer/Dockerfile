# Get a Rocker image (without LaTeX).
FROM ghcr.io/rocker-org/devcontainer/tidyverse:4.4

# Install uv for everyone not just the current user.
RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && cp /root/.local/bin/uv /usr/local/bin/uv

# Install LaTeX and packages to support the R packages.
RUN apt-get --quiet update \
    && apt-get install --assume-yes texlive-latex-extra texlive-extra-utils latexmk \
    && apt-get install --assume-yes libgdal-dev libgeos-dev libproj-dev libtbb-dev gdal-bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Pre populate the renv cache with the packages we need.
ENV RENV_PATHS_CACHE=/opt/renv/cache
COPY renv.lock renv.lock
RUN R -e "install.packages('renv'); renv::restore()"

# Add some labels so it looks nice in Github packages.
LABEL org.opencontainers.image.title="aqua-marina dev image"
LABEL org.opencontainers.image.description="R Server with LaTeX image for aqua-marina"
LABEL org.opencontainers.image.source=https://github.com/joejcollins/aqua-marina/
LABEL org.opencontainers.image.version="0.0.1"
LABEL org.opencontainers.image.authors="Joe J Collins <joejcollins@gmail.com>"
