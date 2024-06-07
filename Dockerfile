FROM mcr.microsoft.com/devcontainers/anaconda:0-3

# Premake the venv.
COPY environment.yml .
RUN conda env create -f environment.yml

# Remove the security so the vscode user can use the venv.
RUN sudo chmod -R 777 /opt/conda/envs/
