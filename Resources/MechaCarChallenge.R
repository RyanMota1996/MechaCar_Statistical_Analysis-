##D1
##1
library(dplyr)

##2

library(tidyverse)
mechacar_mpg <- read.csv("MechaCar_mpg.csv", check.names = F,stringsAsFactors = F)

##3

lm(mpg ~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_mpg )

##4

summary(lm(mpg ~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_mpg))

##D2

sus_coil <- read.csv("Suspension_coil.csv", check.names = F, stringsAsFactors = F)

total_summary <- sus_coil %>% summarize(Mean_PSI = mean(PSI),
                                        Median_PSI  = median(PSI),
                                        Var_PSI =var(PSI),
                                        St_Dev_PSI = sd(PSI),
                                        Num_Coil = n(), .groups = 'keep')

lot_summary <- sus_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI = mean(PSI),
                                                                      Median_PSI  = median(PSI),
                                                                      Var_PSI =var(PSI),
                                                                      St_Dev_PSI = sd(PSI),
                                                                      Num_Coil = n(), .groups = 'keep')
plt1 <- ggplot(sus_coil, aes(y=PSI))
plt1 + geom_boxplot()

plt2 <- ggplot(sus_coil, aes(x=Manufacturing_Lot,y=PSI))
plt2 + geom_boxplot()

##D3
t.test(sus_coil$PSI,mu=1500)
lot1 <- subset(sus_coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(sus_coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(sus_coil, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)