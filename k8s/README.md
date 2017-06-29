## Running Data science tools inside Kubernetes cluster



## Clone OpenEBS project repository

```
$ git clone https://github.com/openebs/openebs.git
$ cd openebs/k8s/lib/vagrant/test/k8s/1.6 
$ vagrant up kubemaster-01
$ vagrant up kubeminion-01
```

## Login to kubemaster-01

```
$ vagrant ssh kubemaster-01
```

Once logged in to kubemaster-01

#### Set following environment variable in openebs-ds.yaml


```
# Github handle
GITHUB_USERNAME

# User name to set in git config
USER_NAME

# User email address
USER_EMAIL

#Github personal access token
GITHUB_TOKEN
```



### Create pods

```
ubuntu@kubemaster-01$ kubectl create -f openebs-ds.yaml
```

### Check status of pods

```
ubuntu@kubemaster-01$ kubectl get pods
```

### Get IP address of Jupyter notebook server
```
ubuntu@kubemaster-01:~$ kubectl describe pods | grep IP
```

### Get Jupyter Notebook Server access token
```
ubuntu@kubemaster-01:~$ kubectl logs  openebs-ds-pod | grep -oP "token=.*"
```

Open browser and go to the `IP:8888` and use the token to authenticate.