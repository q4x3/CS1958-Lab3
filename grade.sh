#!/bin/bash

mkdir build

cp ./vector.hpp ./build
cp ./exceptions.hpp ./build
cp ./utility.hpp ./build
cp ./data/class-bint.hpp ./build
cp ./data/class-integer.hpp ./build
cp ./data/class-matrix.hpp ./build

test_answer() {
    DIR=$1
    echo "Testing for" $1"... May take long..."
    cp ./data/${DIR}/code.cpp ./build
    cp ./data/${DIR}/answer.txt ./build
    cd build
    g++ code.cpp -o code
    ./code > tmp.txt
    diff ./answer.txt ./tmp.txt
    if [ $? -ne 0 ];
    then
        echo "Fail test" $1"!"
    else
        echo "Success test" $1"!"
    fi;
    rm ./code.cpp ./answer.txt ./code ./tmp.txt
    cd ..
}


test_memory() {
    DIR=$1
    echo "Memory testing for" $1"... May take long..."
    cp ./data/${DIR}.memcheck/code.cpp ./build
    cp ./data/${DIR}.memcheck/answer.txt ./build
    cd build
    g++ code.cpp -o code
    ./code > tmp.txt
    diff ./answer.txt ./tmp.txt
    if [ $? -ne 0 ];
    then
        echo "Fail test" $1"!"
    else
        valgrind --tool=memcheck --leak-check=full --log-file=log.txt ./code > tmp.txt
        flagA=0
        flagB=0
        cat log.txt|while read line
        do
            strA="All heap blocks were freed -- no leaks are possible"
            strB="ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)"
            resultA=$(echo $line | grep "${strA}")
            resultB=$(echo $line | grep "${strB}")
            if [[ "$resultA" != "" ]]
            then
                echo "0 leaks"
            fi;
            if [[ "$resultB" != "" ]]
            then
                echo "0 errors"
            fi;
        done
    fi;
    rm ./code.cpp ./answer.txt ./code ./tmp.txt
    cd ..
}

echo "-------------------------Test One--------------------------"
test_answer one
test_memory one
echo "-------------------------Test Two--------------------------"
test_answer two
test_memory two
echo "------------------------Test Three-------------------------"
test_answer three
test_memory three

rm -rf build
