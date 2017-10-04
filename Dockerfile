FROM debian:8.8

MAINTAINER Satyam Zode <satyamzode@gmail.com>

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    ANACONDA_VERSION=`wget https://repo.continuum.io/archive -q -O - | grep -o "Anaconda.-.....-Linux-x86_64.sh" | sort | tail -1`
    wget --quiet https://repo.continuum.io/archive/${ANACONDA_VERSION} -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

ENV PATH /opt/conda/bin:$PATH

ADD launch.sh jupyter_notebook_config.py openebs_utils.py /

ENV GIT_REPO https://github.com/satyamz/ml-playground.git

EXPOSE 8888

ENTRYPOINT [ "/usr/bin/tini", "--" ]

CMD ["/launch.sh"]
