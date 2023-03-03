library(tidyverse)

df = 1:10
bias2 = 2/(df^2)
variance = df^2 + .5
train = 2.75/df + abs(rnorm(10, mean=0, sd=.333))
test = bias2 + variance + 0.25 + abs(rnorm(10, mean=0, sd=.333))
bayes = rep(0.25, 10)

data = data.frame(df, bias2, variance, train, test)
View(data)


