require(R6)
require(mvtnorm)
require(hash)
NaiveBayes <- R6Class("NaiveBayes",
                      list(
                        mean = hash(),
                        likehood = hash(),
                        priors = hash(),
                        K = NULL,
                        P = NULL,
                        
                        fit = function(X, y) {
                          
                          self$K <- unique(y)
                          
                          for (k in self$K){
                            
                            X_k <-matrix(X[y == k])
                            self$likehood[[toString(k)]] <- cov(t(X_k))
                            self$priors[[toString(k)]] <- length(X_k) / length(X)
                            self$mean[[toString(k)]] <-colMeans(X_k)
                          }
                          predict = function(X){
                            
                            self$P <- matrix(0, length(X), length(self$K))
                            
                            for (k in self$K) {
                              
                              self$P[,K] <- dmvnorm(X, self$means[[toString(k)]],self$likehood[[toString(k)]] + log(self$priors[[toString(k)]]))
                              
                            }
                            return(apply(self$P, 1, which.max))
                          }
                          
              
                          
                        
                        }
                        
                      )
  
)