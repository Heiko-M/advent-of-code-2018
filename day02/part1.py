#!/usr/bin/env python3

"""
Computes the checksum (number of IDs which contain a letter exactly twice times 
the number of IDs which contain a letter exactly thrice) of all IDs.
Run with `part1.py input.txt`
"""

import sys

def main(id_file_path):
    twice = 0
    thrice = 0

    with open(id_file_path, 'r') as id_file:
        for line in id_file:
            box_id = line.strip()
            if has_repeat(box_id, 2):
                twice += 1
            if has_repeat(box_id, 3):
                thrice += 1

    print("The checksum is", twice * thrice)

def has_repeat(id, n):
    for letter in id:
        count = id.count(letter)
        if count == n:
            return True
    return False

if __name__ == '__main__':
    main(sys.argv[1])
