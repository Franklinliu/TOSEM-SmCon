#!/bin/bash

output_dir=$1
contract_name=$2

java -jar ~/Project/SpecCon-Tool/LearnLibAlgorithm/learnlib-demo/target/learnlib-demo-1.0-SNAPSHOT.jar --input $output_dir/$contract_name.method-traces.txt --output $output_dir/BlueFringeMDLDFA.dot  
