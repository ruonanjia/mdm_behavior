rm(list=ls())
path <- "E:/Ruonan/Projects in the lab/MDM Project/Medical Decision Making Imaging/MDM_imaging/Behavioral Analysis/Behavior Analysis"

setwd(path)

log_file <- "log_11082019.csv"
nonpar_file <- "nonpar_11082019.csv"
rating_file <- "rating_11082019.csv"
# par_ambigSVPar_file <- "par_09300219.csv" # values constrained between 0-50
# par_ambigSVPar_file <- "par_SV100_new_051120.csv" # values constrained between 0-100
par_ambigSVPar_file <- "par_SV100_rand_052220.csv" # values constrained between 0-100, random search val
post_scan_file <- "mdm_post_scan_01162020.csv"
question_file <- "mdm_questionnaire_factor_012720.csv"

log <- read.csv(log_file, header = TRUE)
nonpar <- read.csv(nonpar_file, header = TRUE)
rating <- read.csv(rating_file, header = TRUE)
par_ambigSVPar <- read.csv(par_ambigSVPar_file, header = TRUE)
post_scan <- read.csv(post_scan_file, header = TRUE)
question <- read.csv(question_file, header = TRUE)

tab1 <- merge(log, nonpar, by = c("id"))
tab2 <- merge(tab1, rating, by = c("id", "is_med"))
tab3 <- merge(tab2, par_ambigSVPar, by = c("id", "is_med"))
tab4 <- merge(tab3, post_scan, by = c("id", "is_med"))
tab5 <- merge(tab4, question, by = c("id"))

data_all <- tab5

id_4 = unique(tab4$id[tab4$is_exclude_behavior == 0])
id_5 = unique(tab5$id[tab5$is_exclude_behavior == 0])

data_all$id <- as.factor(data_all$id)
data_all$is_med <- as.factor(data_all$is_med)
data_all$is_male <- as.factor(data_all$is_male)

save(data_all, file = "data_all_05222020.rda")
