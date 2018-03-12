## this file corresponds to dang_eda_01.md
## author: Thomas Fischer




# ----------- Some Settings ----------------------------------------------------
setwd('C:/Users/user/Desktop/DangDang/scrape_dang_git/')
rm(list = ls())
data_dir <- '../data'

Sys.getlocale(category = "LC_CTYPE")
#[1] "English_United States.1252"
# storing chinese characters in data.frame seems to work with
Sys.setlocale("LC_CTYPE", locale="Chinese")


# The data is downloaded from [dangdang.com](http://www.dangdang.com)  
# and sorted by: 出版时间 (publishing date)  
# **The filters are:**  
#     age: 3-6岁  
# and three different categories: 
#     - 益智游戏 (activity and games)
# - 少儿英语 (children english)
# - 入学准备 (preparation for school)  
# 
# Example website: [activity and games](http://category.dangdang.com/cp01.41.02.13.00.00-srsort_pubdate_desc.html)

## Load Data
dang_file <- file.path(data_dir, 'dang_3cat_pdate_20180310_1433.csv')
strptime(regmatches(dang_file, regexpr('[0-9]{6}_[0-9]{4}', dang_file)),
         format = '%y%m%d_%H%M')
dang <- read.csv(dang_file,
                 fileEncoding = "UTF-8",
                 stringsAsFactors = FALSE)


str(dang)
