# Repository Monitor Action
[![pages-build-deployment](https://github.com/buluma/repo-monitor-action/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/buluma/repo-monitor-action/actions/workflows/pages/pages-build-deployment)

This Github action generates custom metrics reports including the last releases using GitHub Pages.

The example for the project itself can found at:

https://buluma.github.io/repo-monitor-action/

Please note, this action **will commit changes to the `gh-pages` branch** and use subfolders to save the metrics.

## Usage

An extensive example for this project can found at:

https://github.com/buluma/repo-monitor-action/blob/master/.github/workflows/update-monitor.yml

The following steps generate some data and push them through the action to Pages:

```
steps:
    - uses: actions/checkout@v3
    - name: Calculate project metrics
      id: projectmetrics
      run: |
        yarn
        yarn build
        SIZE=($(du -s dist/))
        echo "::set-output name=code_size::$SIZE"
    - uses: buluma/repo-monitor-action@0.1.2
      name: Update Report
      with:
        key: code-size
        value: ${{ steps.projectmetrics.outputs.code_size }}
        token: ${{ secrets.GITHUB_TOKEN }}
```

The metrics need to be configured with a custom config:

https://github.com/buluma/repo-monitor-action/blob/master/.github/repo-monitor-action/config.yml

The following config whould show the codesize as described in the action above:

```
metrics:
  code-size:
    description: Size of all source files in KB
groups:
  general:
    name: General
    description: This section shows code complexity metrics
    metrics:
      - code-size
```
