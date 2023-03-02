#---- Downloading files from online ----

# Here is an example of downloading some river flow data from the 
# U.S. Geological Survey National Water Information System.

# We will use the direct link to the gauge data from the Skagit River 
# near Mount Vernon, WA (gauge #12178000). 

## first & last years of flow data
yr_frst <- 2001
yr_last <- 2020

## flow gauge ID
flow_site <- 12178000

## get URL for flow data from USGS
flow_url <- paste0("https://waterdata.usgs.gov/nwis/dv",
                   "?cb_00060=on",
                   "&format=rdb",
                   "&site_no=", flow_site,
                   "&begin_date=", yr_frst, "-01-01",
                   "&end_date=", yr_last, "-12-31")

## load `readr` package
library("readr")

## raw flow data from USGS
flow_raw <- read_lines(flow_url)

## lines with metadata
hdr_flow <- which(lapply(flow_raw, grep, pattern = "\\#") == 1,
                  arr.ind = TRUE)

## print flow metadata
print(flow_raw[hdr_flow], quote = FALSE)

## flow data for years of interest
dat_flow <-  read_tsv(flow_url,
                      col_names = FALSE,
                      col_types = "ciDdc",
                      skip = max(hdr_flow) + 2)

## revise column names
colnames(dat_flow) <- unlist(strsplit(tolower(flow_raw[max(hdr_flow) + 1]),
                                      split = "\\s+"))
## inspect tibble
head(dat_flow)

## keep only relevant columns
dat_flow <- dat_flow[c("datetime",
                       grep("[0-9]$", colnames(dat_flow), value = TRUE))]

## nicer column names
colnames(dat_flow) <- c("date", "flow")

## convert cubic feet to cubic meters
dat_flow$flow <- dat_flow$flow / 35.3147

## flow by year & month
dat_flow$year <- as.integer(format(dat_flow$date, "%Y"))
dat_flow$month <- as.integer(format(dat_flow$date, "%m"))
dat_flow <- dat_flow[, c("year", "month", "flow")]

## inspect the file
head(dat_flow)



#---- Reading .csv files ----
## read penguin data
data_raw <- read.csv(here("data", "palmer_penguins.csv"))

## inspect its content
head(data_raw)

## Read with the readr package?
data_raw2 <- read_csv(here("data", "palmer_penguins.csv"))



#---- Reading excel files ----
## load readxl
library(readxl)

## inspect the sheet names
excel_sheets("data/climate_change_download_0.xls")

## read in the "Data" worksheet
cc_data <- read_excel("data/climate_change_download_0.xls", sheet = "Data")

## inspect it
head(cc_data) # lots of warnings, see below

## try again
cc_data <- read_excel("data/climate_change_download_0.xls",
                      sheet     = "Data",
                      range     = "G481:L498",
                      col_names = as.character(c(1990:1995)),
                      na        = "..")
head(cc_data)



#---- Reading google sheet files ----

## load the packge
library(googlesheets4)

## authorize for reading public-only sheets
gs4_deauth()

## specify URL
gs_url <- "https://docs.google.com/spreadsheets/d/1ct3MMMzEX82BeqJcUw3uYD5b4CJrKUmRYCK-wVA3yig/edit#gid=0"

## read from URL
read_sheet(gs_url)

## assign it to an object
gs_raw <- read_sheet(gs_url)

## specify ID
gs_id <- as_sheets_id(gs_url)

## read from ID
read_sheet(gs_id)

## assign it to an object
gs_raw <- read_sheet(gs_id)

## browse sheet contents
gs4_get(gs_id)

## read in a subset of cells
read_sheet(gs_id, range = "A1:B10")


#---- Reading JSON / Github API files ----

## load the pckage
library(jsonlite)

## set the URL
github_url = "https://api.github.com/users/mdscheuerell/repos"

## get the JSON data
data_json <- fromJSON(github_url)

## all of the JSON names
names(data_json)

## table of the number of forks
table(data_json$forks)

## table number of the different languages
table(data_json$language)

## how many repos have open issues?
table(data_json$open_issues_count)