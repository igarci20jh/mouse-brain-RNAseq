# Deciphering Gene Expression Differences Caused by Aging in Mice Brain Cell Types Using

## Description
For our project we will be reproducing UMAPs based on cell type at different age intervals, juvenile or old, to see the gene expression difference based on transcriptomics data. We will be using R for this plotting. We will also be reproducing the heatmap of top marker genes, and functional analysis of the highest variable genes. This project will give us a better understanding of the regulations of pathways during aging, and the scripts can be used to analyze other sc-RNA seq datasets. Data and coding scripts from this paper are publicly available, we will modify them to achieve our goal. 

## Examples of Published Figures
![](https://ars.els-cdn.com/content/image/1-s2.0-S0092867422015239-figs1_lrg.jpg)

## Data Set
snRNA seq: [https://datasets.cellxgene.cziscience.com/a5b4edba-e532-4f28-b9e6-ce42cdc3ba14.h5ad] 
ID: GEO: GSE207848

## Software (No Versions Cited in the Paper)
Python v3.12.3: We will use this to analyze the RNAseq data.
R v4.4.1: We will use this to visualize our data by making a UMAP and Heatmap.

### Python Packages with links
- matplotlib.pyplot: https://matplotlib.org/stable/install/index.html
- numpy: [https://numpy.org/install/]
- scanpy: [https://github.com/scverse/scanpy]
- pandas: [https://pypi.org/project/pandas/]
- anndata: [https://github.com/scverse/anndata]
- seaborn:[https://seaborn.pydata.org/installing.html]

### R Packages
- ggplot2: [https://ggplot2.tidyverse.org/]
- umap: [https://cran.r-project.org/web/packages/umap/index.html]
- uwot: [https://cran.r-project.org/web/packages/uwot/index.html]

## Goals
1. Producing UMAP based on cell type at different age intervals using our own code written in R.
  - fitering raw RNA seq data in python through Scanpy in python
  - creating code in R to perform multi-level clustering based on cell types and ages 
2. Producing Heat Map for expression of top marker genes
  - filter out the top marker genes from raw RNA seq datas
  - creating code in R to produce heat map to show most different expression based on cell types
