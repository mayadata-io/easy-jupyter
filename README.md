# Docker Image for Data Science Applications
## Usage

This Dockerfile will crete docker image which consists of data science tools written in python. 
Currently, this docker image will pull notebooks from github repository and will start notebook server.


### Pull satyamz/docker-jupyter image

```
docker pull satyamz/docker-jupyter:v0.3
```

### Run Jupyter Notebook

```
docker run -e GIT_REPO=github/repo/url/to/notebooks.git -p 8888:8888 satyamz/docker-jupyter:v0.3
```
