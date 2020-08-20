library(dplyr)
library(readr)
library(ggplot2)
library(reshape2)

dd <- read_tsv("~/CHELYDRA_SERPENTINA_GENOME/G3_FIGURES/ORTHOFINDER_FIGURE/Statistics_PerSpecies.tsv", n_max = 10)
colnames(dd)[1]="stat"

colnames(dd) <- c("stat","Alligator mississippiensis", "Gallus gallus","Homo sapiens","Mus musculus","Pelodiscus sinensis","Rattus norvegicus",
                  "Chrysemys picta","Chelydra serpentina","Terrapene carolina triunguis","Chelonia mydas","Gopherus evgoodi","Alligator sinensis","Taeniopygia guttata","Crocodylus porosus","Meleagris gallopavo",
                  "Danio rerio","Platysternon megacephalum")



ddm <- melt(dd, id.vars = c("stat"))
ddm


ggplot(ddm, aes(variable, value, fill = stat))+
  geom_col()+
  coord_flip()+
  facet_wrap(~stat, scales = "free")

ddf <- dd[c(2,3,9),]
ddf[4,2:ncol(ddf)] <- ddf[1,2:ncol(ddf)] - ddf[3,2:ncol(ddf)]
ddf[4,1] = "Number of genes in conserved orthogroups"
ddf <- ddf[2:4,]
ddf <- melt(ddf, id.vars = c("stat"))

ggplot(ddf, aes(variable, value, fill = stat))+
  geom_col(position = "stack")+
  coord_flip()+
  xlab(NULL)+
  ylab("Number of Genes")




ddf <- dd[c(4,5,10),]
ddf[4,2:ncol(ddf)] <- ddf[1,2:ncol(ddf)] - ddf[3,2:ncol(ddf)]
ddf[4,1] = "In orthogroup"
ddf[3,1] = "In species-specific orthogroup"
ddf[2,1] = "Unassigned"
ddf <- ddf[2:4,]
ddf



ddf <- melt(ddf, id.vars = c("stat"))

ggplot(ddf, aes(variable, value, fill = stat))+
  geom_col(position = "stack")+
  coord_flip()+
  xlab(NULL)+
  ylab("Percent of Genes")+
  theme_classic()+
  scale_y_continuous(expand = c(0.005,0.005))+
  scale_x_discrete(limits = c(order1))+
  theme(legend.title = element_blank(), 
      legend.position = "bottom", 
      legend.background = element_rect(color = "black",size = 0.5, linetype = "solid"),
      legend.text = element_text(face = "bold" ),
      axis.text = element_text(face= "bold", size = 13),
      axis.title = element_text(face = "bold", size = 13),
      plot.margin = unit(c(1,1,1,1),"cm"))+ 
  guides(fill = guide_legend(reverse=TRUE))
  scale_fill_discrete(name = "Ortholog Multiplicity", labels = c("many-many","many-1","1-many","1-1"))





  
  
colnames(dd)
order1 = colnames(dd)[c(17,4,7,5,14,16,3,6,18,8,10,12,9,11,15,2,13)]
order1 = rev.default(order1)




#### multiplicity to hsa


oto <- read_tsv("~/CHELYDRA_SERPENTINA_GENOME/G3_FIGURES/ORTHOFINDER_FIGURE/Comparative_Genomics_Statistics/OrthologuesStats_one-to-one.tsv")
colnames(oto)[1] = "species"
otoh <- oto[,c(1,4)]
otoh

otm <- read_tsv("~/CHELYDRA_SERPENTINA_GENOME/G3_FIGURES/ORTHOFINDER_FIGURE/Comparative_Genomics_Statistics/OrthologuesStats_one-to-many.tsv")
colnames(otm)[1] = "species"
otmh <- otm[,c(1,4)]

mto <- read_tsv("~/CHELYDRA_SERPENTINA_GENOME/G3_FIGURES/ORTHOFINDER_FIGURE/Comparative_Genomics_Statistics/OrthologuesStats_many-to-one.tsv")
colnames(mto)[1] = "species"
mtoh <- mto[,c(1,4)]

mtm <- read_tsv("~/CHELYDRA_SERPENTINA_GENOME/G3_FIGURES/ORTHOFINDER_FIGURE/Comparative_Genomics_Statistics/OrthologuesStats_many-to-many.tsv")
colnames(mtm)[1] = "species"
mtmh <- mtm[,c(1,4)]

colnames(mtmh)[2] = "many2many"
colnames(mtoh)[2] = "many2one"
colnames(otmh)[2] = "one2many"
colnames(otoh)[2] = "one2one"

mh <- mtmh %>%
  left_join(mtoh) %>%
  left_join(otmh) %>%
  left_join(otoh)
mh  

