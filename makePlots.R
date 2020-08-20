#!/usr/bin/env Rscript
library(ggplot2)

args = commandArgs(trailingOnly = TRUE)



d = read.table(args[1])


pdf(file = paste0(strsplit(args[1],split = "\\.")[[1]][1],"_densityplot.pdf"), width = 5, height = 5)
ggplot(d, aes(V1))+
  geom_histogram(aes(y=..density..),color="black", bins = round(max(d$V1)))+
 stat_density(color = "dodgerblue", geom = "line")+
  theme_classic()+
  scale_x_continuous(limits = c(0,max(d$V1)+1),breaks = seq(0,max(d$V1)+1,4))+
  ylab("Density")+
  xlab("Q Score")+
  theme(text = element_text(size =20), line = element_line(size = 1))
dev.off()


pdf(file = paste0(strsplit(args[1],split = "\\.")[[1]][1],"_histogram.pdf"), width = 5, height = 5)
ggplot(d, aes(V1))+
  geom_histogram(color="black", bins = round(max(d$V1)))+
  theme_classic()+
  scale_x_continuous(limits = c(0,max(d$V1)+1),breaks = seq(0,max(d$V1)+1,4))+
  scale_y_continuous(labels = function(x) format(x, scientific = T))+
  ylab("Frequency")+
  xlab("Q Score")+
  theme(text = element_text(size =20), line = element_line(size = 1))
dev.off()









