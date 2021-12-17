
### Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2

## Part 1: Explore the dataset

```
# Library
library(dplyr)
library(readr)
library(ggplot2)


## Part 2: Transform data with dplyr and finding insight the data

##เพศที่มีการเข้าคอร์สเตรียมสอบมากที่สุด

StudentsPerformance_original %>% select(test.preparation.course,gender) %>% filter(test.preparation.course != "none") %>% group_by(gender) %>% count() %>% arrange(desc(n))


  gender     n
  <chr>  <int>
1 female   184
2 male     174



##นักเรียนกินอาหารแบบไหนมากที่สุด

StudentsPerformance_original %>% group_by(lunch) %>% count() %>% arrange(desc(n))

 Groups:   lunch [2]
  lunch            n
  <chr>        <int>
1 standard       645
2 free/reduced   355
> 




##นักเรียนเชื้อชาติใดที่คะแนนreadingมากกว่าค่าเฉลี่ยเยอะที่สุด


StudentsPerformance_original %>% filter(reading.score>mean(reading.score)) %>% group_by(race.ethnicity) %>% count()%>% arrange(desc(n))

# Groups:   race.ethnicity [5]
  race.ethnicity     n
  <chr>          <int>
1 group C          163
2 group D          143
3 group E           89
4 group B           85
5 group A           33




##นักเรียนที่คะแนนคณิตศาสตร์ตํ่ากว่า50 กินอาหารแบบใดมากที่สุด


StudentsPerformance_original %>% filter(math.score<50) %>% group_by(lunch) %>% count()%>% arrange(desc(n))

# Groups:   lunch [2]
  lunch            n
  <chr>        <int>
1 free/reduced    96
2 standard        39

















