mh$species <- c("Alligator mississippiensis", "Gallus gallus","Homo sapiens","Mus musculus","Pelodiscus sinensis","Rattus norvegicus",
                "Chrysemys picta","Chelydra serpentina","Terrapene carolina triunguis","Chelonia mydas","Gopherus evgoodi","Alligator sinensis","Taeniopygia guttata","Crocodylus porosus","Meleagris gallopavo",
                "Danio rerio","Platysternon megacephalum")



mh$total = rowSums(mh[,2:5])
mh$pmany2many = mh$many2many/mh$total*100
mh$pmany2one = mh$many2one/mh$total*100
mh$pone2many = mh$one2many/mh$total*100
mh$pone2one = mh$one2one/mh$total*100
mh[3,10] = 100

mhm <- mh[,c(1,7:ncol(mh))]
mhm <- melt(mhm, id.vars = "species")
mhm



ggplot(mhm, aes(species, value, fill = variable))+
  geom_col(position = "stack")+
  coord_flip()+
  xlab(NULL)+
  ylab("Percent")+
  theme_classic()+
  scale_y_continuous(expand = c(0.005,0.005))+
  scale_x_discrete(limits = c(order1))+
  theme(legend.title = element_blank(), 
        legend.position = "bottom", 
        legend.background = element_rect(color = "black",size = 0.5, linetype = "solid"),
        legend.text = element_text(face = "bold" ),
        axis.text = element_text(face= "bold", size = 13),
        axis.title = element_text(face = "bold", size = 13),
        plot.margin = unit(c(1,1,1,1),"cm"))+ 
  guides(fill = guide_legend(reverse=TRUE))+
  scale_fill_discrete(name = "Ortholog Multiplicity", labels = c("many-many","many-1","1-many","1-1"))



#### multiplicity to hsa


oto <- read_tsv("~/CHELYDRA_SERPENTINA_GENOME/G3_FIGURES/ORTHOFINDER_FIGURE/Comparative_Genomics_Statistics/OrthologuesStats_one-to-one.tsv")
colnames(oto)[1] = "species"
otoh <- oto[,c(1,9)]
 
otm <- read_tsv("~/CHELYDRA_SERPENTINA_GENOME/G3_FIGURES/ORTHOFINDER_FIGURE/Comparative_Genomics_Statistics/OrthologuesStats_one-to-many.tsv")
colnames(otm)[1] = "species"
otmh <- otm[,c(1,9)]

mto <- read_tsv("~/CHELYDRA_SERPENTINA_GENOME/G3_FIGURES/ORTHOFINDER_FIGURE/Comparative_Genomics_Statistics/OrthologuesStats_many-to-one.tsv")
colnames(mto)[1] = "species"
mtoh <- mto[,c(1,9)]

mtm <- read_tsv("~/CHELYDRA_SERPENTINA_GENOME/G3_FIGURES/ORTHOFINDER_FIGURE/Comparative_Genomics_Statistics/OrthologuesStats_many-to-many.tsv")
colnames(mtm)[1] = "species"
mtmh <- mtm[,c(1,9)]

colnames(mtmh)[2] = "many2many"
colnames(mtoh)[2] = "many2one"
colnames(otmh)[2] = "one2many"
colnames(otoh)[2] = "one2one"

mh <- mtmh %>%
  left_join(mtoh) %>%
  left_join(otmh) %>%
  left_join(otoh)
mh  


mh$species <- c("Alligator mississippiensis", "Gallus gallus","Homo sapiens","Mus musculus","Pelodiscus sinensis","Rattus norvegicus",
                  "Chrysemys picta","Chelydra serpentina","Terrapene carolina triunguis","Chelonia mydas","Gopherus evgoodi","Alligator sinensis","Taeniopygia guttata","Crocodylus porosus","Meleagris gallopavo",
                  "Danio rerio","Platysternon megacephalum")




mh$total = rowSums(mh[,2:5])
mh$pmany2many = mh$many2many/mh$total*100
mh$pmany2one = mh$many2one/mh$total*100
mh$pone2many = mh$one2many/mh$total*100
mh$pone2one = mh$one2one/mh$total*100
mh
mh[8,10] = 100

mhm <- mh[,c(1,7:ncol(mh))]
mhm <- melt(mhm, id.vars = "species")
mhm



ggplot(mhm, aes(species, value, fill = variable))+
  geom_col(position = "stack")+
  coord_flip()+
  xlab(NULL)+
  ylab("Percent")+
  theme_classic()+
  scale_y_continuous(expand = c(0.005,0.005))+
  scale_x_discrete(limits = c(order1))+
  theme(legend.title = element_blank(), 
        legend.position = "bottom", 
        legend.background = element_rect(color = "black",size = 0.5, linetype = "solid"),
        legend.text = element_text(face = "bold" ),
        axis.text = element_text(face= "bold", size = 13),
        axis.title = element_text(face = "bold", size = 13),
        plot.margin = unit(c(1,1,1,1),"cm"))+ 
  guides(fill = guide_legend(reverse=TRUE))+
  scale_fill_discrete(name = "Ortholog Multiplicity", labels = c("many-many","many-1","1-many","1-1"))
  








