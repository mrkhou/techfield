require(R6)
LinearRegression <- R6Class("LinearRegression",
    list(
    w = NULL,
    fit = function(X,y) {
      self$w <- solve(t(X)%*%X,t(X)%*%y)
      },
    predict = function(X) X%*%self$w
  )
)

N <- 250
X <- seq(0, 20, length.out = N)
y <- 5.4542 + 3.0223*X + rnorm(N,sd=2)

plot(X,y)

lin_reg<-LinearRegression$new()

lin_reg$fit(X,y)
y_hat <- lin_reg$predict(X)

plot(X,y)
lines(X, y_hat)

print(lin_reg$w)