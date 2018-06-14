rm(list=ls())
#基本包
library(rJava)
library(xlsx)     #读表
library(reshape)  #修改变量名称
#未知
library(lattice)
library(NLP)
library(SnowballC)
library(mvtnorm)
library(hdrcde)
library(locfit)
library(ash)
library(KernSmooth)
library(misc3d)
library(rgl)
library(ks)
library(sp)
library(grid)
library(vcd)
library(topicmodels)
library(rFerns)
library(ranger)
library(Boruta) 
library(lattice)
library(caret)
library(slam)
library(Matrix)
library(foreach)
library(glmnet)
library(dplyr)   #截取
#画图表
library(plotrix)
library(igraph)
library(ggplot2)
#基本统计信息
library(car)      #拟合和评价回归模型
library(gvlma)
library(leaps)    #全子集回归
library(nnet)
library(caret)
library(pastecs)
#颜色
library(RColorBrewer)
library(rainbow)
#画地图
library(ggmap)
library(maps)
library(mapdata)
library(maptools)
#支持向量机
library(e1071)
library(SVMMatch)
library(kernlab)
#主成分
library(pcaPP)
#文本挖掘
library(tm)
library(Rwordseg)
library(wordcloud)
library(wordcloud2)
#随机森林
library(randomForest)
#s神经网络
library(Rcpp)#与RSNNS关联
library(RSNNS)#涉及到神经网络中的其它拓扑结构和网络模型
#Stuttgart Neural Network Simulator（SNNS）是德国斯图加特大学开发的优秀神经网络仿真软件
library(nnet)#提供了最常见的前馈反向传播神经网络算法
library(AMORE)#提供了更为丰富的控制参数，并可以增加多个隐藏层
library(neuralnet)#提供了弹性反向传播算法和更多的激活函数形式
library(autoencoder)
library(deepnet)#实现了一些Deep Learning结构和Neural Network相关算法，
#包括BP，RBM训练，Deep Belief Net，Deep Auto-Encoder
#聚类分析
library(cluster)
library(MASS)
library(stats)  #hclust,kmeans等函数
library(fpc)
library(amap)

rm(list=ls())
cat("\014")  


#-----------------------------R自带demo------------------------------------#
x <- c(1,2,6,8,11)      #试用一下
dim(x) <- c(5,1)
d <- dist(x, diag = TRUE)
hc1 <- hclust(d,"single")
plot(hc1)
#plot(hc1,hang=-1,"tirangle")             #hang小于0时，树将从底部画起。
#type = c("rectangle", "triangle"),默认树形图是方形的。另一个是三角形。
#horiz  TRUE 表示竖着放，FALSE表示横着放。



newiris <- iris
model <- kmeans(scale(newiris[1:4]),3)
 model
 table(iris$Species,model$cluster)   #比较一下
 plot(newiris[c("Sepal.Length","Sepal.Width")],col=model$cluster)


#-----------------------------大样本总体数据------------------------------------#
rm(list=ls())
cat("\014")             #清空控制台，快捷键control+L
 
whole<-read.xlsx("C:/Users/lenovo/Desktop/data/hard.xlsx",3,encoding="UTF-8")
model <- kmeans(scale(whole[1:8]),2,iter.max = 3000)
model
table(whole[,9],model$cluster)   #比较一下
plotcluster(model,model$cluster)

#--------------#
#最短距离法聚类
#--------------#
whole=scale(whole[1:8])
whole=dist(whole)               #必须先求一个距离的方阵
T.hc <- hclust(whole,method="single") 
plot(T.hc, hang = -1) 
e <- rect.hclust(T.hc, k = 2)
png("C:/Users/lenovo/Desktop/data/graph/hcluster/1.png",width = 2048, height = 2048)
#可移植网络图形格式(Portable Network Graphic Format，PNG)

#------------#
#类平均法聚类
#------------#
T.hc <- hclust(whole,method="average") 
plot(T.hc, hang = -1) 
e <- rect.hclust(T.hc, k = 2)
png("C:/Users/lenovo/Desktop/data/graph/hcluster/2.png",width = 1024, height = 768)

#------------#
#重心法聚类
#------------#
T.hc <- hclust(whole,method="centroid") 
plot(T.hc, hang = -1) 
e <- rect.hclust(T.hc, k = 2)
png("C:/Users/lenovo/Desktop/data/graph/hcluster/3.png",width = 1024, height = 768)

#------------#
#中间距离法聚类
#------------#
T.hc <- hclust(whole,method="median") 
plot(T.hc, hang = -1) 
e <- rect.hclust(T.hc, k = 2)
png("C:/Users/lenovo/Desktop/data/graph/hcluster/4.png",width = 1024, height = 768)

#---------------#
#离差平方和法聚类
#---------------#
T.hc <- hclust(whole,method="median") 
plot(T.hc, hang = -1) 
e <- rect.hclust(T.hc, k = 2)
png("C:/Users/lenovo/Desktop/data/graph/hcluster/5.png",width = 1024, height = 768)



























































