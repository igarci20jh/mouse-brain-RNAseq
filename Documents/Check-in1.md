# CHECK-IN #1

## How we have addressed prior feedback
There was no prior feedback to address. But the suggestion from betty is very valid, i will focused on to generate the UMAP as our primary goal and focused to use the code to process the raw sn-seq file and using R to generate our own Umap

## New Progress since last Submission
Tried to understand code for processing the raw data to then be used for the UMAP
Since the last submission we have focused on understanding the code the authors used in order to process the raw single cell sequencing data and create a file they could use to then create the UMAP. We were able to modify their code to process the raw data files and create the UMAPs using their code. We did this to ensure the data file we had was the correct file to create the UMAP as the author’s organization was difficult to navigate. We were able to confirm the file we have now is the correct file and will be using it to create our own UMAP in R Studio.

## Project Organization
	|-- README            <-- title, description, overview figure
	|-- Data/             <-- only small (<1 Mb), instructions on retrieving larger
	|-- Documents/              <-- reports, slidedecks
	|-- Results/          <-- only small (<1 Mb), instructions on retrieving larger
	|- Src/              <-- code

We construct the following organization in our repository, the Data folder is currently empty with one README file because our data is large and will need retrieving through separate instruction. We have a question on how to upload our data online. We also created the Document folder which will contain the check-in updates and presentation slides, now it contains this check-in markdown file. The Results folder will contain our Umap and a readme on the explanation of the Umap. and the last folder is the Src folder which contains our current python script and it will have our R script for the Umap. we haven’t upload the requirement document as it will still need updates depend on what we will use for the Umap 

## Struggles we are encountering and questions we would like advice on
The first week we struggled with converting the data the authors had on github from a .h5da file to an .h5 file which is what was used in the code to process the file before creating the UMAP. As we reread the paper we found that the actual raw data was only listed in the star methods section of the paper and not in their github. Turns out we were using the wrong file. And the raw data file only contains the pre-frontal cortex and not hypothalamus- so our Umap will be different given we will not have two regions of the brain to merge and compare the data.  
The organization of the author's repository is unclear, they don’t give clear names to their script to tell the viewer the function of the script. The readme file of their repository is not helpful, it only contains one line. “Analysis software for brain aging spatial and single-cell transcriptomics.” and at last the annotation of the code is horrible, they have comments for the majority of their code so it's hard to understand and interpret the code. 

# Questions need advice on
Coding question: when we run the script, for this code block, the Keep getting warning to say the variable name is not unique for every sample we run the script with, should we use the suggestion from python to make them each contain a unique label? 

```
all_adata = []
i = 0
for s in samples:
   label, area, age, idx, _ = s.split("_")
   print(label, area, age, idx)
   curr_adata = sc.read_10x_h5(f"/Users/cmdb/qb25project/mouse-brain-RNAseq/GSE207848_RAW/{s}")
   curr_adata.var_names_make_unique()
   curr_adata.obs['area'] = area
   curr_adata.obs['age'] = age
   curr_adata.obs['idx'] = i
   i += 1
   curr_adata.var['mt'] = curr_adata.var_names.str.startswith('mt-')  # annotate the group of mitochondrial genes as 'mt'
   sc.pp.calculate_qc_metrics(curr_adata, qc_vars=['mt'], percent_top=None, log1p=False, inplace=True)

```
Warning: 

 ```
 GSM6321073 PFC 4wk 1
reading /Users/cmdb/qb25project/mouse-brain-RNAseq/GSE207848_RAW/GSM6321073_PFC_4wk_1_matrix.h5

/opt/anaconda3/envs/qb25project/lib/python3.13/site-packages/anndata/_core/anndata.py:1793: UserWarning: Variable names are not unique. To make them unique, call `.var_names_make_unique`.
  utils.warn_names_duplicates("var")
/opt/anaconda3/envs/qb25project/lib/python3.13/site-packages/anndata/_core/anndata.py:1793: UserWarning: Variable names are not unique. To make them unique, call `.var_names_make_unique`.
  utils.warn_names_duplicates("var")

(0:00:01)
```


General question: Do we make a link for the data sets so ppl that look at our git repository can find the data?
We moved our notebook to a different folder but now there are two copies. Can we safely delete it using rm in the main directory in unix or will we be deleting both the file in the main folder and in the src folder?
