# AI_PrIndependent
Brian's Extra Credit Independent Project

This describes the process for checking which of your current products are best sold in bulk.

1.  Select products with your team.  They should not include brand, or size, but should refer to a generic product that you will be able to gather data on.  Athletic sneakers, t-shirts, socks, basketballs are examples.  Make note of these 6 products, labeling each product as product 1 through 6.

2.  Input market data into the Demographic Matrices for each product.  This will help determine which demographic to target and which will buy in bulk based on the variables already identified in the Demographic Matrices, do not change these.  Click the macro ‘Export to Product Matrices Data’ so the data will be added to the historical data.  Keep this document open because you will need this data, the data from the latest Product Matrix of the current year you’re working on, to be classified by the classifier in Weka.

3.  Open MATLAB and run the file titled ‘AI_PrIndependent_PCAandData’.  This will reduce the number of variables to a size easier for Weka to classify.  Right now it is set to account for 95% of the variance in the data.  Your data will be written to a csv file.  This data must be copied and placed into the section where all the current data is in the .arff file titled ‘ProductData’.  

4.  Open Weka.  in Preprocess, open ‘ProductData.arff.”  In the Classify tab, select the J-48 classifier.  Set up your data so that you are only classifying the new data, that is, the last six rows of ‘ProductData’ and the previous rows from previous years, are training data.  

5.  Check to see which products were classified at which levels, and check the accuracy.  
