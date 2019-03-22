FROM poldracklab/fmriprep:1.3.2

RUN pip install --no-cache-dir notebook==5.* \
    && pip install --no-cache-dir -U git+https://github.com/oesteban/nibabel@enh/transforms#egg=nibabel \
    && rm -rf ~/.cache/pip/* \
    && sync

ENV NB_USER jovyan
ENV NB_UID 1001
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

WORKDIR ${HOME}

ENTRYPOINT []
