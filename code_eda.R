# Sample file

library(dplyr)
library(readr)
library(ggplot2)
library(tidyverse)
StudentsPerformance<-read_csv("https://raw.githubusercontent.com/sit-2021-int214/037-StudentsPerformance/main/StudentsPerformance_original.csv")
View(StudentsPerformance)


#1.raceใดที่มีคะแนนเฉลี่ยในmath score
StudentsPerformance%>%group_by(`race/ethnicity`)%>%
summarise(avg=mean(`math score`))%>%
arrange(desc(`race/ethnicity`))%>%head(1)

#2.คนที่เข้าคอร์สเตรียมสอบมีคะแนนวิชาreadingเฉลี่ยเท่าไหร่

StudentsPerformance%>%group_by(`test preparation course`)%>%
summarise(avg=mean(`reading score`))%>%  
filter(`test preparation course` == 'completed')  


#3.ระหว่างคนที่เข้าคอร์สเตรียมสอบและไม่ได้เตรียมสอบมีคะแนนเฉลี่ยวิชาwritingเท่าไหร่
StudentsPerformance%>%group_by(`test preparation course`)%>%
  summarise(avg=mean(`writing score`))%>%  
  filter(`test preparation course` == 'completed')  



StudentsPerformance%>%group_by(`test preparation course`)%>%
  summarise(avg=mean(`writing score`))%>%  
  filter(`test preparation course` == 'none')
  
  

#4.แต่ละ parental level of education มี lunch แบบละเท่าใด


StudentsPerformance%>%group_by(`parental level of education`)%>%
count(lunch)  




##graph1
StudentsPerformance %>% ggplot(aes(x=`gender`))+
  geom_bar(aes(fill= `lunch`))

##graph2
StudentsPerformance %>%ggplot(aes(x=`race/ethnicity`))+
  geom_bar(aes(fill= `parental level of education`))

















