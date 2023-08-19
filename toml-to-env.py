#!/usr/bin/env python3
import sys
import toml

def main():
    if len(sys.argv) < 2:
        print("Usage: toml-to-env input.toml")
        exit(1)
    filename = sys.argv[1]
    toml_data = toml.load(filename)
    convert_table(toml_data)

def convert_table(table, prefixes=[]):
    for key, value in table.items():
        if isinstance(value, dict):
            convert_table(value, prefixes + [key])
        else:
            print_env_statement(prefixes + [key], value)

def print_env_statement(prefixes, value):
    name = "__".join(prefixes)
    print(f'{name}="{value}"')

if __name__ == "__main__":
    main()
