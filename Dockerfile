FROM mcr.microsoft.com/devcontainers/miniconda:0-3

# Copy environment.yml (if found) to a temp location so we update the environment.
COPY environment.yml* /tmp/conda-tmp/
RUN if [ -f "/tmp/conda-tmp/environment.yml" ]; then umask 0002 && /opt/conda/bin/conda env update -n base -f /tmp/conda-tmp/environment.yml; fi \
    && rm -rf /tmp/conda-tmp

# Install the current version of Python (3.12).
RUN conda install -y python=3.12 \
 && pip install --no-cache-dir pipx \
 && pipx reinstall-all

# Premake the virtual environment so it can be used for testing.
COPY environment.yml .
RUN conda env create --file environment.yml

# Remove the security so the any user can use or remove the virtual environment.
RUN sudo chmod -R 777 /opt/conda/envs/
