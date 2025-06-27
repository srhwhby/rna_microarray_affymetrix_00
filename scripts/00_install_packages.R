# initialize renv:
install.packages("renv")
renv::init()

#reset environment:
renv::deactivate()
unlink("renv", recursive = TRUE)       # delete local project library
unlink("renv.lock")                    # delete lockfile (optional)
renv::init()                           # re-initialize clean environment

# Install all required packages for the project:
## packages are wrapped in 'maEndToEn':
if (!require("BiocManager"))
  install.packages("BiocManager")
BiocManager::install("maEndToEnd")
### do not update packages when editing older public projects

# lock the package and version state:
renv::snapshot()
# record the exact versions for transparency

#package dependencies:
browseVignettes("maEndToEnd")
packageDescription("maEndToEnd")$Depends
packageDescription("maEndToEnd")$Imports
packageDescription("maEndToEnd")$Suggests
suppressPackageStartupMessages({library("maEndToEnd")})
#session info:
sessionInfo()
