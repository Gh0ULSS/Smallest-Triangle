# Student Author: Min Htut Myat 
# Student Number: 540207613
# Systems Programming Assignment 1

import sys
import argparse
import random
import math

# Enforce assignment constraints
def enforce_constraints(noofpoint,mindist,seed):
    # Number of 2Dpoint generated cannot be lesser than zero 
    if int(noofpoint) < 0:
        sys.stderr.write("N less than zero\n")
        sys.exit(-1)
    # mindist is from the range from 0 to 10 
    elif int(mindist) < 0 or int(mindist) > 10:
        sys.stderr.write("mindist outside range\n")
        sys.exit(-2)
    # check N > 10000 / (PI * mindist^2)
    elif int(noofpoint) > (10000/ (math.pi * int(math.pow(mindist,2)))):
        sys.stderr.write("point saturation\n")
        sys.exit(-3)


# Generate 2D points
def generate_points(noofpoints,mindist,seed):
    counter = 0
    twoDpoints = []

    # using rseed cmdarg heres
    random.seed(int(seed))

    #----------- Try truncate() -------------
    while int(noofpoints) > counter :
        # randomly generate 2D points with seed    
        randpoint = [round(random.uniform(-50,50),2), round(random.uniform(-50,50),2)]
        #print(randpoint)
        iswithinmindist = True
        for point in twoDpoints:
            # Calculate euclidean distance between 2 points
            edistance = math.sqrt((math.pow(randpoint[0] - point[0],2)) + (math.pow(randpoint[1] - point[1],2)))
            # checking if any 2 points is lesser than minimum distance
            # -mindist=2 means no any 2 points generated are distance 2
            if int(mindist) > edistance:
               iswithinmindist = False
               break
        if iswithinmindist:
           twoDpoints.append(randpoint)
           counter += 1
    # Output the points
    for point in twoDpoints:
        print(str(point[0]) + ", " + str(point[1]))

def main():
    # set command line arguments as per assignment specifications
    parsecmdargs = argparse.ArgumentParser(description="Program to generate a set of 2D points")
    parsecmdargs.add_argument("-N", type=int, required=True ,help="Number of 2D points to generate")
    parsecmdargs.add_argument("-mindist", type=int, required=True ,help="Minimum distance of any 2D points generated")
    parsecmdargs.add_argument("-rseed", type=int, help="seed to randomly generate 2D points")

    # handle for command line arguments missing or cannot be parsed 
    try:
        cmdargs = parsecmdargs.parse_args()
    except argparse.ArgumentError as e:
        sys.exit(-4)
    except ValueError as e:
        sys.exit(-4)

    enforce_constraints(cmdargs.N,cmdargs.mindist,cmdargs.rseed)
    generate_points(cmdargs.N,cmdargs.mindist,cmdargs.rseed)

# use proper code structure with functions
if __name__ == "__main__":
    main()
