import os
import sys
import shutil

def git_worktree(worktree):
   os.system(f"git worktree add {worktree}")

def parse_csv_to_dict(csv):
    if not csv:
        return {}
    return dict(kvp.split('=') for kvp in csv.split(','))

def exec_kvps(kvps, fn):
    for src, dst in kvps.items():
        fn(src, dst)

def link_files(files):
   exec_kvps(files, os.symlink)

def copy_directories(directories):
   exec_kvps(directories, shutil.copytree)

def copy_files(files):
   exec_kvps(files, shutil.copy)

def main():
   args = sys.argv

   worktree = None
   if len(args) > 1:
      worktree = args[1]

   files_to_link_csv = None
   if len(args) > 2:
      files_to_link_csv = args[2]

   files_to_copy_csv = None
   if len(args) > 3:
      files_to_copy_csv = args[3]

   directories_to_copy_csv = None
   if len(args) > 4:
      directories_to_copy_csv = args[4]

   if worktree is None:
      print("Worktree is required")
      exit(-1)

   git_worktree(worktree)
   link_files(parse_csv_to_dict(files_to_link_csv))
   copy_files(parse_csv_to_dict(files_to_copy_csv))
   copy_directories(parse_csv_to_dict(directories_to_copy_csv))

main()
