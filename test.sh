#!/bin/bash

# Student Author: Min Htut Myat 
# Student Number: 540207613
# Systems Programming Assignment 1 -> testing script Generator and Searcher

# ---------- Generator Program Test Cases -----------------
# Test cases input
inTC1=$(cat "tests/generator/TC1 generator.in")
inTC2=$(cat "tests/generator/TC2 generator.in")
inTC3=$(cat "tests/generator/TC3 generator.in")
inTC4=$(cat "tests/generator/TC4 generator.in")
inTC5=$(cat "tests/generator/TC5 generator.in")
inTC6=$(cat "tests/generator/TC6 generator.in")
inTC7=$(cat "tests/generator/TC7 generator.in")
inTC8=$(cat "tests/generator/TC8 generator.in")
inTC9=$(cat "tests/generator/TC9 generator.in")
inTC10=$(cat "tests/generator/TC10 generator.in")
inTC11=$(cat "tests/generator/TC11 generator.in")
inTC12=$(cat "tests/generator/TC12 generator.in")
inTC13=$(cat "tests/generator/TC13 generator.in")
inTC14=$(cat "tests/generator/TC14 generator.in")

# Test cases expected output
outTC1=$(cat "tests/generator/TC1 generator.out")
outTC2=$(cat "tests/generator/TC2 generator.out")
outTC3=$(cat "tests/generator/TC3 generator.out")
outTC4=$(cat "tests/generator/TC4 generator.out")
outTC5=$(cat "tests/generator/TC5 generator.out")
outTC6=$(cat "tests/generator/TC6 generator.out")
outTC7=$(cat "tests/generator/TC7 generator.out")
outTC8=$(cat "tests/generator/TC8 generator.out")
outTC9=$(cat "tests/generator/TC9 generator.out")
outTC10=$(cat "tests/generator/TC10 generator.out")
outTC11=$(cat "tests/generator/TC11 generator.out")
outTC12=$(cat "tests/generator/TC12 generator.out")
outTC13=$(cat "tests/generator/TC13 generator.out")
outTC14=$(cat "tests/generator/TC14 generator.out")

# ---------- Searcher Program Test Cases ------------------
#Test cases input
inTC1S='tests/searcher/TC1 Searcher.in'
inTC2S='tests/searcher/TC2 Searcher.in'
inTC3S='tests/searcher/TC3 Searcher.in'
inTC4S='tests/searcher/TC4 Searcher.in'
inTC5S='tests/searcher/TC5 Searcher.in'
inTC6S='tests/searcher/TC6 Searcher.in'
inTC7S='tests/searcher/TC7 Searcher.in'
inTC8S='tests/searcher/TC8 Searcher.in'
inTC9S='tests/searcher/TC9 Searcher.in'

# Test cases expected output
outTC1S=$(cat "tests/searcher/TC1 Searcher.out")
outTC2S=$(cat "tests/searcher/TC2 Searcher.out")
outTC3S=$(cat "tests/searcher/TC3 Searcher.out")
outTC4S=$(cat "tests/searcher/TC4 Searcher.out")
outTC5S=$(cat "tests/searcher/TC5 Searcher.out")
outTC6S=$(cat "tests/searcher/TC6 Searcher.out")
outTC7S=$(cat "tests/searcher/TC7 Searcher.out")
outTC8S=$(cat "tests/searcher/TC8 Searcher.out")
outTC9S=$(cat "tests/searcher/TC9 Searcher.out")

# ---------- Generator Program Testing -----------------
# Run the tests
echo "Searcher Program Testing....."
actout1=$(python3 gen_points.py $inTC1)

echo "NOTE: For test cases testing errors, it will print the error message and when error occurs nothing is being written to stdout"
echo "                                          "

# using diff command to output differences: actual vs expected 
if diff -ab -B <(echo "$outTC1") <(echo "$actout1") 
then
   echo "Test case 1 - passed"
else
   echo "Test case 1 - failed"
fi

actout2=$(python3 gen_points.py $inTC2)

if diff -ab -B <(echo "$outTC2") <(echo "$actout2") 
then
   echo "Test case 2 - passed"
else
   echo "Test case 2 - failed"
fi

actout3=$(python3 gen_points.py $inTC3)

if diff -ab -B <(echo "$outTC3") <(echo "$actout3") 
then
   echo "Test case 3 - passed"
else
   echo "Test case 3 - failed"
fi

actout4=$(python3 gen_points.py $inTC4)

if diff -ab -B <(echo "$outTC4") <(echo "$actout4") 
then
   echo "Test case 4 - passed"
