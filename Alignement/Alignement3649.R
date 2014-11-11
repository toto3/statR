
#Script pour l'importation de s?quences et l'alignement
# Le signe diese faire shift 3
# le signe \ doit toujours ?tre doubl? car sinon en programmation, il annonce les caract?res suivants donc mettre \\
# []-les bracquets se font avec altcar et 9, 0
# les doubles guillemets-shift+point
#?crire-le nom de la fonction sans parenth?se et on a le code source qui s'affiche
#
setwd("~/Rcran/Alignement")
getwd()

install.packages("ape")
install.packages("ade4")
install.packages("seqinr")
install.packages("bios2mds")
library(ape)
library(ade4)
library(seqinr)
library(bios2mds)


# Importation de fichiers en format fasta-Attention, sur chaque fichier .fas, on doit faire enter ? la derni?re ligne
dir()

seq3649=read.fasta ("3649seq2014-06-20.fas")
str(seq3649) #contient x s?quences#
as.character(seq3649[[1]])
summary(seq3649)


#####################################
###Traitement des s?quences-autre fa?on d'importer des s?quences-format DNAbin.

install.packages (seqinr)
library (seqinr)

help(read.dna)#on voit la description des diff?rents ?l?ments de la fonction-dans la librairie ape



Sequence3649=read.dna ("3649seq2014-06-20.fas", format="fasta", as.matrix=FALSE)
str(Sequence3649) #C'est quoi la s?rie de chiffres qui suit la longueur de la s?quence#
summary(Sequence3649)
class(Sequence3649)
print(Sequence3649)

#Codecomplet=read.dna(".fas", format = "fasta", skip = 1,comment.char = "#",as.character = TRUE, as.matrix = FALSE)#

#Pour que les diff?rents ex?cutables fonctionnent, il faut que les programmes soient directement install?s sur le C#
seqalign=clustal(Sequence3649, pw.gapopen = 10, pw.gapext = 0.1,gapopen = 10, gapext = 0.2, exec = "C:\\ClustalW2\\clustalw2.exe", quiet = FALSE, original.ordering = TRUE)


seqalign=clustal(Sequence3649, pw.gapopen = 10, pw.gapext = 0.1,gapopen = 10, gapext = 0.2, exec = "C:\\ClustalX2\\clustalX.exe", quiet = TRUE, original.ordering = TRUE)

#Examiner l'objet qui a ?t? cr?e
class(seqalign)
print(seqalign)#les s?quences sont dans un format binaire et plac?es dans une matrice, toutes les s?quences ont la m?me longueur et on voit la composition des diff?rentes bases
image(seqalign)#nous donne l'image de l'alignement
mode(seqalign)#raw
str(seqalign)


matricetest=dist.dna(seqalign, model="K80", variance=FALSE, gamma=FALSE, pairwise.deletion=FALSE, base.freq=NULL, as.matrix=TRUE)#fait une matrice rectangulaire#
class(matricetest)#on obtient une matrice
print(matricetest)#regarder la matrice produite
fix(matricetest)

write.table(matricetest,"matricetest.txt", sep=";", row.names=TRUE, col.names=TRUE)#le nom des colonnes et des lignes dispara?t

write.table(matricetest,"matrice1test.txt",  sep=";", row.names=FALSE, col.names=TRUE)#le nom des colonnes et des lignes dispara?t et on peut mettre les lignes  et pas les colonnes

write.csv2(matricetest,"matrice2test.csv", row.names=TRUE)#le nom des colonnes et des lignes dispara?t et on peut mettre les lignes  et pas les colonnes



#le programme fonctionne avec clustalW2_DOS mais ne fonctionne pas avec ClustalX-interface_utilisateur

seqalign=clustal(Sequence3649, pw.gapopen = 10, pw.gapext = 0.1,gapopen = 10, gapext = 0.2, exec = "C:\\ClustalX2\\clustalx.exe", quiet = TRUE, original.ordering = TRUE)

warnings()

#lire le fichier d'alignement qui a ?t? produit directement dans r
#pour que cela fonctionne il faut mettre le fichier aln dans notre working directory ou alors sp?cifier l'emplacement du fichier
Sequence3649a=read.dna("input_clustal.aln", format="clustal", as.matrix=FALSE)
fix(Sequence3649a)
fix(Sequence3649)
class(Sequence3649a)
#je ne comprends pas pourquoi le fichier n'a pas la m?me forme que celui des s?quences pas align?es; les noms de variables sont ? la suite.

