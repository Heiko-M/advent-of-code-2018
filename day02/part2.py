#!/usr/bin/env python3

"""
Identifies the two IDs which differ by exactly one letter and returns the 
letters they have in common.
Run with `part2.py input.txt`
"""

import sys

def main(id_file_path):
    ids = []
    with open(id_file_path, 'r') as id_file:
        for line in id_file:
            ids.append(line.strip())

    for id_1 in ids:
        for id_2 in ids:
            if edit_dist(id_1, id_2) == 1:
                common = ""
                for i in range(len(id_1)):
                    if id_1[i] == id_2[i]:
                        common += id_1[i]
                print("The common letters of the two box IDs are", common)
                return

    #print("The checksum is", twice * thrice)

def edit_dist(id_1, id_2):
    dist = 0
    for i in range(len(id_1)):
        if id_1[i] != id_2[i]:
            dist += 1
    return dist

if __name__ == '__main__':
    main(sys.argv[1])
