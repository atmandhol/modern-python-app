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

In order to archieve this we will be using the following tools:
- Github. (Duh!)
- Github Actions for CI.
- DockerHub for storing the Container Image.
- ArgoCD for Continuous Delivery.
- KinD for creating Local Kubernetes cluster that will run the app as well as Argo CD.
- Open source tool called Octant from VMWare to visualize our Kubernetes cluster. (Yeah! I am a UI guy)

## Local tools installation Steps
My examples are for MacOS, if you are running Windows or Linux, please refer to the project websites linked above for installation steps.

```
# For installing KinD
brew install kind
```
