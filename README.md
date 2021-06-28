[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)

# Modern Python App Blueprint
This repo will serve as a boilerplate skeleton for modern python apps. It will use the most wildly popular projects with incredible community support. This blueprint will only use the 
open source projects as dependencies.

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
