---
title: "Dangdang EDA"
author: "Thomas Fischer"
date: "March 10, 2018"
output:
  html_document:
    keep_md: yes
---

## Data

# Data 

The data is downloaded from [dangdang.com](http://www.dangdang.com)  
and sorted by: 出版时间 (publishing date)  
**The filters are:**  
age: 3-6岁  
and three different categories: 
- 益智游戏 (activity and games)
- 少儿英语 (children english)
- 入学准备 (preparation for school)  

Example website: [activity and games](http://category.dangdang.com/cp01.41.02.13.00.00-srsort_pubdate_desc.html)



```r
Sys.setlocale("LC_CTYPE", locale="Chinese")
```
