path <- "D:/Ruonan/Projects in the lab/MDM Project/Medical Decision Making Imaging/MDM_imaging/Behavioral Analysis/Behavior Analysis"

setwd(path)

log_file <- "log_11082019.csv"
nonpar_file <- "nonpar_11082019.csv"
rating_file <- "rating_11082019.csv"
par_ambigSVPar_file <- "par_09300219.csv"

log <- read.csv(log_file, header = TRUE)
nonpar <- read.csv(nonpar_file, header = TRUE)
rating <- read.csv(rating_file, header = TRUE)
par_ambigSVPar <- read.csv(par_ambigSVPar_file, header = TRUE)

tab1 <- merge(log, nonpar, by = c("id"))
tab2 <- merge(tab1, rating, by = c("id", "is_med"))
tab3 <- merge(tab2, par_ambigSVPar, by = c("id", "is_med"))

data_all <- tab3

data_all$id <- as.factor(data_all$id)
data_all$is_med <- as.factor(data_all$is_med)
data_all$is_male <- as.factor(data_all$is_male)

save(data_all, file = "data_all_11132019.rda")
