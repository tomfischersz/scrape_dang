---
title: "Dangdang EDA"
author: "Thomas Fischer"
date: "March 10, 2018"
output:
  html_document:
    keep_md: yes
---

## Data

The data is downloaded from [dangdang.com](http://www.dangdang.com)  
and sorted by: 出版时间 (publishing date)  
**The filters are:**  
age: 3-6岁  
and three different categories: 
- 益智游戏 (activity and games)
- 少儿英语 (children english)
- 入学准备 (preparation for school)  

Example website: [activity and games](http://category.dangdang.com/cp01.41.02.13.00.00-srsort_pubdate_desc.html)


## Load data
The file we are loading is from 2018-03-10 14:33
```r
dang_file <- file.path(data_dir, 'dang_3cat_pdate_20180310_1433.csv')
strptime(regmatches(dang_file, regexpr('[0-9]{6}_[0-9]{4}', dang_file)),
         format = '%y%m%d_%H%M')
dang <- read.csv(dang_file,
                 fileEncoding = "UTF-8",
                 stringsAsFactors = FALSE)
```
```
## data.frame':	16620 obs. of  11 variables:
##  $ product_id     : chr  "p25237642" "p25226960" "p25095867" "p25230304" ...
##  $ book_title     : chr  " 3～6岁幼儿学前专注力训练200题（全5册）" " 新编智慧折纸大全郭金洲老师作品，《儿童折纸大全》姐妹篇，极具中国特色形象大放送" " 越玩越聪明的数学游戏（共4册）" " 学前经典思维训练508题.5-6岁.上在思维中收获快乐,在训练中提高智商" ...
##  $ author         : chr  "智典棒棒糖" "郭金洲 宋秉武" "吴长顺" "歆音,露霖 编" ...
##  $ rating         : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ num_comments   : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ publisher      : chr  "中国纺织出版社" "中国纺织出版社" "中国科技出版传媒股份有限公司" "化学工业出版社" ...
##  $ publishing_date: chr  "2018-05-01" "2018-04-01" "2018-03-09" "2018-03-01" ...
##  $ now_price      : num  99 27.3 108.3 19 55.2 ...
##  $ pre_price      : num  99 39.8 127.4 25 80.4 ...
##  $ detail         : chr  "3～6岁幼儿学前专注力训练200题（全5册）是一套培养儿童观察能力、在游戏过程中推进儿童专注力形成与发展的益智游戏书"| __truncated__ "《新编智慧折纸大全》特点 1.原创折纸形象，充满童趣，富有中国特色。 2.实力折纸专家，《*儿童折纸大全》等作品畅销多"| __truncated__ "著名数学游戏专家吴长顺老师新作，北京科委科普专项，著名儿童作家周莲珊作序推荐！全新趣题，震撼上市！一本让你爱不"| __truncated__ "人们通常以为孩子的智商是与生俱来的，难以改变，其实不然，后天的开发与孩子智商的发展密不可分。每个孩子都是独特的"| __truncated__ ...
##  $ categories     : chr  "activity" "activity" "activity" "activity" ...
 ```