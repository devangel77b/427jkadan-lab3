library(ggplot2)
library(dplyr)

raw <- read.csv('energy.csv',header=TRUE)
raw$etype <- factor(raw$etype, levels=c("W","KE","GPE"))
data <- tibble(raw)

# happy energy figure
plotdata <- filter(data,type=='happy')
fig7a <- ggplot(plotdata, aes(x=etype,y=E,fill=etype))+
      geom_hline(yintercept=0,color="gray70")+
      stat_summary(fun=mean,geom="bar",color="gray70")+
      stat_summary(fun.data="mean_sdl",fun.args=list(mult=1),geom="errorbar",width=0.2)+
      ylab('energy, \\unit{\\joule}')+
      scale_fill_brewer(palette="PuRd",direction=-1)+
      theme_bw(base_size=8)+
      theme(legend.position="none",axis.title.x=element_blank())
ggsave('fig7a.svg',plot=fig7a,width=3.4167,height=2,units="in")

# sad energy figure
plotdata <- filter(data,type=='sad')
fig7b <- ggplot(plotdata, aes(x=etype,y=E,fill=etype))+
      geom_hline(yintercept=0,color="gray70")+
      stat_summary(fun=mean,geom="bar",color="gray70")+
      stat_summary(fun.data="mean_sdl",fun.args=list(mult=1),geom="errorbar",width=0.2)+
      ylab('energy, \\unit{\\joule}')+
      scale_fill_brewer(palette="GnBu",direction=-1)+
      theme_bw(base_size=8)+
      theme(legend.position="none",axis.title.x=element_blank())
ggsave('fig7b.svg',plot=fig7b,width=3.4167,height=2,units="in")