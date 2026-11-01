#!/usr/bin/env python3
"""Create a UTF-8 ZIP preserving executable modes and framework symlinks."""
import argparse
import os
from pathlib import Path
import stat
import zipfile

def package(app, destination):
    app = Path(app)
    if app.is_symlink() or not app.is_dir() or app.suffix != '.app':
        raise ValueError('Expected an actual App directory')
    with zipfile.ZipFile(destination, 'x', zipfile.ZIP_DEFLATED, compresslevel=6) as archive:
        def add(path):
            name = path.relative_to(app.parent).as_posix()
            mode = path.lstat().st_mode
            if stat.S_ISLNK(mode):
                info = zipfile.ZipInfo(name)
                info.create_system = 3
                info.external_attr = mode << 16
                archive.writestr(info, os.readlink(path).encode('utf-8'))
            elif stat.S_ISDIR(mode):
                archive.write(path, name+'/')
                for child in sorted(path.iterdir()): add(child)
            elif stat.S_ISREG(mode):
                archive.write(path, name)
            else:
                raise ValueError('Unsupported App file type: '+name)
        add(app)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('app',type=Path)
    parser.add_argument('output',type=Path)
    args = parser.parse_args()
    package(args.app,args.output)
