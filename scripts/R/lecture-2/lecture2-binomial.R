
## Figures for the slides for the first lecture (adapted slightly from the code in Gelman)

library(tidyverse)
library(purrr)
library(ggplot2)
theme_set(bayesplot::theme_default(base_family = "sans"))

# Binomial distribution with theta=0.5, n=1
ggplot(data.frame(x=0:1, y=dbinom(0:1, 1, 0.5)), aes(x=x, y=y)) +
  geom_col() +
  scale_x_discrete(breaks=0:1, limits=0:1) +
  labs(x="y", y="probability", title=bquote("Binomial distribution with " ~ theta ~ "=0.5, n=1"))

# Binomial distribution with theta=0.5, n=10
ggplot(data.frame(x=0:10, y=dbinom(0:10, 10, 0.5)), aes(x=x, y=y)) +
  geom_col() +
  scale_x_discrete(breaks=0:10, limits=0:10) +
  labs(x="y", y="probability", title=bquote("Binomial distribution with " ~ theta~ "=0.5, n=10"))

# Binomial distribution with theta=0.9, n=10
ggplot(data.frame(x=0:10, y=dbinom(0:10, 10, 0.9)), aes(x=x, y=y)) +
  geom_col() +
  scale_x_discrete(breaks=0:10, limits=0:10) +
  labs(x="y", y="probability", title=bquote("Binomial distribution with " ~ theta ~ "=0.9, n=10"))

# Posterior of theta of Binomial model with y=10, n=10
ggplot(data = data.frame(x = c(0, 1)), aes(x)) +
  stat_function(fun = dbeta, n = 601, args = list(shape1 = 11, shape2 = 1),
                color = "blue") +
  geom_segment(x=11/12, xend=11/12, y=0, yend=11, color="red") +
  annotate(geom ="text", x=11/12, y=-0.5, label="Mean")  +
  labs(x=bquote(theta), y="",
       title=bquote("Posterior of " ~ theta ~ " of Binomial model with y=10, n=10"))

# Posterior of theta of Binomial model with y=10, n=10 + uniform prior
ggplot(data = data.frame(x = c(0, 1)), aes(x)) +
  stat_function(fun = dbeta, n = 601, args = list(shape1 = 11, shape2 = 1),
                color = "blue") +
  geom_segment(x=11/12, xend=11/12, y=0, yend=11, color="red") +
  annotate(geom ="text", x=11/12, y=-0.5, label="Mean")  +
  labs(x=bquote(theta), y="", title=bquote("p(" ~ theta ~ "| y=10, n=10, M=binom) + unif. prior"))

# Posterior of theta of Binomial model with y=10, n=10 + Beta(2,2) prior
ggplot(data = data.frame(x = c(0, 1)), aes(x)) +
  stat_function(fun = dbeta, n = 601, args = list(shape1 = 12, shape2 = 2),
                color = "blue") +
  geom_segment(x=12/14, xend=12/14, y=0, yend=11, color="red") +
  annotate(geom ="text", x=12/14, y=-0.5, label="Mean")  +
  labs(x=bquote(theta), y="", title=bquote("p(" ~ theta ~ "| y=10, n=10, M=binom) + Beta(2,2) prior"))

# Posterior of theta of Binomial model with y=6, n=10 + unif prior
ggplot(data = data.frame(x = c(0, 1)), aes(x)) +
  stat_function(fun = dbeta, n = 601, args = list(shape1 = 7, shape2 = 5),
                color = "blue") +
  labs(x=bquote(theta), y="", title=bquote("p(" ~ theta ~ "| y=6, n=10, M=binom) + (unif. prior)"))

# Gaussian model with known variance, Gaussian posterior
# Fake data with two guesses on the height of the males in Finland, with different variance as well
tb <- tibble(id = c(1, 2), height_mu=c(175, 185), height_sd=c(4, 2))

# Population mean and standard deviation for male height in Finland
popmu=181;
popsd=6;

# Posterior functions as analytically calculated in the slides
postsd <- function (priorsd, obssd) { sqrt(1/(1/priorsd^2+1/obssd^2)) }
postmu <- function (priormu, priorsd, obsmu, obssd) {
  (priormu/priorsd^2 + obsmu/obssd^2)/(1/priorsd^2+1/obssd^2) }

# Base for plots
pbase <- ggplot(data = data.frame(x = c(155, 205)), aes(x)) +
  labs(y="", x="Height in cm")

# Plot fake guesses
guessdf <- pmap_df(tb, ~ tibble(x = seq(150, 210, length.out = 601), id=..1,
                                    density = dnorm(x, ..2, ..3)))
pguess <- ggplot(guessdf, aes(group = id, x = x, y = density)) + 
  geom_line(linetype=1, color="blue")
pguess

# Plot fake guesses + prior
pguess + 
  stat_function(fun = dnorm, n = 101, args = list(mean = popmu, sd = popsd),
                color = "red")

# Compute posterior mu and sd
tb <- mutate(tb,
             height_pmu = postmu(popmu, popsd, height_mu, height_sd),
             height_psd = postsd(popsd, height_sd)
)

# Compute posterior densities
postdf <- pmap_df(tb, ~ tibble(x = seq(150, 210, length.out = 601), id=..1,
                                   density = dnorm(x, ..4, ..5)))

# Plot posterior densities
ppost <- ggplot(guessdf, aes(group = id, x = x, y = density)) + 
  geom_line(linetype=1, color="blue") + 
  geom_line(data = postdf, linetype=1, color="violet") +
  stat_function(fun = dnorm, n = 101, args = list(mean = popmu, sd = popsd),
                color = "red")
ppost














