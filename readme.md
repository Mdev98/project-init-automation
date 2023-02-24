# Project Creation Automation

## Description
This project automates the task of creating a new project, including creating a local folder, a new GitHub repository, and initializing a local git repository with an initial commit and pushing it to the newly created GitHub repository.

## Usage
To use this project, follow these steps:
1. Clone this repository to your local machine
2. Install the required Python packages by running `pip install -r requirements.txt`
3. Create a `.env` file in the project root directory with your GitHub credentials and desired project directory path in the following format:

```
USERNAME=<your_github_username>
PASSWORD=<your_github_password>
PROJECT_PATH=<path_to_your_project_directory>
```

4. Execute the `create_project.sh` script with the desired project name as an argument, e.g. `./create_project.sh my_project_name`

## Dependencies
This project requires the following dependencies to be installed:
- Python 3
- Python `dotenv` package
- Python `github` package
- Git

## Authors

Mamour DIOP
