library(tidyverse)

# Generate the curves to be plotted
df = 1:100
bias2 = 10/(df^0.4)
variance = 0.006*((df-1)/2)^2 + 3.1
train = 11/(df^0.36)
bayes = rep(1.84, 100)
test = bias2 + variance + bayes

data = data.frame( rep(1:100, 5), rep(c("bias^2", "variance", "training_error", "testing_error", "bayes_error"), each=100)  )
data = data.frame(data, c(bias2,variance,train,test,bayes  ))
names(data) = c("df", "Variable", "Value")

# Plot them
plt <- ggplot(data=data, aes(x=df, y=Value, group=Variable))+
  geom_line(aes(color=Variable), linewidth=1)+
  labs(x="df", y="Value")+
  ggtitle("Various Error Values vs. Degrees of Freedom")

plt

















