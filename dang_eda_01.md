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
and sorted by: ???????????? (publishing date)  
**The filters are:**  
age: 3-6???  
and three different categories: 
- ???????????? (activity and games)
- ???????????? (children english)
- ???????????? (preparation for school)  

Example website: [activity and games](http://category.dangdang.com/cp01.41.02.13.00.00-srsort_pubdate_desc.html)



```r
Sys.setlocale("LC_CTYPE", locale="Chinese")
```
