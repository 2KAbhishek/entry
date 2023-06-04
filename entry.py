import os
import subprocess
from datetime import datetime


def get_entry_folder():
    entry_folder = os.getenv('ENTRY_DIR') or os.getcwd()
    if len(os.sys.argv) > 1:
        entry_folder = os.sys.argv[1]
    return entry_folder


def change_directory(entry_folder):
    try:
        os.chdir(entry_folder)
    except OSError as e:
        print(f"Failed to change directory: {e}")
        exit(1)


def create_file(year, month):
    file_name = datetime.now().strftime('%Y-%m-%d.md')
    os.makedirs(os.path.join(year, month), exist_ok=True)
    open(os.path.join(year, month, file_name), 'a').close()
    return file_name


def open_editor(file_path):
    editor = os.getenv('EDITOR')
    if editor:
        subprocess.run([editor, file_path])
    else:
        print(
            f"No default text editor is set. Please open the file manually: {file_path}")


def commit_changes():
    folder = os.path.basename(os.getcwd())
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    git_diff = subprocess.run(['git', 'diff', '--quiet'], capture_output=True)
    if git_diff.returncode != 0:
        subprocess.run(['git', 'add', '.'])
        subprocess.run(['git', 'commit', '-m', f'{folder} Entry: {timestamp}'],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        print(f"{folder} Entry: {timestamp}")
        subprocess.run(['git', 'pull', '--rebase', '--autostash'],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        subprocess.run(['git', 'push'], stdout=subprocess.DEVNULL,
                       stderr=subprocess.DEVNULL)


def change_to_previous_directory():
    try:
        os.chdir('-')
    except OSError as e:
        print(f"Failed to change back to the previous directory: {e}")
        exit(1)


def main():
    start_directory = os.getcwd()
    entry_folder = get_entry_folder()
    change_directory(entry_folder)

    now = datetime.now()
    year = now.strftime('%Y')
    month = now.strftime('%m')

    file_name = create_file(year, month)
    file_path = os.path.join(year, month, file_name)
    open_editor(file_path)

    commit_changes()

    change_directory(start_directory)


if __name__ == "__main__":
    main()
