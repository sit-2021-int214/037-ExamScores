#Step 1: Loading Library
library(dplyr)
library(readr)
library(ggplot2)
library(tidyverse)

#Step 2: Loading dataset
StudentsPerformance<-read_csv("https://raw.githubusercontent.com/sit-2021-int214/037-StudentsPerformance/main/StudentsPerformance_original.csv")
View(StudentsPerformance)


1.�ȷ���ա����Ҥ����������ͺ�ҡ����ش

StudentsPerformance_original %>% select(test.preparation.course,gender) %>% filter(test.preparation.course != "none") %>% group_by(gender) %>% count() %>% arrange(desc(n))

2.�ѡ���¹�Թ�����Ẻ�˹�ҡ����ش

StudentsPerformance_original %>% group_by(lunch) %>% count() %>% arrange(desc(n))


3.�ѡ���¹���ͪҵ�㴷���ṹreading�ҡ���Ҥ����������з���ش


StudentsPerformance_original %>% filter(reading.score>mean(reading.score)) %>% group_by(race.ethnicity) %>% count()%>% arrange(desc(n))

4.�ѡ���¹����ṹ��Ե��ʵ����ҡ���50 �Թ�����Ẻ��ҡ����ش


StudentsPerformance_original %>% filter(math.score<50) %>% group_by(lunch) %>% count()%>% arrange(desc(n))


##graph3
StudentsPerformance %>% ggplot(aes(x= lunch)) + geom_bar(aes(fill=`race/ethnicity` ))+ ggtitle("��ҿ�ʴ�����������á�ҧ�ѹ�ͧ�������ͪҵ�")

##graph4
StudentsPerformance %>% ggplot(aes(x= `gender`)) + geom_bar(aes(fill=`race/ethnicity`))+ ggtitle("��ҿ�ʴ��ӹǹ���ͪҵԢͧ������")




























