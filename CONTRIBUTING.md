Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
SPDX-License-Identifier: MIT-0

# Contributing to the GenAIID AgentCore Starter Pack (GASP)

Thank you for your interest in contributing to the GenAIID AgentCore Starter Pack (GASP)! This document provides guidelines and instructions for contributing to this project.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
  - [Development Environment Setup](#development-environment-setup)
  - [Project Structure](#project-structure)
- [Development Workflow](#development-workflow)
  - [Use of AI Coding Assistants (Q CLI, Cline, Kiro, etc)](#use-of-ai-coding-assistants-q-cli-cline-kiro-etc)
  - [Branching Strategy](#branching-strategy)
  - [Making Changes](#making-changes)
  - [Testing Your Changes](#testing-your-changes)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Documentation](#documentation)
- [Reporting Bugs/Feature Requests](#reporting-bugsfeature-requests)

## Code of Conduct

This project has adopted the [Amazon Open Source Code of Conduct](https://aws.github.io/code-of-conduct) (even though this code is not open sourced).
For more information see the [Code of Conduct FAQ](https://aws.github.io/code-of-conduct-faq) or contact
opensource-codeofconduct@amazon.com with any additional questions or comments.

## Getting Started

### Development Environment Setup

1. **Prerequisites**:
   - Bash shell (Linux, MacOS)
   - AWS CLI
   - AWS SAM CLI
   - Python 3.11 or later
   - Docker

2. **Fork and Clone the Repository**:
   TODO

3. **Install Dependencies and test local build**:

TODO

### Project Structure

Familiarize yourself with the project structure:

- `docs/`: Documentation files
- `infra/`: Infrastructure as Code (IaC) lives here (CDK)
- `patterns/`: Implementation of Agentic patterns to be deployed into AgentCore
- `scripts/`: Utility scripts for development, testing, and deployment
- `frontend/`: Web UI components (React)

## Development Workflow

### Use of AI Coding Assistants (Q CLI, Cline, Kiro, etc)
Use of AI coding assistants is encouraged when developing this code base. However, **the developer leveraging AI should be able to explain every line of code that AI wrote, without the help of AI**. So, use it slowly, and understand what is doing before hitting "`y`".

### Branching Strategy

1. Create a branch from `develop` for your work:
   ```bash
   git checkout -b feature/your-feature-name
   ```
   
   Use prefixes like `feature/`, `fix/`, `docs/` to indicate the type of change.

### Making Changes

1. Make your changes in the appropriate files
2. Keep changes focused on a single issue or feature
3. Write/update tests as necessary
4. Ensure code passes linting rules:
   - For Python code: `ruff` is configured for this project
   - For UI code: ESLint is configured in `frontend/.eslintrc`

### Testing Your Changes

1. **Local Testing**:
   ```bash
   TODO

   # Verify UI code passes linting checks
   cd src/ui/
   npm run lint
   ```

2. **Integration Testing**:
   TODO

## Pull Request Process

1. **Update Documentation**: Ensure all documentation affected by your changes is updated
2. **Run Tests**: Verify that your changes pass all tests
3. **Create a Pull Request**: Submit a PR with a clear description of:
   - What the changes do
   - Why the changes are needed
   - Any relevant context or considerations
4. **Address Review Feedback**: Be responsive to review comments and make requested changes
5. **Merge**: Once approved, your contribution will be merged

## Coding Standards

- **Python**: Follow PEP 8 style guidelines
- **JavaScript/TypeScript**: Follow the ESLint configuration in the project
- **Documentation**: Update relevant documentation for any changes to functionality
- **Commit Messages**: Write clear, descriptive commit messages
- **Versioning**: Follow semantic versioning principles

## Documentation

- Update `README.md` when adding significant features
- Add detailed documentation to `/docs` for new patterns or major features
- Include code comments for complex logic or non-obvious implementations
- Update configuration examples if you modify the configuration structure

## Reporting Bugs/Feature Requests

We welcome you to use the [GitLab issue tracker](https://code.aws.dev/proserve/genaiid/reusable-assets/genaiid-agentcore-starter-pack/-/issues) to report bugs or suggest features for the GASP solution.


---

Thank you for contributing to the GenAIID AgentCore Starter Pack (GASP)!
