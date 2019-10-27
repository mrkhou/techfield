require(R6)

KNN <- R6Class("KNN",
               public = list(
                 CreateDataSet = function(){
                   group <- matrix(c(1.0,1.1,1.0,1.0,0,0,0,0.1),ncol=2,byrow=T) #Assume we have this matrix
                   labels <- rep(c('A','B'),each=2)
                   dt <- as.data.frame(group)
                   dt$labels <- labels
                   dt
                 }
               )
)
knn <- KNN$new()
known <- knn$CreateDataSet()
plot(V2~V1,data=known,xlim=c(-0.2,1.2),ylim=c(-0.2,1.2),xlab="",ylab="")
text(known$V1,known$V2,known$labels,adj=c(1.5,0.5))

library(magrittr)
CalDistance <- function(item1,item2)
{
  (item1-item2)**2 %>% sum %>% sqrt
}
KNN$set("private","CalDistance",CalDistance,overwrite = T)


Classify0 <- function(known,unknown,k)
{
  mat <- as.matrix(known[,-ncol(known)])
  
  diffMat <- mat - matrix(rep(unlist(unknown),nrow(mat)),ncol=ncol(mat),byrow=T)
  distances <- diffMat**2 %>% rowSums() %>% sqrt
  sortedDistIndicies <- order(distances)
  classCount <- table(known[sortedDistIndicies[1:k],ncol(known)])
  classCount <- sort(classCount,decreasing = T)
  return(names(classCount)[1])
}

KNN$set("public","Classify0",Classify0,overwrite = T)
unknown <- data.frame(V1=0,V2=0)
knn <- KNN$new()
knn$Classify0(known,unknown,3)