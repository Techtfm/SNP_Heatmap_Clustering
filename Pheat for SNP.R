# Install necessary packages (if not already installed)
install.packages(c("pheatmap", "RColorBrewer", "ggplot2"))

# Load required libraries
library(pheatmap)
library(RColorBrewer)
library(ggplot2)

# Set working directory (modify as needed)
setwd("/Users/ivi18/Desktop") 

# Verify working directory
getwd()

# Load SNP matrix from CSV file
snp_matrix <- read.csv("snp_r.csv", row.names = 1) 

# Convert data frame to matrix
snp_matrix <- as.matrix(snp_matrix)

# Display the first few rows
head(snp_matrix)

# Define color palette for heatmap
color_palette <- colorRampPalette(c("black", "gray50", "white"))(100)

# Define custom breaks for scaling
breaks_list <- seq(min(snp_matrix), max(snp_matrix), length.out = 100)

# Generate heatmap with clustering
pheatmap(
  snp_matrix,
  clustering_method = "ward.D2",
  color = color_palette,
  border_color = NA,
  display_numbers = round(snp_matrix),
  fontsize_number = 6,
  fontsize_row = 8,
  fontsize_col = 8,
  main = "Clustered Heatmap of SNP Distances",
  treeheight_row = 50,
  treeheight_col = 50,
  breaks = breaks_list  # Apply custom scale range
)
