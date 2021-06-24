#libs
library(tidyverse)
library(Seurat)
library(dplyr)
library(patchwork)
library(stringr)

#Read data using data.table
gse.data <- as.matrix(data.table::fread(file = "D:/Lung cancer data/GSE99254/GSE99254_Count_Matrix.txt",header = T, stringsAsFactors = F))
gse.metadata <- as.matrix(data.table::fread(file = "D:/Lung cancer data/GSE99254/GSE99254_Sample.txt",header = T,stringsAsFactors = F))

#metadata
#reserve cell name column in metadata
temp <- as.matrix(gse.metadata[,1])
#assign first column as row names in metadata
rownames(gse.metadata) <- temp
#delete UniqueCell_ID in metadata
gse.metadata <- gse.metadata[,-1]
#delete temp data
rm(temp)
#save as cleaned file
write.table(gse.metadata, file="D:/Lung cancer data/GSE99254_Clean_metadata.csv")

#data
#delete numerical_id column in data
gse.data <- gse.data[,-1]
#reserve geneid column in reserve
tempd<-as.matrix(gse.data[,1])
#assign first column as rownames in data
rownames(gse.data)<-tempd
#delete geneid column in data
gse.data <- gse.data[,-1]
#delete temp data
rm(tempd)
#save as cleaned file
write.table(gse.data, file="D:/Lung cancer data/GSE_99254_Clean_data.csv")

temp <- rownames(gse.data)
temp[duplicated(temp)]

#Creating Seurat Object
gse <- CreateSeuratObject(counts = gse.data,project = "gse99254", min.cells = 3,min.features = 200,meta.data = gse.metadata)
