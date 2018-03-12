---
title: "Dangdang EDA"
author: "Thomas Fischer"
date: "March 10, 2018"
output:
  html_document:
    keep_md: yes
---

## Failed attempt, knit not working


# Check how Github handles chinese characters
So we include a typical greeting like (saved this file encoding 'UTF-8'):
娴ｇ姴銈?

# Loading and preprocessing the data
**1. Load the data**  
Can't display chinese characters in both .md and .html files, knit() not working
#```{r load_data, cache=TRUE}

```r
Sys.setlocale("LC_CTYPE", locale="Chinese")
```

```
## [1] "Chinese (Simplified)_China.936"
```

```r
# Sys.setlocale("LC_CTYPE", locale="en_US.UTF-8")
data_dir <- '../data'

dang <- readRDS('../data/dang_3cat_pdate_20180310_1433.RData')
# require(data.table)
# dang <- fread('../data/dang_3cat_pdate_20180310_1433.csv', encoding = 'UTF-8')
str(dang)
```

```
## Classes 'data.table' and 'data.frame':	16620 obs. of  12 variables:
##  $ 氓聫路莽聽聛         : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ product_id     : chr  "p25237642" "p25226960" "p25095867" "p25230304" ...
##  $ book_title     : chr  " 3隆芦6脣锚脫脳露霉脩搂脟掳脳篓脳垄脕娄脩碌脕路200脤芒拢篓脠芦5虏谩拢漏" " 脨脗卤脿脰脟禄脹脮脹脰陆麓贸脠芦鹿霉陆冒脰脼脌脧脢娄脳梅脝路拢卢隆露露霉脥炉脮脹脰陆麓贸脠芦隆路陆茫脙脙脝陋拢卢录芦戮脽脰脨鹿煤脤脴脡芦脨脦脧贸麓贸路脜脣脥" " 脭陆脥忙脭陆麓脧脙梅碌脛脢媒脩搂脫脦脧路拢篓鹿虏4虏谩拢漏" " 脩搂脟掳戮颅碌盲脣录脦卢脩碌脕路508脤芒.5-6脣锚.脡脧脭脷脣录脦卢脰脨脢脮禄帽驴矛脌脰,脭脷脩碌脕路脰脨脤谩赂脽脰脟脡脤" ...
##  $ author         : chr  "脰脟碌盲掳么掳么脤脟" "鹿霉陆冒脰脼 脣脦卤眉脦盲" "脦芒鲁陇脣鲁" "矛搂脪么,脗露脕脴 卤脿" ...
##  $ rating         : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ num_comments   : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ publisher      : chr  "脰脨鹿煤路脛脰炉鲁枚掳忙脡莽" "脰脨鹿煤路脛脰炉鲁枚掳忙脡莽" "脰脨鹿煤驴脝录录鲁枚掳忙麓芦脙陆鹿脡路脻脫脨脧脼鹿芦脣戮" "禄炉脩搂鹿陇脪碌鲁枚掳忙脡莽" ...
##  $ publishing_date: chr  "2018-05-01" "2018-04-01" "2018-03-09" "2018-03-01" ...
##  $ now_price      : chr  "99.00" "27.30" "108.30" "19.00" ...
##  $ pre_price      : num  99 39.8 127.4 25 80.4 ...
##  $ detail         : chr  "3隆芦6脣锚脫脳露霉脩搂脟掳脳篓脳垄脕娄脩碌脕路200脤芒拢篓脠芦5虏谩拢漏脢脟脪禄脤脳脜脿脩酶露霉脥炉鹿脹虏矛脛脺脕娄隆垄脭脷脫脦脧路鹿媒鲁脤脰脨脥脝陆酶露霉脥炉脳篓脳垄脕娄脨脦鲁脡脫毛路垄脮鹿碌脛脪忙脰脟脫脦脧路脢茅"| __truncated__ "隆露脨脗卤脿脰脟禄脹脮脹脰陆麓贸脠芦隆路脤脴碌茫 1.脭颅麓麓脮脹脰陆脨脦脧贸拢卢鲁盲脗煤脥炉脠陇拢卢赂禄脫脨脰脨鹿煤脤脴脡芦隆拢 2.脢碌脕娄脮脹脰陆脳篓录脪拢卢隆露*露霉脥炉脮脹脰陆麓贸脠芦隆路碌脠脳梅脝路鲁漏脧煤露脿"| __truncated__ "脰酶脙没脢媒脩搂脫脦脧路脳篓录脪脦芒鲁陇脣鲁脌脧脢娄脨脗脳梅拢卢卤卤戮漏驴脝脦炉驴脝脝脮脳篓脧卯拢卢脰酶脙没露霉脥炉脳梅录脪脰脺脕芦脡潞脳梅脨貌脥脝录枚拢隆脠芦脨脗脠陇脤芒拢卢脮冒潞鲁脡脧脢脨拢隆脪禄卤戮脠脙脛茫掳庐虏禄"| __truncated__ "脠脣脙脟脥篓鲁拢脪脭脦陋潞垄脳脫碌脛脰脟脡脤脢脟脫毛脡煤戮茫脌麓碌脛拢卢脛脩脪脭赂脛卤盲拢卢脝盲脢碌虏禄脠禄拢卢潞贸脤矛碌脛驴陋路垄脫毛潞垄脳脫脰脟脡脤碌脛路垄脮鹿脙脺虏禄驴脡路脰隆拢脙驴赂枚潞垄脳脫露录脢脟露脌脤脴碌脛"| __truncated__ ...
##  $ categories     : chr  "activity" "activity" "activity" "activity" ...
##  - attr(*, ".internal.selfref")=<externalptr>
```

```r
table(dang$categories)
```

```
## 
##      activity child_english   school_prep 
##          6000          4620          6000
```
