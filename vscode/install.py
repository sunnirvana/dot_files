#!/usr/bin/env python3
import os

with open('./extensions.txt', 'r') as f:
    exts = f.readlines()

cmd = "code --install-extension {}"
for ext in exts:
    os.system(cmd.format(ext))
