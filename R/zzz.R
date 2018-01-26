# zzz.R
#
# Package startup and unload functions




# .onLoad <- function(libname, pkgname) {
#
#     invisible()
# }


.onAttach <- function(libname, pkgname) {
  # Startup message
  m <- character()
  m[1] <- "\nWelcome to zu.\n"

  packageStartupMessage(paste(m, collapse=""))
}


# .onUnload <- function(libname, pkgname) {
#
#     invisible()
# }



# [END]
