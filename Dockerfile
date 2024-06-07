FROM mcr.microsoft.com/devcontainers/anaconda:0-3

# Premake the virtual environment so it can be used for testing.
COPY environment.yml /tmp/conda/
RUN conda env create --file /tmp/conda/environment.yml --prefix /tmp/conda/.conda
