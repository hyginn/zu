# makeHUGOsymbolsList.R
#
# Purpose:  Prepare a list of all HUGO recognized symbols for genes with a
#           protein product, rRNA, tRNA, and vault RNA, T-Cell receptors,
#           immunoglobulin genes, and protocadherin
#           cf. https://www.genenames.org/cgi-bin/statistics
#
#           Result: inst/extdata/HUGOsymbols.RData is a character vector
#           containing all HUGO symbols for the above categories. They are
#           confirmed to be unique and they CAN be used as rownames.
#
# Version:  1.1
# Date:     2018 01 25
# Author:   Boris Steipe <boris.steipe@utoronto.ca>
#
# Version history:
#           1.1  refactor code
#           1.0  production dataset, January 2018
#
# ToDo:
# Notes:
#
# ==============================================================================


# ====  PARAMETERS  ============================================================

BASEURL <- "ftp://ftp.ebi.ac.uk/pub/databases/genenames/new/tsv/locus_types/"

myHUGOfiles <- data.frame(tags = c("ORF", "rRNA", "tRNA", "vRNA",
                                   "TCR", "IG", "PCDH"),
                          fNames = c("gene_with_protein_product.txt",
                                     "RNA_ribosomal.txt",
                                     "RNA_transfer.txt",
                                     "RNA_vault.txt",
                                     "T_cell_receptor_gene.txt",
                                     "immunoglobulin_gene.txt",
                                     "protocadherin.txt"),
                          stringsAsFactors = FALSE)


# ====  PACKAGES  ==============================================================

if (! require(readr, quietly=TRUE)) {
  install.packages("readr")
  library(readr)
}

# ====  PROCESS  ===============================================================


HUGOsymbols <- character()

# ftp all required datasets and get $symbol column
for (fName in myHUGOfiles$fNames) {
  tmp <- read_tsv(paste0(BASEURL, fName))
  HUGOsymbols <- c(HUGOsymbols, tmp$symbol)
}
rm(tmp)

# assess
any(duplicated(HUGOsymbols))   # Must be FALSE
any(is.na(HUGOsymbols))        # Must be FALSE
str(HUGOsymbols)               # Must be character vector
length(HUGOsymbols)            # 20,348

# save

save(HUGOsymbols, file = "inst/extdata/HUGOsymbols.RData")


# [END]