else
   echo "Test case 4 - failed"
fi

actout5=$(python3 gen_points.py $inTC5)
if diff -ab -B <(echo $outTC5) <(echo $actout5) 
then
   echo "Test case 5 - passed"
else
   echo "Test case 5 - failed"
fi

actout6=$(python3 gen_points.py $inTC6)
if diff -ab -B <(echo $outTC6) <(echo $actout6) 
then
   echo "Test case 6 - passed"
else
   echo "Test case 6 - failed"
fi

actout7=$(python3 gen_points.py $inTC7)
if diff -ab -B <(echo $outTC7) <(echo $actout7) 
then
   echo "Test case 7 - passed"
else
   echo "Test case 7 - failed"
fi

actout8=$(python3 gen_points.py $inTC8)
if diff -ab -B <(echo $outTC8) <(echo "$actout8") 
then
   echo "Test case 8 - passed"
else
   echo "Test case 8 - failed"
fi

actout9=$(python3 gen_points.py $inTC9)
if diff -ab -B <(echo $outTC9) <(echo "$actout9") 
then
   echo "Test case 9 - passed"
else
   echo "Test case 9 - failed"
fi

actout10=$(python3 gen_points.py $inTC10)
if diff -ab -B <(echo $outTC10) <(echo "$actout10") 
then
   echo "Test case 10 - passed"
else
   echo "Test case 10 - failed"
fi

actout11=$(python3 gen_points.py $inTC11)
if diff -ab -B <(echo $outTC11) <(echo "$actout11") 
then
   echo "Test case 11 - passed"
else
   echo "Test case 11 - failed"
fi

actout12=$(python3 gen_points.py $inTC12)
if diff -ab -B <(echo $outTC12) <(echo $actout12) 
then
   echo "Test case 12 - passed"
else
   echo "Test case 12 - failed"
fi

actout13=$(python3 gen_points.py $inTC13)
if diff -ab -B <(echo $outTC13) <(echo $actout13) 
then
   echo "Test case 13 - passed"
else
   echo "Test case 13 - failed"
fi

actout14=$(python3 gen_points.py $inTC14)
if diff -ab -B <(echo $outTC14) <(echo "$actout14") 
then
   echo "Test case 14 - passed"
else
   echo "Test case 14 - failed"
fi

# ---------- Searcher Program Testing -----------------
echo "                        "
echo "Searcher Program Testing....."
echo "                        "

actout1S=$(./smallest_triangle < "$inTC1S")

if diff -ab -B <(echo "$outTC1S") <(echo "$actout1S") 
then
   echo "Test case 1 - passed"
else
   echo "Test case 1 - failed"
fi

actout2S=$(./smallest_triangle < "$inTC2S")

if diff -ab -B <(echo "$outTC2S") <(echo "$actout2S") 
then
   echo "Test case 2 - passed"
else
   echo "Test case 2 - failed"
fi

actout3S=$(./smallest_triangle < "$inTC3S")

if diff -ab -B <(echo "$outTC3S") <(echo "$actout3S") 
then
   echo "Test case 3 - passed"
else
   echo "Test case 3 - failed"
fi

actout4S=$(./smallest_triangle < "$inTC4S")

if diff -ab -B <(echo "$outTC4S") <(echo "$actout4S") 
then
   echo "Test case 4 - passed"
else
   echo "Test case 4 - failed"
fi

actout5S=$(./smallest_triangle < "$inTC5S")
if diff -ab -B <(echo "$outTC5S") <(echo "$actout5S") 
then
   echo "Test case 5 - passed"
else
   echo "Test case 5 - failed"
fi

actout6S=$(./smallest_triangle < "$inTC6S")
if diff -ab -B <(echo "$outTC6S") <(echo "$actout6S") 
then
   echo "Test case 6 - passed"
else
   echo "Test case 6 - failed"
fi

actout7S=$(./smallest_triangle < "$inTC7S")
if diff -ab -B <(echo "$outTC7S") <(echo "$actout7S") 
then
   echo "Test case 7 - passed"
else
   echo "Test case 7 - failed"
fi

actout8S=$(./smallest_triangle < "$inTC8S")
if diff -ab -B <(echo "$outTC8S") <(echo "$actout8S") 
then
   echo "Test case 8 - passed"
else
   echo "Test case 8 - failed"
fi

actout9S=$(./smallest_triangle < "$inTC9S")
if diff -ab -B <(echo "$outTC9S") <(echo "$actout9S") 
then
   echo "Test case 9 - passed"
else
   echo "Test case 9 - failed"
fi