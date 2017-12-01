# solid-octo-succotash
Data Wrangling using R 
library(mongolite)
library(openxlsx) #load package
data<-read.csv("Bird Strikes.csv")
mongoData<- mongo("data")
str(mongoData)
mongoData$insert(data)
mongoData$export(file("data.txt"))
airports<-mongoData$distinct("Airport__Name")
head(airports)
airports
mongoData$count('{"Origin_State":"New Jersey"}')
ConditionsPrecipitation <- mongoData$find('{"Conditions__Precipitation":"Fog"}',sort='{"Record_ID":-1}')
head(ConditionsPrecipitation)
View(ConditionsPrecipitation)
dat <- mongoData$find('{$and:[{"Aircraft__Airline_Operator":"AMERICAN AIRLINES"},{"Aircraft__Airline_Operator":"CONTINENTAL AIRLINES"}']}, 
                      fields = '{"Record_ID":1, "Origin_State":1, "Aircraft__Airline_Operator":1,"Airport__Name":1}')
head(dat)
View(dat)
