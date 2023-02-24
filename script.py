from pathlib import Path
from dotenv import load_dotenv
from github import Github
import sys
import logging
import os

load_dotenv()

logging.basicConfig(level=logging.INFO,
                    filename="python.log",
                    filemode="a",
                    format="%(asctime)s - %(levelname)s - %(message)s")

def create_folder():
    # check if the required argument (project name) is provided
    if len(sys.argv) != 2:
        logging.error(f"{len(sys.argv) - 1} argument(s) provided, 1 expected.")
        sys.exit()

    # get the project name from the argument
    project_name = sys.argv[1]

    # get the project directory path from environment variables
    project_dir = Path(os.getenv('PROJECT_PATH', '/path/to/default/project/directory'))

    # create the project directory if it doesn't exist
    project_path = project_dir / project_name
    project_path.mkdir(exist_ok=True)

    # create the GitHub repository
    try:
        username = os.getenv('USERNAME')
        password = os.getenv('PASSWORD')
        g = Github(username, password)
        user = g.get_user()
        repo = user.create_repo(project_name, private=True)
        logging.info(f"Created repository: {repo.html_url}")
    except Exception as e:
        logging.error(f"Failed to create repository: {e}")
        sys.exit()

if __name__ == '__main__':
    create_folder()
