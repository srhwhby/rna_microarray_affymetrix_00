# load packages from loading script:
source("scripts/00_load_packages.R")

# files stored in the ArrayExpress file:
## Investigation Description Format (IDF) --> top level information about the experiment
## Array Design Format (ADF)
## Sample and Data Relationship Format (SDRF) --> data labels/annotations, e.g. disease/healthy
## raw data files --> important
## processed data files

## ExpressionSet class contained in Biobase package is a data structure used to store microarray data in Bioconductor.

# Import of annotation data and microarray expression data as “ExpressionSet”:
## import SDRF file:
sdrf_location <- file.path(raw_data_dir, "E-MTAB-2967.sdrf.txt")
SDRF <- read.delim(sdrf_location)
## sample names are given in the first column and will be used as row names in an AnnotatedDataFrame:
rownames(SDRF) <- SDRF$Array.Data.File
SDRF <- AnnotatedDataFrame(SDRF)

## test ExpressionSet creation:
file.access("C:/Users/User/AppData/Local/R/cache/R/maEndToEnd/164_I_.CEL", mode = 4) # check permission "C:/Users/User/AppData/Local/R/cache/R/maEndToEnd/164_I_.CEL"
test_files <- head(SDRF$Array.Data.File, 3)
file.exists(file.path(raw_data_dir, test_files))

one_file <- file.path(raw_data_dir, test_files[1])
read_test <- oligo::read.celfiles(one_file, verbose = TRUE)
#affyio::read.celfile.header(one_file)$ChipType

test_raw <- oligo::read.celfiles(
  file.path(raw_data_dir, test_files),
  phenoData = AnnotatedDataFrame(SDRF[1:3, ]),
  verbose = TRUE
)
## create ExpressionSet object, contains array intensities, pheno data(from SDRF), information of the chip annotation package:
raw_data <- oligo::read.celfiles(filenames = file.path(raw_data_dir, 
                                                       SDRF$Array.Data.File),
                                 verbose = FALSE, phenoData = SDRF)
stopifnot(validObject(raw_data))



