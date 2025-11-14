# CHECK-IN #2
## How we’ve addressed feedback
Questions and feedback: 
I see that you have some plots in your jupyter notebook, if they are ones you have generated, it would be great if you could extract them and add them to results folder.
The plotting from the previous script was used to validate the file we had could actually be used to create a UMAP, we will utilize R to generate our own pipeline for the Umap.
 
What normalization techniques are being used to generate the data for the UMAPs? Will you take into consideration the clustering of certain types of cells?
We are using this scanpy function sc.pp.normalize_total
It normalizes each cell by total counts over all genes, so that every cell has the same total count after normalization, and we using the default 1e6 which is the CPM normalization to adjust gene counts for sequencing depth, making them comparable across samples
We will be considering clustering based on the tissue- and coloring between on the expression level- so we can get a side by side comparison between our juvenile and old mice 

When creating the UMAPs in R, I would suggest using different colors for different clusters of cell types and perhaps visually comparing clusters to highlight similarities and differences due to aging.
We completely agree and will be using different color schemes for different tissue in the brain- and hopefully we can figure out a way to merge the two Umaps to have a color scheme change depending on how different the  genes are expressed in juvenile and old mice. 

 It would be nice to include the original paper and maybe their GitHub repository for better contextualization. Also, for the readability of the code, it would be helpful to add a few comments and copy all the code into a separate Python script instead of showing all the console outputs.
We strongly agree with your comment, We update the link to the original paper and their repository in the readme for better understanding. The original code doesn’t contain comments and  they did not annotate their script well. We will update the comments and remove all the output printing comments later so people can understand better. 

Is this a comparison between mice put into two groups (ie say 8-12 weeks and 1.5+ years or something like that?) or is there a particular age picked as a reference for the two groups? If the latter is the case, I'd be curious to know what timepoint is picked as the "juvenile" reference, as I feel like the timepoint could influence the results of the comparison. If it is set - apologies if I missed it, but then my suggestion would be to make a note of that in data or on a README.md a little more obviously, since it feels like pretty pertinent information.
Thanks for your suggestion, in the paper, the authors used the 4 weeks old juvenile mice and the 90 weeks old mice for their study and we have added that to the README so people can have the idea that this is a drastic difference in their gene expression level. 

## New Progress since last submission
We have researched different ways of reading in the .h5ad file into R studio, downloaded all the necessary packages and created code that should work to create a UMAP. However, we are having trouble actually reading in the data, so we could not generate an actual UMAP. Despite our efforts of compressing the file in python, the compressed version is still too large and we are having trouble with the R studio. Therefore, we are currently still working on our first aim, due to the hindrance we encountered in the limited storage of R, and we plan on showing up to office hours to discuss this issue and see if there are alternative solutions such as using Rockfish to deal with the RAM issue. 
We will also plan for alternative solutions in case we cannot resolve the issue such as using different package in python to create our own UMAP script, and maybe generate the heatmap and PCA plot in python, and performing some gene ontology analysis using the Goscript package. 

## Project Organization
|-- README            <-- title, description, overview of figure

	|-- Data/             <-- only small (<1 Mb), instructions on retrieving larger

	|-- Documents/              <-- check-ins, slides

	|-- Results/          <-- only small (<1 Mb), instructions on retrieving larger

	|- Src/              <-- code
    

## Struggles We Have Encountered
We are having problems reading in the .h5ad file into R in order to actually create the UMAP but through some research online found that we could use the Seurat package. Using this we still encountered some errors having to do with RAM. We also tried using zellkonverter instead since, through some research, we found that it may be more memory efficient. It is more memory efficient because it uses HDF5-backed arrays instead of copying the whole dataset. We were still running into errors so we switched back to Seurat but again got the error “Error: vector memory limit of 16.0 Gb reached, see mem.maxVSize()”
We also ran into some trouble figuring out how to color the UMAP by age. We looked at the format of .h5ad files and we are not sure if it had the age as part of it and since it is a .h5ad file we cannot open it to view to format. Any guidance on this issue would be appreciated!
