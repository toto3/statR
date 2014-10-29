
#Script pour l'importation de séquences et l'alignement
# Le signe diese faire shift 3
# le signe \ doit toujours être doublé car sinon en programmation, il annonce les caractères suivants donc mettre \\
# []-les bracquets se font avec altcar et 9, 0
# les doubles guillemets-shift+point
#Écrire-le nom de la fonction sans parenthèse et on a le code source qui s'affiche

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


# Importation de fichiers en format fasta-Attention, sur chaque fichier .fas, on doit faire enter à la dernière ligne
dir()

seq3649=read.fasta ("3649seq2014-06-20.fas")
str(seq3649) #contient x séquences#
as.character(seq3649[[1]])
summary(seq3649)


#####################################
###Traitement des séquences-autre façon d'importer des séquences-format DNAbin.

install.packages (seqinr)
library (seqinr)

help(read.dna)#on voit la description des différents éléments de la fonction-dans la librairie ape



Sequence3649=read.dna ("3649seq2014-06-20.fas", format="fasta", as.matrix=FALSE)
str(Sequence3649) #C'est quoi la série de chiffres qui suit la longueur de la séquence#
summary(Sequence3649)
class(Sequence3649)
print(Sequence3649)

#Codecomplet=read.dna(".fas", format = "fasta", skip = 1,comment.char = "#",as.character = TRUE, as.matrix = FALSE)#

#Pour que les différents exécutables fonctionnent, il faut que les programmes soient directement installés sur le C#
seqalign=clustal(Sequence3649, pw.gapopen = 10, pw.gapext = 0.1,gapopen = 10, gapext = 0.2, exec = "C:\\ClustalW2\\clustalw2.exe", quiet = FALSE, original.ordering = TRUE)


seqalign=clustal(Sequence3649, pw.gapopen = 10, pw.gapext = 0.1,gapopen = 10, gapext = 0.2, exec = "C:\\ClustalX2\\clustalX.exe", quiet = TRUE, original.ordering = TRUE)

#Examiner l'objet qui a été crée
class(seqalign)
print(seqalign)#les séquences sont dans un format binaire et placées dans une matrice, toutes les séquences ont la même longueur et on voit la composition des différentes bases
image(seqalign)#nous donne l'image de l'alignement
mode(seqalign)#raw
str(seqalign)


matricetest=dist.dna(seqalign, model="K80", variance=FALSE, gamma=FALSE, pairwise.deletion=FALSE, base.freq=NULL, as.matrix=TRUE)#fait une matrice rectangulaire#
class(matricetest)#on obtient une matrice
print(matricetest)#regarder la matrice produite
fix(matricetest)

write.table(matricetest,"matricetest.txt", sep=";", row.names=TRUE, col.names=TRUE)#le nom des colonnes et des lignes disparaît

write.table(matricetest,"matrice1test.txt",  sep=";", row.names=FALSE, col.names=TRUE)#le nom des colonnes et des lignes disparaît et on peut mettre les lignes  et pas les colonnes

write.csv2(matricetest,"matrice2test.csv", row.names=TRUE)#le nom des colonnes et des lignes disparaît et on peut mettre les lignes  et pas les colonnes



#le programme fonctionne avec clustalW2_DOS mais ne fonctionne pas avec ClustalX-interface_utilisateur

seqalign=clustal(Sequence3649, pw.gapopen = 10, pw.gapext = 0.1,gapopen = 10, gapext = 0.2, exec = "C:\\ClustalX2\\clustalx.exe", quiet = TRUE, original.ordering = TRUE)

warnings()

#lire le fichier d'alignement qui a été produit directement dans r
#pour que cela fonctionne il faut mettre le fichier aln dans notre working directory ou alors spécifier l'emplacement du fichier
Sequence3649a=read.dna("input_clustal.aln", format="clustal", as.matrix=FALSE)
fix(Sequence3649a)
fix(Sequence3649)
class(Sequence3649a)
#je ne comprends pas pourquoi le fichier n'a pas la même forme que celui des séquences pas alignées; les noms de variables sont à la suite.

