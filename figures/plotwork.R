library(ggplot2)
library(dplyr)

raw <- read.csv('work.csv',header=TRUE)
data <- tibble(raw)
data <- mutate(data, trial=as.factor(trial))

fig <- ggplot(data, aes(x=x,y=F))+
    geom_point(color="skyblue")+
    stat_summary(fun=mean,geom="line",color="skyblue")+
    stat_summary(fun=mean,geom="area",fill="skyblue",alpha=0.5)+
    xlab('$x$, \\unit{\\meter}')+
    ylab('$F$, \\unit{\\newton}')+
    theme_bw(base_size=8)
ggsave(filename='work.svg',plot=fig,width=3.44,height=2,units='in')

grouped <- group_by(data,trial)
library(pracma)
Wgrouped = summarize(grouped,
	  W= trapz(x,F))
print(summarize(Wgrouped,
	meanW = mean(W),
	sdW = sd(W)))
	