#deuxi?me facon de lire un alignement dans r; les formats possibles sont fasta, mase, phylip, msf, clustal
Sequencealigne=read.alignment (file="input_clustal.aln", format="clustal", forceToLower=TRUE)
class(Sequencealigne)#class=alignement
fix(Sequencealigne)#v?rifier avec des s?quences qui ont des longueurs diff?rentes

#pour avoir l'image de l'alignement, et on appuie sur zoom pour la voir en d?tails
image(Sequence3649a)#pour fonctionner, l'objet doit ?tre une matrice
mode(Sequence3649a)#raw#

#Lire l'arbre interm?diaire utilis? pourl'alignement
#Dans le code, le nom de l'arbre n'apparait pas
arbre=read.tree(file="input_clustal.dnd", tree.names="arbre1") #imprimer a la console l'arbre sous forme de texte
write.tree(arbre)#print tree in newick format
plot(arbre)  #G?nere le graphique
class(arbre)# l'objet cr?? est de classe phylo
summary(arbre)


##############
http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/src/chapter5.html
###############

#Faire une matrice de distance ? partir d'un alignement multiple de clustal
matrice1k80=dist.dna(Sequence3649a, model="K80", variance=FALSE, gamma=FALSE, pairwise.deletion=FALSE, base.freq=NULL, as.matrix=FALSE)#fait une matrice triangulaire#
matrice3K80=dist.dna(Sequence3649a, model="K80", variance=FALSE, gamma=FALSE, pairwise.deletion=FALSE, base.freq=NULL, as.matrix=TRUE)#fait une matrice rectangulaire#
class(matrice1k80)#cr?er objet sous la forme dist
print(matrice1k80)#permet de voir l'objet ? l'?cran
class(matrice3K80)#cr?er objet sous la forme matrice
print(matrice3K80)#permet de voir l'objet ? l'?cran
fix(matrice3k80)
fix(matrice1k80)#pourquoi le fix ne fonctionne pas tout le temps?

#Mettre le contenu de l'objet cr?e sous la forme matrice dans un fichier-attention ne fonctionne pas si sous la forme dist
write.table(matrice3K80,"matrice3k80.txt", sep="\t")



#Faire une matrice distance la plus simple-sans aucun mod?le ?volutif
dist.gene(Sequence3649a, method = "pairwise", pairwise.deletion = FALSE,variance = FALSE)
#avec la m?thode pairwise; le chiffre repr?sente le nombre de nucleotides qui diff?rent entre les deux s?quences

#on dirait que ca fonctionne avec un objet DNAbin??, le r?sul
dist.gene(Sequence3649a, method = "percentage", pairwise.deletion = FALSE,variance = FALSE)
#lorsque la m?thode est percentage, le nombre de nucl?otides qui diff?rent est divis? par le nombre de nucl?otide dans les s?quences










clustal()



###Aligner avec T-coffee dans package ape
tcoffee(x, exec = "t_coffee", MoreArgs = "", quiet = TRUE, original.ordering = TRUE)


###Aligner avec muscle dans package ape
install.packages("muscle")#installer d'abord le package muscle sur l'ordinateur http://cran.r-project.org/web/packages/muscle/index.html- version windows release
library(muscle)#d?sinstaller d'abord le package seqinr

Seqtest=read.dna("15.fas", format = "fasta", as.matrix = FALSE)
Seqtest
class(Seqtest)


align=muscle("15.fas", exec = "muscle", MoreArgs = "", quiet = TRUE, original.ordering = TRUE)
align
mode(align)
print(align)

write.fasta(align,"align2.txt")

#Trouver le bon mod?le ?volutif




########Identifier des clusters parmi les s?quences
class(seqalign)
fix(seqalign)

install.packages("bios2mds")
library(bios2mds)

#Multidimensional scaling
try4=mmds(matrice3k80, pc=3, group.file=NULL)
class(try4)
fix(try4)



try2=kmeans.run(matrice1k80, nb.clus=2, nb.run=1000, iter.max=10000, method='euclidean')
fix(try2)
class(try2)#objet de la classe k-means

try3=kmeans.run(matrice1k80, nb.clus=2, nb.run=1000, iter.max=10000, method='maximum')
fix(try3)


try=import.fasta(seqalign,aa.to.upper=TRUE, gap.to.dash=TRUE)#Error in readLines(file) : 'con' is not a connection



#########################################################################################
#pas disponible avec la verion 3.0.2, la librairie n?cessite R 3.1.0
install.packages("Biostrings")
library(Biostrings)
######################################################################################

install.packages("phangorn")
library(phangorn)#compil? avec la version r3.0.3, le package ape est n?cessaire ? l'installation de phangorn




