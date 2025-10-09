# Find Latest Prerelease Action

A GitHub Action to find the latest prerelease version of a repository.

## Usage

```yaml
- name: Find Latest Prerelease
  id: find-prerelease
  uses: optivem/find-latest-prerelease-action@v1
  with:
    repo-owner: 'your-org'
    repo-name: 'your-repo'

- name: Use the prerelease version
  run: echo "Latest prerelease: ${{ steps.find-prerelease.outputs.latest-prerelease }}"
```

## Inputs

| Name | Description | Required | Default |
|------|-------------|----------|---------|
| `repo-owner` | Repository owner (organization or username) | Yes | - |
| `repo-name` | Repository name | Yes | - |

## Outputs

| Name | Description |
|------|-------------|
| `latest-prerelease` | Tag name of the latest prerelease version (empty if latest release is not a prerelease) |

## Requirements

This action requires the GitHub CLI (`gh`) to be available. It's automatically available in GitHub-hosted runners.

## Example

```yaml
name: Get Latest Prerelease

on:
  workflow_dispatch:

jobs:
  find-prerelease:
    runs-on: ubuntu-latest
    steps:
      - name: Find Latest Prerelease
        id: find-prerelease
        uses: optivem/find-latest-prerelease-action@v1
        with:
          repo-owner: 'microsoft'
          repo-name: 'vscode'
      
      - name: Display Result
        run: |
          echo "Latest prerelease version: ${{ steps.find-prerelease.outputs.latest-prerelease }}"
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
