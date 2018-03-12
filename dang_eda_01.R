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


print('你好')


# Data 
# The data is downloaded from dangdang.com
# filtered by:
# age: 3-6岁
# and three different categories: 益智游戏，少儿英语，入学准备

# for three different categories:

# http://category.dangdang.com/cp01.41.02.13.00.00-srsort_pubdate_desc.html
dang_file <- file.path(data_dir, 'dang_3cat_pdate_20180310_1433.csv')
strptime(regmatches(dang_file, regexpr('[0-9]{6}_[0-9]{4}', dang_file)),
         format = '%y%m%d_%H%M')

dang_file

x <- regmatches(dang_file, regexpr('[0-9]{6}_[0-9]{4}', dang_file)) 
print(x)
strptime(x, format = '%y%m%d_%H%M')


%>% as.numeric()

dang <- read.csv(dang_file,
                 fileEncoding = "UTF-8",
                 stringsAsFactors = FALSE)


str(dang)
