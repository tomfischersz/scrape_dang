## this file corresponds to dang_eda_01.md
## author: Thomas Fischer
# As there are problems with chinese characters in knit() R Markdown documents,
# the code was run here and results are copied to dang_eda_01.md.



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
dang$publishing_date <- as.Date(dang$publishing_date)
dang$book_title <- trimws(dang$book_title, which = 'left')
dang$鍙风爜 <- NULL
str(dang)

## variable product_id
#It seems that DangDang is using an internal product id. This id also refers to 
# the detail page for each book. For example the book 'At the Park' (DangDang's book title is quite different)
# with product_id ==  'p25171016' can be found with this page: 
#[http://product.dangdang.com/25171016.html](http://product.dangdang.com/25171016.html)
# require(dplyr)
# dang %>%
#     group_by(categories) %>%
#     summarize(N = n(),
#               Unique = length(unique(product_id)))

head(dang[dang$product_id == 'p25171016',] %>% mutate(book_title = substring(book_title,1,20)))

## Variable book_title
#Not merely the title, but rather information found on book cover.
#Often infromation about how many books there are in a set.
# Examples:

# grepl('^ ', dang$book_title)
# dang$book_title <- trimws(dang$book_title, which = 'left')
# dang[!grepl('^ ', dang$book_title),2]
set.seed(128)
sample_books <- sample(dang[dang$num_comments > 100, 1],8)
head(dang[dang$product_id %in% sample_books, 2], n = 8)
# how many (册，本)books in set?
grep('[0-9]+册', dang$book_title, value = TRUE)
dang[!grepl('[0-9]+册', dang$book_title) & grepl('册', dang$book_title),2]
grep('[0-9]+本', dang$book_title, value = TRUE)
grepl('[0-9]+册', dang$book_title)

## Variable author
# dang$author <- as.factor(dang$author)
# summary(dang$author)
author_numbooks <- dang %>%
    group_by(author) %>%
    summarize(N = n()) %>%
    filter(N >= 52) %>%
    arrange(desc(N)) %>% as.data.frame()
head(author_numbooks, n = 20)


par(mai=c(1,2,1,1))
barplot(author_numbooks$N, 
        names.arg = author_numbooks$author,
        horiz = TRUE,
        col = 'blue',
        las = 1)

with(author_numbooks[!author_numbooks$author %in% c('无', ''),],
     barplot(N, 
             names.arg = author,
             horiz = TRUE,
             col = 'blue',
             main = 'Most frequent authors by number of books',
             las = 1))

grep('Seuss', dang$author, value = TRUE)
dang[grepl('Seuss', dang$book_title) | grepl('Seuss', dang$author),c(2,3)]


str(dang)



# Variable categories
table(dang$categories)

NonUniqueProduct <- intersect(dang[dang$categories == 'activity',1],
          dang[dang$categories == 'school_prep',1])
NonUniqueProduct <- c(NonUniqueProduct, intersect(dang[dang$categories == 'child_english',1],
          dang[dang$categories == 'school_prep',1]))
dang[dang$product_id %in% NonUniqueProduct, c(1,11)]
