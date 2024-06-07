FROM mcr.microsoft.com/devcontainers/miniconda:0-3

# Premake the virtual environment so it can be used for testing.
COPY environment.yml .
RUN conda env create --file /tmp/conda-tmp/environment.yml

# Remove the security so the any user can use or remove the virtual environment.
RUN sudo chmod -R 777 /opt/conda/envs/
