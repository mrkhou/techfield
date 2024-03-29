x <- rnorm(1)

f<-function(x) x^2 + 2*x +3

eta <- 1e-1
epochs <- 1e2
g <- vector(mode = "numeric", length = epochs)

for (epoch in seq_len(epochs)) {
  g[epoch] <- f(x)
  x <- x - eta*(2*x + 2)
}

plot(seq_len(epochs), g, type = "l")

cat("Optimal x value:", x)
