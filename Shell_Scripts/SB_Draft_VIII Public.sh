#!/bin/bash

# start caffeinate in the background to prevent the system from sleeping
caffeinate -di &

# save the PID of the caffeinate process
caffeinate_pid=$!

# trap EXIT to ensure caffeinate process is killed when the script exits
trap "kill $caffeinate_pid" EXIT

# prompt the user for input
read -p 'Enter the year: ' year
read -p 'Enter the quarter: ' quarter

# activate the virtual environment
source SB/bin/activate

# define the base path for notebooks
NOTEBOOK_PATH="/Users/rileybitterli/Documents/GitHub/SB_VIII_Streamlined/Training_Data_Scraper"

# execute the notebooks with parameters using papermill
papermill "${NOTEBOOK_PATH}/PROD Step 1 (Scraper).ipynb" "${NOTEBOOK_PATH}/Output Step 1.ipynb" -p year "$year" -p quarter "$quarter"
papermill "${NOTEBOOK_PATH}/PROD Step 2 (Parser).ipynb" "${NOTEBOOK_PATH}/Output Step 2.ipynb" -p year "$year" -p quarter "$quarter"
papermill "${NOTEBOOK_PATH}/PROD Step 3 (Feature Eng).ipynb" "${NOTEBOOK_PATH}/Output Step 3.ipynb" -p year "$year" -p quarter "$quarter"

# deactivate the virtual environment
deactivate
