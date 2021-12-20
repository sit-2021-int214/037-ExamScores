#Step 1: Loading Library
library(dplyr)
library(readr)
library(ggplot2)
library(tidyverse)

#Step 2: Loading dataset
StudentsPerformance<-read_csv("https://raw.githubusercontent.com/sit-2021-int214/037-StudentsPerformance/main/StudentsPerformance_original.csv")
View(StudentsPerformance)


1.เพศที่มีการเข้าคอร์สเตรียมสอบมากที่สุด

StudentsPerformance_original %>% select(test.preparation.course,gender) %>% filter(test.preparation.course != "none") %>% group_by(gender) %>% count() %>% arrange(desc(n))

2.นักเรียนกินอาหารแบบไหนมากที่สุด

StudentsPerformance_original %>% group_by(lunch) %>% count() %>% arrange(desc(n))


3.นักเรียนเชื้อชาติใดที่คะแนนreadingมากกว่าค่าเฉลี่ยเยอะที่สุด


StudentsPerformance_original %>% filter(reading.score>mean(reading.score)) %>% group_by(race.ethnicity) %>% count()%>% arrange(desc(n))

4.นักเรียนที่คะแนนคณิตศาสตร์ตํ่ากว่า50 กินอาหารแบบใดมากที่สุด


StudentsPerformance_original %>% filter(math.score<50) %>% group_by(lunch) %>% count()%>% arrange(desc(n))


##graph3
StudentsPerformance %>% ggplot(aes(x= lunch)) + geom_bar(aes(fill=`race/ethnicity` ))+ ggtitle("กราฟแสดงประเภทอาหารกลางวันของแต่ละเชื้อชาติ")

##graph4
StudentsPerformance %>% ggplot(aes(x= `gender`)) + geom_bar(aes(fill=`race/ethnicity`))+ ggtitle("กราฟแสดงจำนวนเชื้อชาติของแต่ละเพศ")




























