require 'fileutils' # this is part of the Ruby standard Library

# fileutils also has the equivalent unix commands e.g.
# cp, mv, rm, cd, chmod, chown, pwd, In, touch, mkdir, rmdir

FileUtils.copy('file_to_copy.txt', 'copied_file.txt')

# Delete file
# File.delete('file_to_delete.txt')

# Copy file
# File.rename('file_to_rename.txt', 'file_to_delete.txt')