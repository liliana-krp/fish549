## reprex

## load the library
library(palmerpenguins)

## get the data & inspect them
data(package = 'palmerpenguins')
head(penguins)

## write the first 10 rows of data
dput(penguins[1:10,])

## assign output to an object
dat <- structure(list(species = structure(c(1L, 1L, 1L, 1L, 1L, 1L, 
                                            1L, 1L, 1L, 1L), .Label = c("Adelie", "Chinstrap", "Gentoo"), class = "factor"), 
                      island = structure(c(3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 
                                           3L), .Label = c("Biscoe", "Dream", "Torgersen"), class = "factor"), 
                      bill_length_mm = c(39.1, 39.5, 40.3, NA, 36.7, 39.3, 38.9, 
                                         39.2, 34.1, 42), bill_depth_mm = c(18.7, 17.4, 18, NA, 19.3, 
                                                                            20.6, 17.8, 19.6, 18.1, 20.2), flipper_length_mm = c(181L, 
                                                                                                                                 186L, 195L, NA, 193L, 190L, 181L, 195L, 193L, 190L), body_mass_g = c(3750L, 
                                                                                                                                                                                                      3800L, 3250L, NA, 3450L, 3650L, 3625L, 4675L, 3475L, 4250L
                                                                                                                                 ), sex = structure(c(2L, 1L, 1L, NA, 1L, 2L, 1L, 2L, NA, 
                                                                                                                                                      NA), .Label = c("female", "male"), class = "factor"), year = c(2007L, 
                                                                                                                                                                                                                     2007L, 2007L, 2007L, 2007L, 2007L, 2007L, 2007L, 2007L, 2007L
                                                                                                                                                      )), row.names = c(NA, -10L), class = c("tbl_df", "tbl", "data.frame"
                                                                                                                                                      ))

## inspect the object
dat

## install package
install.packages('reprex')

## load package
library(reprex)

## practice code
a <- 1
b <- 0
a / b
