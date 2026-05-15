library(phyloseq)
library(here)

# Load the files you calculated on the HPC
seq_table <- readRDS("path/to/local/folder/seq_table_nochim.rds")
tax_table <- readRDS("path/to/local/folder/tax_gg.rds")
metadata  <- readRDS("path/to/local/folder/sample_df.rds")

# Important: Ensure metadata row names match the ASV table row names
rownames(metadata) <- metadata$Samples

# Construct the phyloseq object
ps <- phyloseq(otu_table(seq_table, taxa_are_rows=FALSE), 
               sample_data(metadata), 
               tax_table(tax_table))

# Now you can plot locally without using HPC resources
plot_bar(ps, fill="Family")
