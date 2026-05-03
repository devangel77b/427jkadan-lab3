library(ggplot2)
library(dplyr)

raw <- read.csv('energy.csv',header=TRUE)
raw$etype <- factor(raw$etype, levels=c("W","KE","GPE"))
data <- tibble(raw)

# happy energy figure
plotdata <- filter(data,type=='happy')
fig7a <- ggplot(plotdata, aes(x=etype,y=E,alpha=etype))+
      geom_hline(yintercept=0,color="gray70")+
      stat_summary(fun=mean,geom="bar",color="gray70",fill='#f8766d')+
      scale_alpha_manual(values=c(1.0,0.5,0.15))+
      stat_summary(fun.data="mean_sdl",fun.args=list(mult=1),geom="errorbar",width=0.2,alpha=1)+
      ylab('energy, \\unit{\\joule}')+
      theme_bw(base_size=8)+
      theme(legend.position="none",axis.title.x=element_blank())
ggsave('fig7a.svg',plot=fig7a,width=3.4167,height=2,units="in")

# sad energy figure
plotdata <- filter(data,type=='sad')
fig7b <- ggplot(plotdata, aes(x=etype,y=E,alpha=etype))+
      geom_hline(yintercept=0,color="gray70")+
      stat_summary(fun=mean,geom="bar",color="gray70",fill='#00bfc4')+
      scale_alpha_manual(values=c(1.0,0.5,0.15))+
      stat_summary(fun.data="mean_sdl",fun.args=list(mult=1),geom="errorbar",width=0.2,alpha=1)+
      ylab('energy, \\unit{\\joule}')+
      theme_bw(base_size=8)+
      theme(legend.position="none",axis.title.x=element_blank())
ggsave('fig7b.svg',plot=fig7b,width=3.4167,height=2,units="in")