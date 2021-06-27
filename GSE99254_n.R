#libs
library(tidyverse)
library(Seurat)
library(dplyr)
library(patchwork)
library(stringr)

gse.metadata <- read.table(file = "D:/Lung cancer data/GSE99254/GSE99254_Sample.txt",header = T,row.names = 1)
gse.data <- read.table(file = "D:/Lung cancer data/GSE99254/GSE99254_Count_Matrix.txt",header = T,row.names =NULL)
#metadata
#Tuning metadata
gse.metadata$majorCluster<-gsub("_","-",gse.metadata$majorCluster)
row.names(gse.metadata)<-gsub("-",".",row.names(gse.metadata))

#data
#delete na elements
gse.data <- na.omit(gse.data)
#delete numerical_id column in data
gse.data <- gse.data[,-1]
#reserve geneid column in reserve
tempd<-gse.data[,1]
#assign first column as rownames in data
rownames(gse.data)<-tempd
#delete genenames column in data
gse.data <- gse.data[,-1]
#delete temp data
rm(tempd)

#Creating Seurat Object
gse <- CreateSeuratObject(counts = gse.data,project = "gse99254", min.cells = 3,min.features = 200,meta.data = gse.metadata)
gse <- AddMetaData(gse,gse.metadata)
