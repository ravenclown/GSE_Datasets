library(plyr)
library(readr)
setwd("D:/Lung cancer data")
mydir = "GSE148071_RAW"
myfiles = list.files(path = mydir, pattern = "*.txt.gz", full.names = T)
names <- vector(mode = "list", length = 42)

for (i in 1:42)
{
  names[i]<- paste0("gse148071_p",i)
}

for(i in 1:42)
{
  name = paste0("gse148071_p",i,"_data")
  obj = paste0("gse148071_p",i)
  assign(name,read.table(file=myfiles[i], header = T, row.names = 1))
  assign(obj,Seurat::CreateSeuratObject(counts = get(name) ,project = "gse148071", min.cells=3, min.features=200))
  saveRDS(get(obj),file = paste0(names[i],'.rds'), compress = T)
}
