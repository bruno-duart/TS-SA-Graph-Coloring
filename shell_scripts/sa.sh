#!/bin/bash

g++ run_main_sa.cpp lib/graphs.cpp lib/solution.cpp lib/heuristics.cpp lib/metaheuristics.cpp lib/utils.cpp lib/SAGraphColoring.cpp -I include -o run_sa

#### Parameter tunning - uncomment this to run parameter tunning
### Path to the CSV file
# csv_file="instances_with_k_analysis.csv"
# tail -n +2 "$csv_file" | while IFS=';' read -r instance_name V E D xk k group; do
#     for T_max in 100 1000 5000 10000; do
#         for alpha_int in 6 7 8 9; do
#             for n_test in {1..20}; do
#                 echo ./run_sa "inst: $instance_name.col" "colors: $k" "T_max: $T_max" "alpha_int: $alpha_int" "output: results/sa/analysis/$instance_name.txt" "method: greedy" "test: $n_test"
#                 ./run_sa instances/$instance_name.col $k $T_max $alpha_int results/sa/analysis/$instance_name.txt
#             done
#         done
#     done
# done

#### Run experiments
# Path to the CSV file
csv_file="instances_with_k.csv"
tail -n +2 "$csv_file" | while IFS=';' read -r instance_name V E D xk k group; do
    for n_test in {1..10}; do
        echo ./run_sa "inst: $instance_name.col" "colors: $k" "T_max: 100" "alpha_int: 9" "output: results/sa/results/$instance_name.txt" "method: greedy" "test: $n_test"
        ./run_sa instances/$instance_name.col $k 100 9 results/sa/results/$instance_name.txt
    done
done

