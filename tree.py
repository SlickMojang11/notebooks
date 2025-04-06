import os

def generate_tree(start_path='.', prefix=''):
    entries = sorted(os.listdir(start_path))
    entries = [e for e in entries if not e.startswith('.')]  # skip hidden files

    for index, entry in enumerate(entries):
        path = os.path.join(start_path, entry)
        connector = '└── ' if index == len(entries) - 1 else '├── '
        print(prefix + connector + entry)

        if os.path.isdir(path):
            extension = '    ' if index == len(entries) - 1 else '│   '
            generate_tree(path, prefix + extension)

# Example usage:
# generate_tree("X:/NoteBook-X")  # Replace with your actual path
generate_tree("X:/NoteBook-X")  # For current directory