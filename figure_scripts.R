library(Seurat)
library(SeuratDisk)
library(ggplot2)
setwd("/Users/cmdb/qb25project/mouse-brain-RNAseq/")

# Read .h5ad with low memory usage
Convert("adata_for_seurat.h5ad", dest = "h5seurat", overwrite = TRUE)
sce <- LoadH5Seurat("adata_for_seurat.h5seurat")

# Running PCA for UMAP
sce <- RunPCA(sce)

# Sckree plot to find number of PCs that explain data (used Seurat function)
ElbowPlot(sce)

#Run UMAP
# dims= the number of PCAs to use for the UMAP
sce <- RunUMAP(sce, dims = 1:10)  # will adjust once we can read in the data


# Plotting UMAP
umap_df <- as.data.frame(Embeddings(sce, "umap"))

# color by clusters
umap_df$cluster <- Idents(sce)  

# Plotting UMAP
ggplot(umap_df, aes(x = UMAP_1, y = UMAP_2, color = cluster)) +
  geom_point() +
  theme_classic() +
  labs(title = "Juvenile vs Old")

