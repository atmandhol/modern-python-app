![Github Actions CI](https://github.com/atmandhol/modern-python-app/actions/workflows/ci.yaml/badge.svg)


# Modern Python App Blueprint
This repo will serve as a boilerplate skeleton for modern python apps that are deployed using GitOps. 

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

