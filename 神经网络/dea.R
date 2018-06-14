#何晓婷分享的关于autoencoder 的代码




library(xlsx)
data1<-read.xlsx("D:/data/Medical resources/????????/????????/autoʹ?õ?????????/factor.xls",1,encoding = "UTF-8")
data1<-data1[,1:7]
row.names(data1)<-data1[,1]
data1<-data1[,2:7]
data1<-as.matrix(data1)
data1t<-t(data1)              #这个t？？？？转置？

#------------------------------------------------------------------------------------------

## Set up the autoencoder architecture:
library(autoencoder)
nl=3                          ## number of layers (default is 3: input, hidden, output)
unit.type = "logistic"        ## specify the network unit type, i.e., the unit's 
## activation function ("logistic" or "tanh")
Nx.patch=6                    ## 与特征相对应？width of training image patches, in pixels
Ny.patch=31                   ## ？？？height of training image patches, in pixels
N.input = Nx.patch*Ny.patch   ## number of units (neurons) in the input layer (one unit per pixel)
N.hidden = 6*6                ## number of units in the hidden layer
lambda = 0.0002               ## weight decay parameter     
beta = 6                      ## weight of sparsity penalty term 
rho = 0.01                    ## desired sparsity parameter
epsilon <- 0.001              ## a small parameter for initialization of weights 
## as small gaussian random numbers sampled from N(0,epsilon^2)
max.iterations = 4000         ## number of iterations in optimizer

autoencoder.object <- autoencode(X.train=data1,nl=nl,N.hidden=N.hidden,
                                 unit.type=unit.type,lambda=lambda,beta=beta,rho=rho,epsilon=epsilon,
                                 optim.method="BFGS",max.iterations=max.iterations,
                                 rescale.flag=TRUE,rescaling.offset=0.001)

## Report mean squared error for training and test sets:
cat("autoencode(): mean squared error for training set: ",
    round(autoencoder.object$mean.error.training.set,3),"\n")

## Visualize hidden units' learned features:
visualize.hidden.units(autoencoder.object,Nx.patch,Ny.patch)
#------------------------------------------------------------------------------------------

X.output <- predict(autoencoder.object, X.input=data1, hidden.output=FALSE)$X.output 

op <- par(no.readonly = TRUE)  ## save the whole list of settable par's.
par(mfrow=c(3,2),mar=c(2,2,2,2))
for (n in c(1,2,3)){
  ## input image:
  image(matrix(data1[n,],nrow=Ny.patch,ncol=Nx.patch),axes=FALSE,main="Input image",
        col=gray((0:20)/20))
  ## output image:
  image(matrix(X.output[n,],nrow=Ny.patch,ncol=Nx.patch),axes=FALSE,main="Output image",
        col=gray((0:20)/20))
}
par(op)  ## restore plotting par's
X.output
write.xlsx(X.output,"D:/data/Medical resources/????????/????????/????????/autoencoder????????/school.xlsx","sheet 1")
