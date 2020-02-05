# [action-upload-artifact](https://github.com/fnkr/github-action-ghr)

GitHub Action to upload artifacts to GitHub releases using [ghr](https://github.com/tcnksm/ghr).

## Secrets

- `GITHUB_TOKEN` — **required,** repository access token.

## Variables

- `RESOURCE_PATH` — **required,** path to the artifacts to upload. Specify a file or a directory.
  If you provide a directory, all files in that directory will be uploaded.

## Usage example

This will trigger on every new tag pushed.

```yaml
on: push
name: Upload artifact on push
jobs:
  release:
    name: Release Artifact
    runs-on: ubuntu-latest
    if: startsWith(github.ref, 'refs/tags/')
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Zip
        run: zip -r dist.zip dist/*
      - name: Upload
        uses: artemShelest/action-upload-artifact@master
        env:
          RESOURCE_PATH: dist.zip
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

```

## Acknowledgments

Based on [fnkr/github-action-ghr](https://github.com/fnkr/github-action-ghr).
