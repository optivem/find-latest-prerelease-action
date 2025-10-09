# Contributing to Find Latest Prerelease Action

Thank you for your interest in contributing to this project! We welcome contributions from the community.

## Getting Started

1. Fork the repository
2. Clone your fork locally
3. Create a new branch for your changes
4. Make your changes
5. Test your changes
6. Submit a pull request

## Development

### Prerequisites

- PowerShell (for testing the action script locally)
- GitHub CLI (`gh`) for testing the functionality

### Testing Locally

You can test the PowerShell script locally:

```powershell
.\action.ps1 -RepoOwner "microsoft" -RepoName "vscode"
```

### Testing the Action

The action is automatically tested on multiple platforms when you create a pull request. The test workflow will run on Ubuntu, Windows, and macOS.

## Code Style

- Use clear, descriptive variable names
- Add comments for complex logic
- Follow PowerShell best practices
- Include error handling

## Submitting Changes

1. Ensure your code follows the project's coding standards
2. Add or update tests as necessary
3. Update documentation if you're changing functionality
4. Make sure all tests pass
5. Submit a pull request with a clear description of your changes

## Reporting Issues

If you find a bug or have a feature request, please create an issue on GitHub with:

- A clear description of the problem or feature request
- Steps to reproduce (for bugs)
- Expected behavior
- Actual behavior
- Any relevant error messages

## Code of Conduct

This project follows the [GitHub Community Guidelines](https://docs.github.com/en/site-policy/github-terms/github-community-guidelines). Please be respectful and constructive in all interactions.

## License

By contributing to this project, you agree that your contributions will be licensed under the MIT License.