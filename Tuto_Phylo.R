##Tuto Phylogenetics in R
#voir le tuto sur Internet:
#http://www.slideshare.net/schamber/phylogenetics-in-r

#installation et activation de packages pour ape====
install.packages("ape")
install.packages("ade4")
install.packages("seqinr")
library(ape)
require(ape)
library(ade4)
library(seqinr)

#Basic tree in R page4
tr1=read.tree(text="(((B:0.05,C:0.05):0.01,D:0.06):0.04,A:0.1);")
write.tree(tr1)#print tree in newick format
[1] "(((B:0.05,C:0.05):0.01,D:0.06):0.04,A:0.1);"
> tr1$tip.label
[1] "B" "C" "D" "A"
> tr1$edge.length
[1] 0.04 0.01 0.05 0.05 0.06 0.10
> tr1$node.label#Null no node lable
NULL

#assign properties to tree
tr1$tip.label=c("sleepy","happy","grumpy","frumpy")#lable tips
tr1$tip.label 



# ==== GEt sequence date page5====
cotton_acc=c("U56806","U12712","U56810")
cotton=read.GenBank(cotton_acc,species.names=T)#get data from genbank
#name the seq with species names instread of access numbres
names_accs=data.frame(species=attr(cotton,"species"),accs=names(cotton))
names(cotton)=attr(cotton,"species")

write.dna(cotton,"cotton.fas",format="fasta")#write to file
#installer clustal et rouler la ligne suivante:
system(paste("//home//pascal//R//i686-pc-linux-gnu-library//3.1//clustalW2//clustalx2 cotton.fas"))
# our plus simplement 
#system(".//clustalx2 cotton.fas")
Sequence format is Pearson
Sequence 1: Gossypium_anomalum     683 bp
Sequence 2: Gossypium_arboreum     668 bp
Sequence 3: Gossypium_areysianum   684 bp
Sequence format is Pearson
Sequences assumed to be DNA

#read the aligment back in to R
cotton_clustalaligned=read.dna("cotton.aln",format="clustal")
str(cotton_clustalaligned)
'DNAbin' raw [1:3, 1:686] t t t c ...
- attr(*, "dimnames")=List of 2
..$ : chr [1:3] "Gossypium_arboreum" "Gossypium_areysianum" "Gossypium_anomalum"
..$ : NULL
fix(cotton_clustalaligned)
fix(cotton)



#====Phylogen inferance page9====

install.packages("phangorn")
library(phangorn)
require(phangorn)
#   NJ 
data(woodmouse)
trw=nj(dist.dna(woodmouse))
plot(trw)

#Maximun  likelihood
data(Laurasiatherian)
dm=dist.logDet(Laurasiatherian)
njtree=NJ(dm)
MLfit=pml(njtree,Laurasiatherian)#optimese edge len parameter
MLfit_=optim.pml(MLfit,model="GTR")
MLfit_$tree
plot(MLfit_$tree)

#Parsimony
data(Laurasiatherian)
dm=dist.logDet(Laurasiatherian)
tree=NJ(dm)
treepars=optim.parsimony(tree,Laurasiatherian)
plot(treepars)


#Visualise phylogenies
tree=rcoal(10)
tree
plot(tree)
plot(tree,type="cladogram")
plot(tree,type="unrooted")
plot(tree,type="radial")
plot(tree,type="fan")

#Traits on trees Phylogenetic signal==== page14
#R pack:ape, picante, caper, phytools
#exp form picante and phytools:
install.packages("picante")
require(picante)
randtree=rcoal(20)
randtraits=rTraitCont(randtree)
Kcalc(randtraits[randtree$tip.label],randtree)
[,1]
[1,] 0.2071142


