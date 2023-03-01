# a) To begin, load in the Boston data set. The Boston data set is part of the MASS library in R

library(MASS)

# Now the data set is contained in the object Boston
# Read about the data set

?Boston

# How many rows are in this data set? How many columns? What do the rows and columns represent?
# This data set has 506 rows and 14 columns. Each row represents a town, and the columns are
names(Boston)


# b) Make some pairwise scatterplots of the predictors (columns) in this data set. Describe 
# your findings
pairs(Boston[,1:7])

for (i in 1:14){
  plot(Boston[,i], Boston$nox, xlab=names(Boston)[i], ylab="nox", main=paste("NOx vs.", names(Boston)[i]))
}
# Nox seems to have the strongest positive correlations with indus, age, rad, tax, ptratio, 
# and lstat, and the strongest negative correlations with medv, black (should calculate), 
# dis, and zn


# c) Are there any predictors associated with per capita crime rate? If so, explain the relationship
for (i in 1:14){
  plot(Boston[,i], Boston$crim, xlab=names(Boston)[i], ylab="crim", main=paste("crim vs.", names(Boston)[i]))
}
# Crime seems to be positively correlated with nox, age, rad, tax, lstat, and negatively 
# correlated with medv


# d) Do any of the suburbs of Boston appear to have particularly high crime rates? Tax rates?
# Pupil-teacher ratios? Comment on the range of each predictor.
summary(Boston$crim)
summary(Boston$tax)
summary(Boston$ptratio)

hist(Boston$crim)
hist(Boston$tax)
hist(Boston$ptratio)

# The range of these particular predictors are included in the summary printouts in the console.
# Most suburbs of Boston have a low crime rates (75% < 3.677 crimes per capita). But the upper
# tail is quite long, with one town reaching a crime rate of 89%.

# The tax distribution is bimodal, which may indicate that most neighborhoods were affordable,
# with some being much more expensive.

# The ptratio is left skewed (presumably a good thing because that means many towns have high 
# ptratios). There are some neighborhoods with very low ptratios. However, looking at the
# scatterplots below, a high ptratio doesn't imply a low crime rate, as the highest crime rates
# belong to towns with ptratios near the 3rd quartile.

cor(Boston$crim, Boston$ptratio)
plot(Boston$ptratio, Boston$crim)

# e) How many of the suburbs in this data set bound the Charles river?
sum(Boston$chas)
# 35 neighborhoods in this data set are on the Charles River. 
sum(Boston$chas)/length(Boston$chas)
# That's just 7% of the neighborhoods in this data set.

# f) What is the median pupil-teacher ratio among the towns in this data set?
median(Boston$ptratio)
# It's 19.05

# g) Which suburb of Boston has the lowest median value of owner-occupied homes? What are the 
# values of the other predictors for that suburb, and how do those values compare to the 
# overall ranged for those predictors? Comment on your findings.
min_val = min(Boston$medv)
min_val_town = Boston[ Boston$medv == 5 ,]
min_val_town

# There are two suburbs with the lowest median value of owner-occupied homes, 399 and 406
percentile = ecdf(Boston$crim)
min_val_town_percentiles = data.frame(percentile(min_val_town$crim))
for (i in 2:14){
  percentile = ecdf(Boston[,i])
  min_val_town_percentiles = data.frame(min_val_town_percentiles, percentile(min_val_town[,i]))
}
names(min_val_town_percentiles) = names(Boston)
row.names(min_val_town_percentiles) = c(399, 406)
min_val_town_percentiles

# I'll comment on this tomorrow, right now I want to get (h) done


# h) In this data set, how many of the suburbs average more than seven rooms per dwelling? More than eight rooms per dwelling? Comment
# on the suburbs that average more than 8 rooms per dwelling?

sum(Boston$rm > 7) / length(Boston$rm > 7)
# 12.65%

sum(Boston$rm > 8) / length(Boston$rm > 8)
# 2.57%

towns_8_rooms = Boston[Boston$rm > 8,]
summary(towns_8_rooms)
# Again, I'll comment on this again tomorrow, but what I really want to know is where these averages fall in the distribution of the
# whole data set.