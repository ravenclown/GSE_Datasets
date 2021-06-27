gse.data <- read.table(file = "D:/Lung cancer data/GSE97168/GSE97168_umitab.txt",header = T,row.names = 1)
gse.metadata <- read.table(file = "D:/Lung cancer data/GSE97168/GSE97168_metadata.txt",header = T,row.names = 1)

gse <- Seurat::CreateSeuratObject(counts = gse.data,project = "gse97168", min.cells=3, min.features=200, meta.data = gse.metadata)
saveRDS(gse,file = "D:/GSE97168.rds")
