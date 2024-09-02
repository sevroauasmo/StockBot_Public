#!/bin/bash

# start caffeinate in the background to prevent the system from sleeping
caffeinate -di &

# save the PID of the caffeinate process
caffeinate_pid=$!

# trap EXIT to ensure caffeinate process is killed when the script exits
trap "kill $caffeinate_pid" EXIT

source sb_daily/bin/activate


# define the base path for notebooks
NOTEBOOK_PATH="/Users/rileybitterli/Documents/GitHub/SB_VIII_Streamlined/Daily_Workflow/Python_Notebooks"

# execute the notebooks using nbconvert
jupyter nbconvert --to notebook --execute "${NOTEBOOK_PATH}/1. StockBot Draft VIIII Scrape (Daily Script Step 1).ipynb" --output "${NOTEBOOK_PATH}/1. StockBot Draft VIIII Scrape (Daily Script Step 1)-executed.ipynb" > /tmp/nbconvert1.log 2>&1

# check if the first notebook executed successfully
if [ $? -ne 0 ]; then
    echo "Failed to execute ${NOTEBOOK_PATH}/1. StockBot Draft VIIII Scrape (Daily Script Step 1).ipynb"
    cat /tmp/nbconvert1.log
    deactivate
    exit 1
fi

jupyter nbconvert --to notebook --execute "${NOTEBOOK_PATH}/2. StockBot Draft VIII Eng (Daily Script Step 2).ipynb" --output "${NOTEBOOK_PATH}/2. StockBot Draft VIII Eng (Daily Script Step 2)-executed.ipynb" > /tmp/nbconvert2.log 2>&1

# check if the second notebook executed successfully
if [ $? -ne 0 ]; then
    echo "Failed to execute ${NOTEBOOK_PATH}/2. StockBot Draft VIII Eng (Daily Script Step 2).ipynb"
    cat /tmp/nbconvert2.log
    deactivate
    exit 1
fi

echo "Both notebooks executed successfully."

# deactivate the virtual environment
deactivate


# execute the trade script
/Users/rileybitterli/Desktop/StockBot_Shell_Scripts/SB_Draft_VIII_Trade.sh > /tmp/trade_script.log 2>&1

