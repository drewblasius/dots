import argparse

parser = argparse.ArgumentParser()
parser.add_argument("file", help="path to `.bashrc`, or analogous file to which overrides should be written")
parser.add_argument("--test", help="if passed, will only run as a test, printing new `file` to stdout", action="store_true")
args = parser.parse_args()

file_path = args.file
is_test = args.test

open_tag  = "# >>> created by drewblasius/dots >>>" 
close_tag = "# <<< created by drewblasius/dots <<<"

with open(".bashrc", "r") as f:
    bashrc_contents = f.read()

ext_bashrc="""
# Generated by a drewblasius/dots
# Editing by hand can be done, but edits will be automagically overwritten if dots is rerun.
""" + bashrc_contents

new_lines = []
reading = True
found_ext_bashrc = False
with open(file_path, "r+") as f:
    lines = f.readlines()
    for line in lines: 
        if open_tag in line:
            new_lines.append(open_tag)
            new_lines.append(ext_bashrc)
            new_lines.append(close_tag)
            reading, found_ext_bashrc = False, True
            continue
        elif close_tag in line:
            reading = False
            continue 

        if reading:
            new_lines.append(line)

if not found_ext_bashrc:
    new_lines.append("\n")
    new_lines.append(open_tag)
    new_lines.append(ext_bashrc)
    new_lines.append(close_tag)

new_lines = "".join(new_lines)
if is_test:
    print(new_lines)
else:
    with open(file_path, "w") as f:
        for line in new_lines:
            f.write(line)
