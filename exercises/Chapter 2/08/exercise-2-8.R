# a) Use the read.csv() function to read the data into R. Call the loaded data college. Make sure that you have the 
# directory set to the correct location for the data
college = read.csv("college.csv", header=TRUE)


# b) Look at the data using the fix() function. You should notice that the first column is just the name of each
# university. We don't really want R to treat this as data. However, it may be handy to have these names for later. 
# Try the following commands:

rownames(college) = college[,1]
fix(college)

# You should see that there is now a row.names column with the name of each university recorded. This means that R
# has given each row a name corresponding to the appropriate university. R will not try to perform calculations on
# the row names. However, we still need to eliminate the first column in the data where toe names are stored. Try

college = college[,-1]
fix(college)

# Now you should see that the first data column is Private. Note that another column labeled row.names now appears
# before the Private column. However, this is not a data column but rather the name that R is giving to each row.


# c) 
# i. Use the summary() function to produce a numerical summary of the variables in the data set.

summary(college)

# ii. Use the pairs() function to produce a scatterplot matrix of the first ten columns or variables of the data.
# Recall that you can reference the first ten columns of a matrix A using A[,1:10]
college$Private = as.factor(college$Private) 
pairs(college[,1:10])

