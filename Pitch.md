Data Products Pitch
========================================================
author: Sean Rossouw
date: 2018/09/10
autosize: true

Tech Stock comparisons with Volumetric Moving Averages
========================================================


- Moving averages smooth short term spikes in stock closing prices to better visualise trends
- Adjusting the average for the trade volume allows a better analysis of trend momentum and better fit to the price
- Plotting a short term and long term moving average can help determine breakouts 

How it works
==================================================
- Financial data for a selection of major tech companies is downloaded for the last year
- Data is processed, tagged and added to a data frame for plotting in as a lattice of candlestick graphs
- The user can select two n values,being the number of periods to average over for each VWMA

VWMA in practice
========================================================

![plot of chunk unnamed-chunk-1](Pitch-figure/unnamed-chunk-1-1.png)

Extra details
======================
- The app makes use of reactive blocks in Shiney to improve computational efficiency
- Computations that are unchanged by user input, being the stock data and table creation are not repeated every time the user inputs a new n variable
