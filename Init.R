
#Ligne a executer quand on ouvre R====

rm(list=ls()) # pour effacer tous les objet en m?moire



setwd("~/Rcran")
getwd()
library(ape)
require(ape)
library(ade4)
library(seqinr)
library(foreign)
library(questionr)
warning()
getwd()


## Jeu de donn?es hdv2003
data(hdv2003)
d <- hdv2003
data(rp99)
