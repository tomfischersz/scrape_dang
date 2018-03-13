---
title: "你好 Dangdang EDA"
author: "Thomas Fischer"
date: "March 10, 2018"
output:
  html_document:
    keep_md: yes
---

## Failed attempt, knit not working
**Ah, all of a it changed to japanese???**


# Check how Github handles chinese characters
So we include a typical greeting like (saved this file encoding 'UTF-8'):  
你好

# Loading and preprocessing the data
**1. Load the data**  
Can't display chinese characters in both .md and .html files, knit() not working
#```{r load_data, cache=TRUE}

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
##  $ å·ç          : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ product_id     : chr  "p25237642" "p25226960" "p25095867" "p25230304" ...
##  $ book_title     : chr  " 3¡«6ËêÓ×¶ùÑ§Ç°×¨×¢Á¦ÑµÁ·200Ìâ£¨È«5²á£©" " ÐÂ±àÖÇ»ÛÕÛÖ½´óÈ«¹ù½ðÖÞÀÏÊ¦×÷Æ·£¬¡¶¶ùÍ¯ÕÛÖ½´óÈ«¡·½ãÃÃÆª£¬¼«¾ßÖÐ¹úÌØÉ«ÐÎÏó´ó·ÅËÍ" " Ô½ÍæÔ½´ÏÃ÷µÄÊýÑ§ÓÎÏ·£¨¹²4²á£©" " Ñ§Ç°¾­µäË¼Î¬ÑµÁ·508Ìâ.5-6Ëê.ÉÏÔÚË¼Î¬ÖÐÊÕ»ñ¿ìÀÖ,ÔÚÑµÁ·ÖÐÌá¸ßÖÇÉÌ" ...
##  $ author         : chr  "ÖÇµä°ô°ôÌÇ" "¹ù½ðÖÞ ËÎ±üÎä" "Îâ³¤Ë³" "ì§Òô,Â¶ÁØ ±à" ...
##  $ rating         : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ num_comments   : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ publisher      : chr  "ÖÐ¹ú·ÄÖ¯³ö°æÉç" "ÖÐ¹ú·ÄÖ¯³ö°æÉç" "ÖÐ¹ú¿Æ¼¼³ö°æ´«Ã½¹É·ÝÓÐÏÞ¹«Ë¾" "»¯Ñ§¹¤Òµ³ö°æÉç" ...
##  $ publishing_date: chr  "2018-05-01" "2018-04-01" "2018-03-09" "2018-03-01" ...
##  $ now_price      : chr  "99.00" "27.30" "108.30" "19.00" ...
##  $ pre_price      : num  99 39.8 127.4 25 80.4 ...
##  $ detail         : chr  "3¡«6ËêÓ×¶ùÑ§Ç°×¨×¢Á¦ÑµÁ·200Ìâ£¨È«5²á£©ÊÇÒ»Ì×ÅàÑø¶ùÍ¯¹Û²ìÄÜÁ¦¡¢ÔÚÓÎÏ·¹ý³ÌÖÐÍÆ½ø¶ùÍ¯×¨×¢Á¦ÐÎ³ÉÓë·¢Õ¹µÄÒæÖÇÓÎÏ·Êé"| __truncated__ "¡¶ÐÂ±àÖÇ»ÛÕÛÖ½´óÈ«¡·ÌØµã 1.Ô­´´ÕÛÖ½ÐÎÏó£¬³äÂúÍ¯È¤£¬¸»ÓÐÖÐ¹úÌØÉ«¡£ 2.ÊµÁ¦ÕÛÖ½×¨¼Ò£¬¡¶*¶ùÍ¯ÕÛÖ½´óÈ«¡·µÈ×÷Æ·³©Ïú¶à"| __truncated__ "ÖøÃûÊýÑ§ÓÎÏ·×¨¼ÒÎâ³¤Ë³ÀÏÊ¦ÐÂ×÷£¬±±¾©¿ÆÎ¯¿ÆÆÕ×¨Ïî£¬ÖøÃû¶ùÍ¯×÷¼ÒÖÜÁ«Éº×÷ÐòÍÆ¼ö£¡È«ÐÂÈ¤Ìâ£¬Õðº³ÉÏÊÐ£¡Ò»±¾ÈÃÄã°®²»"| __truncated__ "ÈËÃÇÍ¨³£ÒÔÎªº¢×ÓµÄÖÇÉÌÊÇÓëÉú¾ãÀ´µÄ£¬ÄÑÒÔ¸Ä±ä£¬ÆäÊµ²»È»£¬ºóÌìµÄ¿ª·¢Óëº¢×ÓÖÇÉÌµÄ·¢Õ¹ÃÜ²»¿É·Ö¡£Ã¿¸öº¢×Ó¶¼ÊÇ¶ÀÌØµÄ"| __truncated__ ...
##  $ categories     : chr  "activity" "activity" "activity" "activity" ...
##  - attr(*, ".internal.selfref")=<externalptr>
```

```r
print(as.character(dang[1:3, 3]))
```

```
## [1] " 3¡«6ËêÓ×¶ùÑ§Ç°×¨×¢Á¦ÑµÁ·200Ìâ£¨È«5²á£©"                                        
## [2] " ÐÂ±àÖÇ»ÛÕÛÖ½´óÈ«¹ù½ðÖÞÀÏÊ¦×÷Æ·£¬¡¶¶ùÍ¯ÕÛÖ½´óÈ«¡·½ãÃÃÆª£¬¼«¾ßÖÐ¹úÌØÉ«ÐÎÏó´ó·ÅËÍ"
## [3] " Ô½ÍæÔ½´ÏÃ÷µÄÊýÑ§ÓÎÏ·£¨¹²4²á£©"
```

```r
table(dang$categories)
```

```
## 
##      activity child_english   school_prep 
##          6000          4620          6000
```

```r
hist(dang$num_comments)
```

![](dang_test_files/figure-html/load_data-1.png)<!-- -->
