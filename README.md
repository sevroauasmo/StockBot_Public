# StockBot_Public
 Public, Lightly Redacted Version of Stockbot

This is a slightly redacted version of StockBot Draft 8, a series of Python scripts that scrape, ingest, manipulate, and enrich daily insider trading reports from the SEC. It then runs them through a Neural Net to ascertain stock price predictions over a set period of time, and finally, uses robin.stocks to automate the buying and selling. 

To get started:
1. Download the packages in the requirements file (I break this up into the Venn 'SB' for all scraping/feature eng/cleanup, and 'ML' for the tensorflow and stock purchase flow

2. Adapt the shell scripts to work your PC- I recommend running at the very least the training flow locally, as parsing years of data gets to TBs of compute and I/O very quickly

3. Collect data to train your model, and train it, using the Training_Data_Scraper scripts

4. [If Desired] Set up a proper daily flow that scrapes the SEC's filing list daily, predicts, acts on trades. I would recommend using a cron job and again doing this locally, but could very much be staged in Sagemaker or the like 