#deuxième facon de lire un alignement dans r; les formats possibles sont fasta, mase, phylip, msf, clustal
Sequencealigne=read.alignment (file="input_clustal.aln", format="clustal", forceToLower=TRUE)
class(Sequencealigne)#class=alignement
fix(Sequencealigne)#vérifier avec des séquences qui ont des longueurs différentes

#pour avoir l'image de l'alignement, et on appuie sur zoom pour la voir en détails
image(Sequence3649a)#pour fonctionner, l'objet doit être une matrice
mode(Sequence3649a)#raw#

#Lire l'arbre intermédiaire utilisé pourl'alignement
#Dans le code, le nom de l'arbre n'apparait pas
arbre=read.tree(file="input_clustal.dnd", tree.names="arbre1") #imprimer a la console l'arbre sous forme de texte
write.tree(arbre)#print tree in newick format
plot(arbre)  #Génere le graphique
class(arbre)# l'objet créé est de classe phylo
summary(arbre)


##############
http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/src/chapter5.html
###############

#Faire une matrice de distance à partir d'un alignement multiple de clustal
matrice1k80=dist.dna(Sequence3649a, model="K80", variance=FALSE, gamma=FALSE, pairwise.deletion=FALSE, base.freq=NULL, as.matrix=FALSE)#fait une matrice triangulaire#
matrice3K80=dist.dna(Sequence3649a, model="K80", variance=FALSE, gamma=FALSE, pairwise.deletion=FALSE, base.freq=NULL, as.matrix=TRUE)#fait une matrice rectangulaire#
class(matrice1k80)#créer objet sous la forme dist
print(matrice1k80)#permet de voir l'objet à l'écran
class(matrice3K80)#créer objet sous la forme matrice
print(matrice3K80)#permet de voir l'objet à l'écran
fix(matrice3k80)
fix(matrice1k80)#pourquoi le fix ne fonctionne pas tout le temps?

#Mettre le contenu de l'objet crée sous la forme matrice dans un fichier-attention ne fonctionne pas si sous la forme dist
write.table(matrice3K80,"matrice3k80.txt", sep="\t")



#Faire une matrice distance la plus simple-sans aucun modèle évolutif
dist.gene(Sequence3649a, method = "pairwise", pairwise.deletion = FALSE,variance = FALSE)
#avec la méthode pairwise; le chiffre représente le nombre de nucleotides qui diffèrent entre les deux séquences

#on dirait que ca fonctionne avec un objet DNAbin??, le résul
dist.gene(Sequence3649a, method = "percentage", pairwise.deletion = FALSE,variance = FALSE)
#lorsque la méthode est percentage, le nombre de nucléotides qui diffèrent est divisé par le nombre de nucléotide dans les séquences










clustal()



###Aligner avec T-coffee dans package ape
tcoffee(x, exec = "t_coffee", MoreArgs = "", quiet = TRUE, original.ordering = TRUE)


###Aligner avec muscle dans package ape
install.packages("muscle")#installer d'abord le package muscle sur l'ordinateur http://cran.r-project.org/web/packages/muscle/index.html- version windows release
library(muscle)#désinstaller d'abord le package seqinr

Seqtest=read.dna("15.fas", format = "fasta", as.matrix = FALSE)
Seqtest
class(Seqtest)


align=muscle("15.fas", exec = "muscle", MoreArgs = "", quiet = TRUE, original.ordering = TRUE)
align
mode(align)
print(align)

write.fasta(align,"align2.txt")

#Trouver le bon modèle évolutif




########Identifier des clusters parmi les séquences
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
#pas disponible avec la verion 3.0.2, la librairie nécessite R 3.1.0
install.packages("Biostrings")
library(Biostrings)
######################################################################################

install.packages("phangorn")
library(phangorn)#compilé avec la version r3.0.3, le package ape est nécessaire à l'installation de phangorn




