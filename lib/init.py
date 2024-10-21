import os

# Define the structure of directories
directory_structure = {
    'common': {
        'constants': {},
        'enums': {},
        'extensions': {},
        'services': {}
    },
    'core': {
        'language': {},
        'locators/di': {},
        'routering': {},
        'styles': {},
        'utils': {}
    },
    'data': {
        'exceptions': {},
        'model': {},
        'local': {},
        'remote': {}
    },
    'domain': {
        'models': {},
        'request_models': {},
        'repositories': {},
        'usecases': {},
        'serviceables': {}
    },
    'presentation': {},
    'shared': {},
    'initializer.dart': None,
}

# Function to create directories and files recursively
def create_structure(base_path, structure):
    for name, content in structure.items():
        path = os.path.join(base_path, name)
        if isinstance(content, dict):
            # Create directory if content is a dict (subdirectories)
            os.makedirs(path, exist_ok=True)
            create_structure(path, content)  # Recursively create subdirectories
        else:
            # Create file if content is None (files)
            with open(path, 'w') as f:
                pass  # Create an empty file

# Set the base path to the current directory (".")
base_path = '.'

# Create the directory structure directly in the current folder
create_structure(base_path, directory_structure)

print("Directory structure created in the current directory")
