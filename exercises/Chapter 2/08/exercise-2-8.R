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

# iii. Use the plot() function to produce side-by-side boxplots of Outstate versus Private

plot(x=college$Private, y=college$Outstate, xlab="Private", ylab="Outstate", main="Outstate vs. Private")

# iv. Create a new qualitative variable called Elite, by binning the Top10perc variable. We are going to divide 
# universities into two groups based on whether or not the proportion of students coming from the top 10% of their
# high school classes exceeds 50%.

Elite = rep("No", nrow(college))
Elite[college$Top10perc > 50] = "Yes"
Elite = as.factor(Elite)
college = data.frame(college, Elite)

summary(college$Elite)

plot( college$Elite, college$Outstate, xlab="Elite", ylab="Outstate", main="Elite vs. Outstate")

# v. Use the hist() function to produce some histograms with differing numbers of bins for a few of the quantitative 
# variables. You may find the command par(mfrow=c(2,2)) useful: It will divide the print window into
# four regions so that four plots can be made simultaneously. Modifying the arguments to this function will divide the 
# screen in other ways.

par(mfrow=c(2,2))

hist(college$Apps, xlab="Apps", main="Histogram of Apps")
hist(college$Accept, xlab="Accept", main="Histogram of Accept")
hist(college$Top10perc, xlab="Top10perc", main="Histogram of Top10perc")
hist(college$S.F.Ratio, xlab="S.F.Ratio", main="Histogram of S.F.Ratio")

# vi Continue exploring your data, and provide a brief summary of what you discover
pairs(college[,11:19])
par(mfrow=c(3,3))

# Okay, let's calculate acceptance rate
college$AcceptRate = college$Accept/college$Apps

# And now, I want to look at different variables as a function of elite
for (i in c(9,10,11,12,13,15,16,17,18,20)){
  plot(x=college$Elite, y=college[,i], xlab="Elite", ylab=names(college)[i], main=paste(names(college)[i],"vs. Elite"))
}

# Elite is positively correlated with outstate, room.board, phd, perc.alumni, expend, grad.rate
# Elite is negatively correlated with s.f.ratio and accept rate

# Do elite schools have a lower acceptance rate (Accept/Apps)?
# Yes, this is visible from the plot of accept rate vs. elite

# How many private schools are elite? Public schools?
sum( college$Private == "Yes" & college$Elite == "Yes")/length(college$Private)
sum( college$Private == "No" & college$Elite == "Yes")/length(college$Private)

# Are there significant differences between these quantities, broken up over elite?
# I need to refer to another textbook for how to hypothesis test differences in R
# LEARN THIS AND I CAN FINISH THIS PROBLEM







