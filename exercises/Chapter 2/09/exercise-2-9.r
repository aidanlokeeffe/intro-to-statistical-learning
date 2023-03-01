# Exercise 9
# This exercise involves the Auto data set studied in the lab. Make sure that the missing values
# have been removed from the data

Auto = read.csv("Auto.csv", header=TRUE, na.strings="?")
Auto = na.omit(Auto)
View(Auto)


# a) Which of the predictors are quantitative, and which are qualitative?
# name and origin are qualitative, the rest are quantitative


# b) What is the range of each quantitative predictor? You can answer this using the range() function.
# c) What is the mean and standard deviation of each quantitative predictor?
df = data.frame(c(range(Auto[,1]), mean(Auto[,1]), sd(Auto[,1])))
for (i in 2:7){
  df = data.frame(df, c(range(Auto[,i]), mean(Auto[,i]), sd(Auto[,i])))
}
names(df) = names(Auto)[-c(8,9)]
rownames(df) = c("min", "max", "mean", "sd")
df


# d) Now remove the 10th through 85th observations. What is the range, mean, and standard deviation
# of each predictor in the subset of the data that remains.

Auto2 = Auto[-c(10:85),]
df2 = data.frame(c(range(Auto2[,1]), mean(Auto2[,1]), sd(Auto2[,1])))
for (i in 2:7){
  df2 = data.frame(df2, c(range(Auto2[,i]), mean(Auto2[,i]), sd(Auto2[,i])))
}
names(df2) = names(Auto2)[-c(8,9)]
rownames(df2) = c("min", "max", "mean", "sd")
df2


# e) Using the full data set, investigate the predictors graphically, using scatterplots or other
# tools of your choice. Create some plots highlighting the relationships among the predictors.
# Comment on your findings.

pairs(Auto[,-c(8,9)])

# Cars become more efficient over time (mpg increases even if horsepower decreases).
# Miles per gallon decreases with cylinders, whereas horsepower and weight increase with 
# cylinders, so it seems that you're trading mileage for power.


# f) Suppose that we wish to predict gas mileage (mpg) on the basis of the other variables. Do
# your plots suggest that any of the other variables might be useful in predicting mpg? Justify
# your answer.

# Cylinders and year appear to have linear relationships with mpg, while displacement, 
# horsepower, and weight seem to have non-linear relationships with mpg. So all of these
# variables should be included in an attempt to predict mpg. Acceleration appears to be
# uncorrelated with mpg.







