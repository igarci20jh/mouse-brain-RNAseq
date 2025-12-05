library(Seurat)
library(SeuratDisk)
library(ggplot2)
library(tidyverse)

setwd("/Users/cmdb/qb25project/mouse-brain-RNAseq/")

# Convert .h5ad to .h5seurat
Convert("adata_for_seurat.h5ad", dest = "h5seurat", overwrite = TRUE)

# Load the Seurat object
sce <- LoadH5Seurat("adata_for_seurat.h5seurat", meta.data = FALSE, misc = FALSE)

# Preprocessing
sce <- FindVariableFeatures(sce, selection.method = "vst", nfeatures = 2000)
sce <- ScaleData(sce)
sce <- RunPCA(sce, assay = "RNA", verbose = TRUE)

# Check PCA elbow
ElbowPlot(sce)

# Neighbors → clusters → UMAP
sce <- FindNeighbors(sce, dims = 1:6)
sce <- FindClusters(sce, resolution = 0.2)
sce <- RunUMAP(sce, dims = 1:6)



 
cell_types <- read.delim("cell_types.tsv")   # columns: idx, cell_type
age_df <- read.delim("age.tsv")             # columns: idx, age

# Extract UMAP embedding
umap_df <- as.data.frame(Embeddings(sce, "umap"))
umap_df$cell_id <- rownames(umap_df)

# Merge predicted cell types
umap_df <- merge(umap_df, cell_types, by.x = "cell_id", by.y = "idx")

# Merge age information
umap_df <- merge(umap_df, age_df, by.x = "cell_id", by.y = "idx")


# UMAP colored by predicted cell type

p1 <- ggplot(umap_df, aes(x = umap_1, y = umap_2, color = cell_type)) +
  geom_point(size = 2) +
  theme_classic() +
  labs(title = "UMAP by Predicted Cell Type",
       y = "UMAP 2",
       x = "UMAP 1") +
  theme(legend.position = "right")

print(p1)
ggsave("UMAP_BY_CELLTYPE.png", p1)

# UMAP colored by age

p2 <- ggplot(umap_df, aes(x = umap_1, y = umap_2, color = age)) +
  geom_point(size = 2) +
  theme_classic() +
  labs(title = "UMAP by Age",
       y = "UMAP 2",
       x = "UMAP 1") +
  theme(legend.position = "right")

print(p2)
ggsave("UMAP_BY_AGE.png", p2)
