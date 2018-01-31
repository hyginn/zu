# scriptTemplate.R
#
# Purpose:
# Version:
# Date:
# Author:
#
# Input:
# Output:
# Dependencies:
#
# Version history:
#
# ToDo:
# Notes:
#
# ==============================================================================


# ====  PARAMETERS  ============================================================
# Define and explain all parameters. No "magic numbers" in your code below.



# ====  PACKAGES  ==============================================================
# Load all required packages. Example for the idiom:

if (! require(stringr, quietly=TRUE)) {
  install.packages("stringr")
  library(stringr)
}
# Package information:
#  library(help = stringr)       # basic information
#  browseVignettes("stringr")    # available vignettes
#  data(package = "stringr")     # available datasets




# ====  FUNCTIONS  =============================================================

# Define functions or source external files

myFunction <- function(a, b=1) {
	# Purpose:
	#     Describe ...
	# Parameters:
	#     a: ...
	#     b: ...
	# Value:
	#     result: ...

	# code ...

	return(result)
}



# ====  PROCESS  ===============================================================
# Enter the step-by-step process of your script here. Strive to write your
# code so that you can simply run this entire file and re-create all
# intermediate results.






# ====  TESTS  =================================================================
# Enter your tests here...  (Note: these are not tests for functions in the
# package!)


# [END]
