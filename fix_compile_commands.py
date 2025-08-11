#!/usr/bin/env python3
import json
import os
import sys

# Get paths
build_file = sys.argv[1]
output_file = sys.argv[2]
project_root = sys.argv[3]

# Read the original compile_commands.json
with open(build_file, 'r') as f:
    data = json.load(f)

# Fix paths for each entry
for entry in data:
    # Change directory to project root
    entry['directory'] = project_root
    
    # Remove ../ from file paths
    if entry['file'].startswith('../'):
        entry['file'] = entry['file'][3:]
    
    # Remove ../ from command
    entry['command'] = entry['command'].replace('../', '')

# Write fixed version
with open(output_file, 'w') as f:
    json.dump(data, f, indent=2)

print(f"Fixed compile_commands.json written to {output_file}")
