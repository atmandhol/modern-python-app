![Github Actions CI](https://github.com/atmandhol/modern-python-app/actions/workflows/ci.yaml/badge.svg)


# Modern Python App Blueprint
This repo will serve as a boilerplate skeleton for modern python apps that are deployed using GitOps. The app is a simple flask app that returns `status:ok` when called on the `/`.

## Setup for Development
```bash
$ pip install -r requirements-dev.txt
```

## Code Quality Check and Unit Testing
To check if the code is upholding enforced standards, run:
```bash
$ black .
$ flake8 .
$ coverage run -m pytest -v
$ safety check
```

## What is GitOps?
GitOps is a paradigm or a set of practices that empowers developers to perform tasks which typically fall under the purview of IT operations. GitOps requires us to describe and observe systems with declarative specifications that eventually form the basis of continuous everything.
(Shamelessly copied from Google)

## Local tools installation Steps
My examples are for MacOS, if you are running Windows or Linux, please refer to the project websites linked above for installation steps.

In order to archieve this we will be using the following tools:
- Github. (Duh!) (to keep things simple, I will use a public repo)
- Github Actions for CI.
- DockerHub for storing the Container Image. (to keep things simple, I will use a public repo)
- ArgoCD for Continuous Delivery.
- minikube for creating Local Kubernetes cluster that will run the app as well as Argo CD.
- Open source tool called Octant from VMWare to visualize our Kubernetes cluster. (Yeah! I am a UI guy)

```bash
brew install minikube    # For installing minikube
brew install hyperkit    # A lightweight VM engine to run minikube on
brew install octant      # An Open source Kubernetes cluster management UI from VMWare
```

## Steps to get the whole pipeline running
- Create a basic App
    - Write a basic `helloworld` Flask app
    - Write some unit tests
    - Create requirements.txt
- Containerize that sumbitch!
    - Create a Dockerfile (I will not make the app dependent on env vars and secret for now to keep things simple)
- Create basic Kubernetes manifest files for Deployment, Service and Ingress.
- Create a GitHub Actions that
    - Runs unit tests
    - Runs linting and vulnerability scanning
    - If both the steps complete successfully, build a docker image and push a latest tag on public Docker Hub repo. (keeping it public for now to keep things simple)
- Create a local Kubernetes cluster using minikube
```bash
minikube start --vm-driver=hyperkit
minikube addons enable ingress
```
- Open Octant with `octant` command and make sure you see the minikube cluster up and running state.
- Install ArgoCD using kubectl commands
[Releases · argoproj/argo-cd · GitHub](https://github.com/argoproj/argo-cd/releases)
```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.1.4/manifests/install.yaml
```
- Goto Argo Server Pod on Octant and Start port forwarding on Port 8080. Click on the generated link.
- Goto Secrets and look for `argo-admin-initial-secret`, copy that value and paste it in the UI. The username is `admin`. Make sure you are able to login.
- Create an Argo CD app
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: modern-python-app
spec:
  destination:
    name: ''
    namespace: default
    server: 'https://kubernetes.default.svc'
  source:
    path: deployment
    repoURL: 'https://github.com/atmandhol/modern-python-app'
    targetRevision: HEAD
  project: default
  syncPolicy:
    automated: null
```


## Problems with this current setup and how to address it?
- Our test repo is public, work repos are almost never public unless you are working on a open source project.
- More coming soon...