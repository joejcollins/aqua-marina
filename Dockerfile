FROM mcr.microsoft.com/devcontainers/anaconda:0-3

# Premake the venv.
COPY environment.yml .
RUN conda env create -f environment.yml

# Remove the security so the any user can use the virtual environment.
RUN sudo chmod -R 777 /opt/conda/envs/
