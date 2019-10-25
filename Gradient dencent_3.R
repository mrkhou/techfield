R2<-function(y, y_hat) 1 - sum((y-y_hat)^2)/sum((y - mean(y))^2)

N <- 250
X <- seq(0, 10, length.out = N)

y <- 5.45427 + 2.1223*X +8.7878*X^2+ rnorm(N,sd=40)

PHI <- cbind(rep(1,N),X, X^2)

lin_reg<-LinearRegression$new()

lin_reg$fit(PHI,y,eta=1e-4,show_curve=TRUE)

y_hat <- lin_reg$predict(PHI)

plot(X,y)
lines(X,y_hat)

