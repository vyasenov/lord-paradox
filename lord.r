##############
############## Clear workspace
##############

set.seed(123)
n <- 1000

##############
############## Generate fake data
##############

# Simulate data for two groups (e.g., male/female students)
group <- factor(rep(c("A", "B"), each = n/2))

# Initial weight (pre)
# Group A starts with higher average weight
weight_pre <- numeric(n)
weight_pre[group == "A"] <- rnorm(n/2, mean = 75, sd = 10)
weight_pre[group == "B"] <- rnorm(n/2, mean = 65, sd = 10)

# Final weight (post)
# Both groups gain the same amount on average
gain <- rnorm(n, mean = 10, sd = 5)
weight_post <- weight_pre + gain

# Create data frame
data <- data.frame(
  group = group,
  pre = weight_pre,
  post = weight_post
)

##############
############## Weight change b/w groups
##############

t.test(post - pre ~ group, data = data)

##############
############## Regression analysis
##############

model <- lm(post ~ group + pre, data = data)
summary(model)$coefficients

