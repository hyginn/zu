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
# Version:  1.0
# Date:     2018 01 25
# Author:   Boris Steipe <boris.steipe@utoronto.ca>
#
# Version history:
#           1.0  production dataset, January 2018
#
# ToDo:
# Notes:
#
# ==============================================================================


# ====  PARAMETERS  ============================================================

ORF <-  "ftp://ftp.ebi.ac.uk/pub/databases/genenames/new/tsv/locus_types/gene_with_protein_product.txt"
rRNA <- "ftp://ftp.ebi.ac.uk/pub/databases/genenames/new/tsv/locus_types/RNA_ribosomal.txt"
tRNA <- "ftp://ftp.ebi.ac.uk/pub/databases/genenames/new/tsv/locus_types/RNA_transfer.txt"
vRNA <- "ftp://ftp.ebi.ac.uk/pub/databases/genenames/new/tsv/locus_types/RNA_vault.txt"
TCR <-  "ftp://ftp.ebi.ac.uk/pub/databases/genenames/new/tsv/locus_types/T_cell_receptor_gene.txt"
IG <-   "ftp://ftp.ebi.ac.uk/pub/databases/genenames/new/tsv/locus_types/immunoglobulin_gene.txt"
PCDH <- "ftp://ftp.ebi.ac.uk/pub/databases/genenames/new/tsv/locus_types/protocadherin.txt"


# ====  PACKAGES  ==============================================================

if (! require(readr, quietly=TRUE)) {
  install.packages("readr")
  library(readr)
}

# ====  PROCESS  ===============================================================
tmp <- read_tsv(ORF)
str(tmp$symbol)
HUGOsymbols <- tmp$symbol

tmp <- read_tsv(rRNA)
str(tmp$symbol)
HUGOsymbols <- c(HUGOsymbols, tmp$symbol)

tmp <- read_tsv(tRNA)
str(tmp$symbol)
HUGOsymbols <- c(HUGOsymbols, tmp$symbol)

tmp <- read_tsv(vRNA)
str(tmp$symbol)
HUGOsymbols <- c(HUGOsymbols, tmp$symbol)

tmp <- read_tsv(TCR)
str(tmp$symbol)
HUGOsymbols <- c(HUGOsymbols, tmp$symbol)

tmp <- read_tsv(IG)
str(tmp$symbol)
HUGOsymbols <- c(HUGOsymbols, tmp$symbol)

tmp <- read_tsv(PCDH)
str(tmp$symbol)
HUGOsymbols <- c(HUGOsymbols, tmp$symbol)


# assess
any(duplicated(HUGOsymbols))   # Must be FALSE
any(is.na(HUGOsymbols))        # Must be FALSE
str(HUGOsymbols)               # Must be character vector
length(HUGOsymbols)            # 20,348

# save

save(HUGOsymbols, file = "inst/extdata/HUGOsymbols.RData")


# [END]
