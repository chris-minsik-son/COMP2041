#!/usr/bin/env python3

import sys
import re

inputfile = sys.argv[1]

def code_topython(line):
    match = re.search("#!\/bin\/dash", line)
    
    # If the line contains #!/bin/dash
    if match:
        # Replace it with the python substitute
        line = line.replace(match.group(0), f'#!/usr/bin/python3 -u')
    return line

def code_echo(line):
    match = re.search("echo\s+(.*)$", line)

    # If the line contains echo...
    if match:
        text = match.group(1)
        text = ' '.join(text.split())
        
        # Replace the entire matched string with printf()
        line = line.replace(match.group(0), f'print(f"{text}")')
    return line

def code_assignvar(line):
    match = re.search("(\w+)=(.*)", line)

    # If line is assigning a value to variable
    if match:
        name = match.group(1)
        variable = match.group(2)

        # Add spaces in variable assignment
        line = line.replace(match.group(0), f'{name} = "{variable}"')
    return line

def code_replacevar(line):
    line = re.sub(r"\$([a-zA-Z_-]+)", r"{\1}", line)
    if line:
        return line

def code_comment(line):
    check = re.search("#!\/usr\/bin\/python3 -u", line)
    comment = None
    if check:
        return line, comment

    match1 = re.search("#", line)
    
    # If line contains a #, this may have a comment
    if match1:
        # For example, "# This is a sample comment"
        match2 = re.search("^#\s?", line)
        if match2:
            return line, comment
        else:
            # For example, "import pandas # This is also a comment"
            comment = line.split("#")[1]
            line = line.split("#")[0]
            return line, comment
    else:
        return line, comment

def code_glob(line):
    # If line matches characters used for globbing
    line = re.sub(r"([\*\?\[\]].*[\*\?\.\[\]]?)", r"' '.join(sorted(glob.glob('\1')))", line)
    
    # If line starts with echo and is glob, replace with parantheses
    line = re.sub(r"(echo.*)(' '.join.*)", r"\1{\2}", line)
    if line:
        return line

def code_forloop(line):
    match1 = re.search("^for (.*) in (.*)$", line)

    if match1:
        # Save the variable and elements from for loop line
        variable = match1.group(1)
        elements = match1.group(2).split()
        array = "[" + ", ".join(['"' + element + '"' for element in elements]) + "]"
        line = re.sub(match1.group(0), f"for {match1.group(1)} in {array}:", line)
    return line

def code_exit(line):
    line = re.sub(r"exit\s+(\d+)", r"sys.exit(\1)", line)
    if line:
        return line

def code_read(line):
    line = re.sub(r"read (.*)", r"\1 = input()", line)
    if line:
        return line

def main():
    with open(inputfile,'r') as file:
        for line in file:
            # If the line is a for loop, don't print do or done
            if line.strip() == "do" or line.strip() == "done":
                continue

            # Reset comment variable and extract line and comment
            comment = None
            result = code_comment(line)
            line = result[0]
            comment = result[1]

            # Change first line from shell to python
            line = code_topython(line)
            
            # If line contains echo, change to printf
            line = code_echo(line)
            
            # If line contains a variable assignment
            line = code_assignvar(line)

            # If line contains a $ sign in front of variable
            line = code_replacevar(line)

            # If line contains characters used for globbing
            line = code_glob(line)
            
            # If line contains exit, change to sys.exit()
            line = code_exit(line)

            # If line is a for loop, change format to python
            line = code_forloop(line)

            # If line contains read, convert to input()
            line = code_read(line)

            print(line, end = "")
            
            if comment:
                print(f" #{comment}")

if __name__ == "__main__":
    main()
