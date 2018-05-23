# Docker Image for Data Science Applications
## Usage

This Dockerfile will create a Docker image which consists of data science tools written in Python.
Currently, this Docker image will pull notebooks from the Github repository and will start the notebook server.


### Pull openebs/easy-jupyter image

```
docker pull openebs/easy-jupyter:latest
```

### Run Jupyter Notebook inside the docker container

```
docker run -e GIT_REPO=github/repo/url/to/notebooks.git -p 8888:8888 openebs/easy-jupyter:latest
```

### Optional environment variables required

```
# Github handle
GITHUB_USERNAME

# User name to be set in .gitconfig
USER_NAME

# User email address also to be set in .gitconfig
USER_EMAIL

#Github personal access token
GITHUB_TOKEN
```
