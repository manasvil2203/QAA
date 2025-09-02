#!/usr/bin/env python
import argparse
def get_args():
    parser = argparse.ArgumentParser(description="A program that takes a sam file and gives us no.of mapped and unmapped reads.")
    parser.add_argument("-f", "--file", help="Specify the sam file to be used", required=True)
    return parser.parse_args()  

args = get_args()

#Globalize my variables
f: str = args.file



mapped: int = 0
unmapped: int  = 0



with open(f,"r") as fh:
    for line in fh: #for loop to go through each line in the file
        
      
            if line.startswith("@"): #if it is a header line
                continue #skip the header

            fields: list = line.strip().split("\t") #Otherwise split and strip the line according to tab
            #print(fields)
            flag: int = int(fields[1]) #Takes the second coloumn which is the flag

            if ((flag & 256) != 256): # if the current read is primary
                if((flag & 4) != 4): #if the current read is mapped
                    mapped += 1
                else:
                    unmapped += 1
        
print(f'No.of Mapped reads:{mapped}')
print(f'No.of Unmapped reads:{unmapped}')