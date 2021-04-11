# `xelatex`

XeLaTeX in a Docker container.

## Usage

- Volume `/home/xelatex/project`: project path
- Command: `.tex` file name to be compiled
- Volume `/home/xelatex/.fonts`: fonts

### Build the image locally

```bash
make [TAG=<image_tag>] build
```

### Run linters locally

```bash
make linters
```
