# Docker Image for Data Science Applications
## Usage

### Pull satyamz/docker-jupyter image

```
docker pull satyamz/docker-jupyter
```

### Run Jupyter Notebook

```
docker run -i -p 8888:8888 -v /local/path/to/notebooks:/home/notebooks satyamz/docker-jupyeter
```