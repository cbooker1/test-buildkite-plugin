# test-buildkite-plugin

![Build Status](https://github.com/lelia/test-buildkite-plugin/workflows/CI/badge.svg?branch=master)

A public repository for testing the CI build process for Buildkite plugins.

## Requirements

* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose](https://docs.docker.com/compose/install/)

## Parameters

### `bool_param` (boolean, required)

A boolean parameter. **Required** for testing purposes.

Example: `true`

### `str_param` (string, optional)

A string parameter. Optional for testing purposes.

Example: `"string"`

### `int_param` (integer, optional)

An integer parameter. Optional for testing purposes.

Example: `1`

## Usage

```yaml
steps:
  - label: ":buildkite: Test Plugin"
    plugins:
      - lelia/test#v0.0.1:
          bool_param: false
          str_param: "hello-world"
          int_param: 7
```

## Developing

To run the plugin tests:

```bash
docker-compose run --rm tests
```

Or use the `bk` CLI: https://github.com/buildkite/cli
