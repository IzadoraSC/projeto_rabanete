library(EBImage)
library(ExpImage)

#Apagar memoria do R

remove(list=ls())

#Indicar a pasta de trabalho

#setwd("D:/Backup Pendrive/")
#######################################################
#Abrir imagem das folhas
end1=example_image(3)
im=read_image(end1,plot=TRUE)
im=read_image("Imagem.jpeg",plot=TRUE)
