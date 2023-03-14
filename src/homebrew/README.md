
# Homebrew (homebrew)

Installs Homebrew

## Example Usage

```json
"features": {
    "ghcr.io/DanielMajoinen/devcontainer-features/homebrew:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| shallowClone | Install Homebrew using shallow clone. Shallow clone allows significant reduction in the installation size at the expense of not being able to run `brew update`, which effectively means the package index will be frozen at the moment of the image creation. | boolean | false |
| packages | A list of packages to install after Homebrew is available. | string | - |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/DanielMajoinen/devcontainer-features/blob/main/src/homebrew/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
