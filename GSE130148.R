gse.data <- read.table(file = "D:/Lung cancer data/GSE130148/GSE130148_raw_counts.csv",header = T,row.names = 1,sep = ",")
gse.metadata <- read.table(file = "D:/Lung cancer data/GSE130148/GSE130148_barcodes_cell_types.txt", header = T,row.names = 1, sep = "\t")

gse <- Seurat::CreateSeuratObject(counts = gse.data,project = "gse130148", min.cells=3, min.features=200, meta.data = gse.metadata)
saveRDS(gse,file = "D:/GSE130148.rds")
