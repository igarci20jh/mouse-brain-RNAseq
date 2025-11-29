
library(Seurat)
library(SeuratDisk)
library(ggplot2)
library(zellkonverter)
library(tidyverse)

setwd("/Users/cmdb/qb25project/mouse-brain-RNAseq/")

# Read .h5ad with low memory usage
Convert("adata_combined_nodoublet.h5ad", dest = "h5seurat", overwrite = TRUE)
sce <- LoadH5Seurat("adata_combined_nodoublet.h5seurat", meta.data = FALSE, misc = FALSE)
#sce <- readH5AD("adata_combined_nodoublet_normalized.h5ad")

# Running PCA for UMAP

sce <- FindVariableFeatures(sce, selection.method = "vst", nfeatures = 2000)
sce <- ScaleData(sce)
sce <- RunPCA(sce, assay = "RNA", verbose = TRUE)


# Sckree plot to find number of PCs that explain data (used Seurat function)
ElbowPlot(sce)

sce <- FindNeighbors(sce, dims = 1:7)
sce <- FindClusters(sce, resolution = 0.5)
head(Idents(sce))

#Run UMAP
# dims= the number of PCAs to use for the UMAP
sce <- RunUMAP(sce, dims = 1:7)  # will adjust once we can read in the data
# change the second number in the colon to 7 because thats where the elbow is in the skree plot
umap_embeddings <- Embeddings(sce, "umap")


# Plotting UMAP
umap_df <- as.data.frame(umap_embeddings)
head(umap_df)

# Color by clusters
umap_df$cluster <- Idents(sce)  

# Plotting UMAP
ggplot(umap_df, aes(x = umap_1, y = umap_2, color = cluster)) +
  geom_point() +
  theme_classic() +
  labs(title = "UMAP by Cell Type")
ggsave("UMAP_BY_CELLTYPE.png")

ggplot(umap_df, aes(x = umap_1, y = umap_2, color = age)) +
  geom_point() +
  theme_classic() +
  labs(title = "UMAP by Age")
ggsave("UMAP_BY_AGE.png")