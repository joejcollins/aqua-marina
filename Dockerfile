FROM mcr.microsoft.com/devcontainers/anaconda:0-3

# Premake the virtual environment so it can be used for testing.
COPY environment.yml .
RUN conda env create --file environment.yml

# Remove the security so the any user can use or remove the virtual environment.
RUN sudo chmod -R 777 /opt/conda/envs/
