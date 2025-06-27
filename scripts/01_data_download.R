# load packages from loading script:
source("scripts/00_load_packages.R")

# create cache location to store raw data:
raw_data_dir <- tools::R_user_dir(package = "maEndToEnd", which = "cache")

if (!dir.exists(raw_data_dir)) {
  dir.create(raw_data_dir)
}

# see path:
tools::R_user_dir("maEndToEnd", "cache")
## "C:\\Users\\User\\AppData\\Local/R/cache/R/maEndToEnd"

# download raw data and annotations to cache location:
anno_AE <- getAE("E-MTAB-2967", path = raw_data_dir, type = "raw")
download.file(url = "https://www.ebi.ac.uk/biostudies/files/E-MTAB-2967/E-MTAB-2967.sdrf.txt",
              destfile = file.path(raw_data_dir, "E-MTAB-2967.sdrf.txt"), 
              mode = "wb")
