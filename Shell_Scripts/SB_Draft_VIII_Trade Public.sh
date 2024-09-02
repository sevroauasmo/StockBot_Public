#!/bin/bash

# activate the virtual environment
source ML/bin/activate

# run the Jupyter notebook with a 10-hour cell execution timeout
jupyter nbconvert --to notebook --execute --inplace --ExecutePreprocessor.timeout=36000 "/Users/rileybitterli/Documents/GitHub/SB_VIII_Streamlined/Daily_Workflow/Python_Notebooks/3. StockBot Draft VIII Predict (Daily Script Step 3).ipynb"

jupyter nbconvert --to notebook --execute --inplace --ExecutePreprocessor.timeout=36000 "/Users/rileybitterli/Documents/GitHub/SB_VIII_Streamlined/Daily_Workflow/Python_Notebooks/4. StockBot Draft VIII Trade (Daily Script Step 4).ipynb"

# deactivate the virtual environment
deactivate
