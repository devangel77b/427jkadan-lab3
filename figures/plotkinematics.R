library(ggplot2)
library(dplyr)


raw <- read.csv('kinematics.csv',header=TRUE)
data <- tibble(raw)

massdata <- tibble(read.csv('mass.csv',header=TRUE))
data <- data |> full_join(massdata)
g = 9.81
data <- mutate(data,
     GPE = m*g*h,
     KE = 1/2*m*v0^2)

# happy-sad height figure
model1 <- aov(h~type,data)
fig4 <- ggplot(data,aes(x=type,y=h,fill=type))+
     stat_summary(fun="mean",geom="bar")+
     stat_summary(fun.data="mean_sdl",fun.args=list(mult=1),geom="errorbar",width=0.2)+
     annotate("text",x=2,y=1.4,label="***",size=8/.pt)+
     ylab('$h$, \\unit{\\meter}')+
     theme_bw(base_size=8)+
     theme(legend.position="none",
	axis.title.x=element_blank())
ggsave('fig4.svg',plot=fig4,width=1.7,height=2,units="in")

# happy-sad velocity figure
model2 <- aov(v0~type,data)
fig5 <- ggplot(data,aes(x=type,y=v0,fill=type))+
     stat_summary(fun="mean",geom="bar")+
     stat_summary(fun.data="mean_sdl",fun.args=list(mult=1),geom="errorbar",width=0.2)+
     annotate("text",x=2,y=5,label="***",size=8/.pt)+
     ylab('$v_0$, \\unit{\\meter\\per\\second}')+
     theme_bw(base_size=8)+
     theme(legend.position="none",
	axis.title.x=element_blank())
ggsave('fig5.svg',plot=fig5,width=1.7,height=2,units="in")

# energy figure in other file