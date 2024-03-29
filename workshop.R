

ls()
rm(list=ls()) # pour effacer tous les objet en m?moire
getwd()
setwd() 
ls()
objects() #idem que ls()
search()# pour lister les packages actifs


x=55# class numérique
A='valA'#class characteur 
logic=(7<5) # class logical TRUE FALSE



#info sur les objets
class(x)# class (type de donneés) :numeric,logical,integer,real,complex,string,raw
mode(logic) #Get or set the type or storage mode of an object.
#"logical", "integer", "double", "complex", "raw", "character", "list", "expression", "name", "symbol" and "function".
attributes(x)
str(logic)
levels(x)#pour les dataframe

#2.6 Vectors and subscript(indices)  ::::::::: ================
#class:numeric,logical,integer,real,complex,string,raw

#vecteur de numeric
(peas=c(4,7,6,5,6,7))
(pods=c(2,3,6))
peas[pods]#accees par index
peas[c(2,4)]

#logical subscripts
x=0:10;x
x[x<5]
sum(x[x<5])
sum(x)
summary(x)

#2.7 Vector function :::::::::=====================================
max(x)......maximum value in x
min(x)..... minimum value in x
sum(x) .....total of all the values in x
mean(x) ....arithmetic average of the values in x
median(x).. median value in x
range(x) ...vector of min(x) and max(x)
var(x) .....sample variance of x
cor(x,y)....correlation between vectors x and y
sort(x).... a sorted version of x
rank(x) ....vector of the ranks of the values in x
order(x) ...an integer vector containing the permutation to sort x into ascending order
quantile(x).vector containing the minimum, lower quartile, median, upper quartile, and maximum of x
cumsum(x) ..vector containing the sum of all of the elements up to that point
cumprod(x) .vector containing the product of all of the elements up to that point
cummax(x) ..vector of non-decreasing numbers which are the cumulative maxima of the values in x up to that point
cummin(x) ..vector of non-increasing numbers which are the cumulative minima of the values in x up to that point
pmax(x,y,z).vector, of length equal to the longest of x, y or z, containing the maximum of x, y or z for the ith position in each
pmin(x,y,z).vector, of length equal to the longest of x, y or z, containing the minimum of x, y or z for the ith position in each
colMeans(x).column means of dataframe or matrix x
colSums(x) .column totals of dataframe or matrix x
rowMeans(x).row means of dataframe or matrix x
rowSums(x) .row totals of dataframe or matrix x



#2.7.7 Sorting, ranking and ordering ================================
#sort=tri
#rank=le rang
#order= indice de permutaiton pour être trié
houses=read.table(".//temp//houses.txt",header=T)
names(houses) 
houses
head(houses)
(ranks=rank(houses$Price))
(sorted=sort(houses$Price))
(ordered=order(houses$Price))
(view=data.frame(houses$Price,ranks,sorted,ordered))


#2.8  MATRICES  and ARRAYS ::::::::::: ====================================
#array:multy dimension object. La dimension est ajusté par la function 
#dim() et doit refléter le nombre d'élément de l'objet 
y=1:24;y
mode(y);class(y);str(y)
dim(y)=c(2,4,3) # 2=rows 4=cols  3=dimension
mode(y);class(y);str(y);summary(y)
y

#2.8.1  MATRICE IS A 2 DIM ARRAY CONTAINING NUMBERS ===============
(X=matrix(c(1,0,0,0,1,0,0,0,1),nrow=3)) #col-wise
attributes(X)

#différence entre vector et matrice
(vector=c(1,2,3,4,4,3,2,1))
(V=matrix(vector,byrow=T,nrow=2))
class(vector);class(V)
V
vector


#2.8.2  naming the rows and columns of matrices===========================
#rownames() colnames()  dimnames()
(X=matrix(rpois(20,1.5),nrow=4)) 
rownames(X)=rownames(X,do.NULL=FALSE,prefix="Trail.") ; X

drug.names=c("aspirin","paracetamol","nurofen","hedex","placebo")
colnames(X)=drug.names; X


#2.8.3 Calculation on rows or cols of the matrix=============================
rowMeans(X) # ou 
apply(X,1,max)  #1=row

colMeans(X) 
# ou 
apply(X,2,mean)  #2=col


#2.8.6 Applying function with apply, sapply, lapply ================================
#the apply() for applying func to row or col of a matrice or dataframe
#the sapply() for applying func to vector
#margin ->> 1=rows
#margin ->> 2=clos
X=matrix(1:24,nrow=4);X
(apply(X,1,sum)) #somme des rows car margin 1 donc rows
(apply(X,2,sum)) #somme des cols car margin 1 donc cols

#2.11 Lists :::::::::::::================================
#une list est un bundle de vecteur de différent type et de diff longeur
apples <- c(4,4.5,4.2,5.1,3.9)
oranges <- c(TRUE, TRUE, FALSE)
chalk <- c("limestone", "marl","oolite", "CaC03")
cheese <- c(3.2-4.5i,12.8+2.2i)
(items <- list(apples,oranges,chalk,cheese))

items[[3]][2] #bonne facon  [[3]][2]


#list avec des alias pour chaque élément
items <- list(first=apples,second=oranges,third=chalk,fourth=cheese)
items
items$third[2]
# lapply() appliquer une fonction aux éléments d'une liste
lapply(items,length)#longeur de chaque élément  lapply(objet,function)

str(items)
summary(items)


#String et char
letters
LETTERS
noquote(letters)#sans les (")
nchar(letters)#Count the Number of Characters
paste("prefix","mid","suffix",sep="_/_")
paste("A", 1:6, sep = "")



#2.12.5 The match() function and relational databases =======
(subjects <- c("A", "B", "G", "M", "N", "S", "T", "V", "Z"))
(suitable.patients <- c("E", "G", "S", "U", "Z"))
match(subjects, suitable.patients)
is.na(match(subjects, suitable.patients))
(drug <- c("new", "conventional"))
drug[ifelse(is.na(match(subjects, suitable.patients)),2,1)]


(stock <- c("car","van"))
(requests <- c("truck","suv","van","sports","car","waggon","car"))
which(requests %in% stock)#index des match
requests [which(requests %in% stock)] #valeur des match


#2.15  Writing R functions====
arithmetic.mean <- function(x) sum(x)/length(x)
class(arithmetic.mean)
arithmetic.mean(c(5,10,15))

med <- function(x) {
  odd.even <- length(x)%%2
  if (odd.even == 0) (sort(x)[length(x)/2]+sort(x)[1+ length(x)/2])/2
  else sort(x)[ceiling(length(x)/2)]
}


#2.16.4 Saving data produced whitin R to disc====
nbnumbers <- rnbinom(1000, size=1, mu=1.2)
nbnumbers
write(nbnumbers,".//temp//nbnumbers.txt",1)
write(nbnumbers,".//temp//nbnumbers.txt",5)

#write.table pour les matrice et dataframe 
(nbtable <- table(nbnumbers))
#If you want to save both the counts and their frequencies in adjacent columns, use
write.table(nbtable,".//temp//table.txt",col.names=F,row.names=F)
#if you only want to export a single column of frequencies (445, 248, . . . ) use
write.table(unclass(nbtable),".//temp//table.txt",col.names=F,row.names=F)


#2.16.5 Pasting into presse papier (marche pas sur Linux)====
writeClipboard(as.character(c(5:20)))
write.table(data,"clipboard",sep="\t",col.names=NA)


#save(x, y, z, file = "export.RData")
#load("export.RData")
ls()

save.image()




#3 DATA INPUT =========

#Formatting is controlled using escape sequences, typically within double quotes:
\n  newline
\r  carriage return
\t  tab character
\b  backspace
\a  bell
\f  form feed
\v  vertical tab


dir()
dir(".//temp")
dir(".//pdf")
file.exists("tr.tre")
file.exists("toto.toto")

#for comma-separated fields use read.csv("c:\\temp\\file.csv");
#for semicolon-separated fields read.csv2("c:\\temp\\file.csv");
#for tab-delimited fields with decimal points as a commas, use read.delim2("c:\\temp\\file.txt").

#as.is pour empecher la convertion en factor du vector de string
murder <- read.table(".//temp//murders.txt",header=T,as.is="region")
head(murder)

str(murder)
str(murder$region)
mode(murder$region)
mode(murder$state)
attributes(murder)
levels(murder$state)
levels(murder$region)
which(levels(murder$state)=="Utah")
murder$state[which(levels(murder$state)==?"Alabama")]


#Chapitre 4 Dataframe ====
worms=read.table(".//temp//worms.txt",header=T)#importe les donn?es
attach(worms) #Ne pas utiliser (crr? des objets pour chaque colommes , comme des alias)
names(worms)  #affiche les nom de variables
head(worms)   # afficher les premiers rows
tail(worms)   #affiche les dernier rows
summary(worms)#affiche un rapport du dataframe
worms[1:5,2:3]#sous ensemble des row 1a 5 et des col 2et3
worms[,3]#la col 3 au complet
worms[3,]#la row 3 au complet
worms[,c(1,5)]#les donn?es des var 1 et 5
str(worms)




# n is one of the row 
# m is one of the columns. 
data[n,]    #select all of the columns from row n of the dataframe
data[-n,]   #drop the whole of row n from the dataframe
data[1:n,]  #select all of the columns from rows 1 to n of the dataframe
data[-(1:n),] #drop all of the columns from rows 1 to n of the dataframe
data[c(i,j,k),] #select all of the columns from rows i, j, and k of the dataframe
data[x > y,]  #use a logical test (x > y) to select all columns from certain rows
data[,m]   #select all of the rows from column m of the dataframe
data[,-m]  #drop the whole of column m from the dataframe
data[,1:m] #select all of the rows from columns 1 to m of the dataframe
data[,-(1:m)] #drop all of the rows from columns 1 to m of the dataframe
data[,c(i,j,k)] #select all of the rows from columns i, j, and k of the dataframe
data[,x > y] #use a logical test (x > y) to select all rows from certain columns
data[,c(1:m,i,j,k)] #add duplicate copies of columns i, j, and k to the dataframe
data[x > y,a != b] #extract certain rows (x > y) and certain columns (a != b)
data[c(1:n,i,j,k),] #add duplicate copies of rows i, j, and k to the dataframe

#4.3 Sorting dataframes ====
worms[order(worms$Slope,decreasing=T),]#tri sur col slope d?croissant
worms[order(worms$Vegetation,worms$Worm.density),c(4,7,5,3)]#double tir et affiches  les col 4,7,5,3,

#4.4 Conditions to select rows from dataframe====
worms[worms$Damp==T,]
worms[worms$Worm.density > median(worms$Worm.density) & worms$Soil.pH < 5.2,]
worms[worms$Soil.pH > 5.2,]
worms[,sapply(worms,is.numeric)]#only numeric values
worms[,sapply(worms,is.factor)]#les col qui sont de clas factor
worms[-(6:15),]#To drop a row or rows from the dataframe, use negative subscripts.(i.e. row numbers 6 to 15 inclusive) 
worms[!(worms$Vegetation=="Grassland"),]# ! n'est pas


#4.5 Omitting rows containing missing values, NA====
na.fail(object, ...)# returns the object if it does not contain any missing values, and signals an error otherwise.
na.omit(object, ...)#sans les row avec des NA
na.exclude(object, ...)# differs from na.omit only in the class of the "na.action" attribute of the result, which is "exclude". This gives different behaviour in functions making use of naresid and napredict
na.pass(object, ...)#returns the object unchanged.
complete.cases(data)#return TRUE ou FLASE selon su'il y a des NA dans les row
data[complete.cases(data),]# equivalent de na.omit(data)
apply(apply(data,2,is.na),2,sum)#donne  pour chaque col le total des NA

#4.5.1 Replacing NAs with zeros====
data[is.na(data)]<-0  #this is how to replace all the NAs by zeros:



#4.8 A dataframe with row names instead of row numbers====
worms2 <- read.table(".//temp//worms.txt",header=T,row.names=1)
head(worms2)
head(worms)#en comparaison ici il y a des row names
names(worms2)
worms[,1]
worms2[,1]

#4.10 Eliminating duplicate rows from a dataframe====
dups <- read.table(".//temp//dups.txt",header=T)
dups
unique(dups)#sans les row en double? (distinct row)




#4.11 Dates in dataframes et tri sur les date====
nums <- read.table(".//temp//sortdata.txt",header=T)
head(nums)
#In order to sort by date we need first to convert our variable into date-time format using the strptime function
(dates <- strptime(nums$date,format="%d/%m/%Y"))#transforme : 25/08/2003  en "2003-08-25"
nums <- cbind(nums,dates)# ajout des date bien format? 
nums[order(nums$date),]#tri mal fait
nums[order(nums$dates),]#maintenant le tri sera bien fait




library(questionr)
## Jeu de donn?es hdv2003
data(hdv2003)
d <- hdv2003
names(d)
head(d)
d$qualif
iorder(d, "qualif")
iorder(d,"relig")
icut(d, age)#ouvre une page web

#irec(d, qualif)


#5.7 Organiser ses scripts====
#La func source() execute les code dun fichier de script
#source("import.R")
#source("recodages.R")




##=================================================================================
#                    APE
##=================================================================================

#ape    = analyses of phylogenetics and evolution
#ade4   = analises of environnemental data
#seqinr = exploratory analyses of molecular sequences

#installation et activation de packages pour ape====
install.packages("ape")
install.packages("ade4")
install.packages("seqinr")

library(ape)
require(ape)
library(ade4)
library(seqinr)


tr1=read.tree(text="(a:1,b:4);")
write.tree(tr1)#print tree in newick format
plot(tr1)

tr1=read.tree(text="(((B:0.05,C:0.05):0.01,D:0.06):0.04,A:0.1);")
write.tree(tr1)#print tree in newick format
plot(tr1)

tr1$tip.label
tr1$edge.length
tr1$node.label#Null no node lable
#assign properties to tree
tr1$tip.label=c("sleepy","happy","grumpy","frumpy")#lable tips
tr1$tip.label #



# 3.1.1 Trees====
#package.ape::class.phylo         :utile pour garder les métadonnées
#package.ape::class.matching
#package.stats::class.hclust     :to code hirarchical cluster
#package.stats::class.dendrogram :
#package.clue             :for clustering methodes

#The class ape.phylo====
#edge        :2 col matrix représentant les branche de l'arbre
#edge.lenght :vector de num of lenght des branches du edge
#tip.label   :vector de char nom des tip 1 to n
#Nnode       :int value the number of nodes in the tree (m)
#node.label  :vector de char , lable des nodes
#root.edge   :num value , len of the branch at the root if it exist

#The class phylobase.phylo4====
#(edge; edge.length; label; edge.label; order; annote)

#The class ape.matching====
#matching :3 col num matrix (pairs, pairs, corresponding)
#tip.label :vector de char, 
#node.lable :vector de char,

#The class apTreeshape.treeshape====
#merge :2 col num matrix, rep pariing neg=tip pos=group of tip
#names :vector of char , names of tips


#3.1.2 Networks====
#package.ape::class.evonet
#package.phangron::class.networx

#3.1.3 Splits====
#a split (or bipartition) is a pari of two exclusive stes of tips (or taxa)
#AB|CD for a set of taxa {A,B,C,D}

#3.1.4 Molecular Sequences====
#Sequence of nucleotides (DNA) or amino acids (proteins)
#package.ape::class.DNAbin
# A=1000 G=0100 C=0010 T=0001  facon de codé les lettres
#package.pegas::class.haplotype

#package.seqinr::class.alignment==== 
#store a set of aliggned seq
#nb : the number of sequences
#seq : la seq en vector de char (same len for all seq)
#nam :vector of char , individual lable
#com : comment

#package.phangorn::class.phyDat====
#(weight, index, levels, type, contrast)

#3.1.5 Allelic Data ====
#pegas.loci
#adegenet.genind
#adegenet.SNPbin
#adegenet.genlight

#3.2 Reading Phylogenetic Data====
#Newick or New Hampshire formal :NEXUS
#read.tree() :retourne un obj multyPhylo (soit une List d'obj phylo)
#read.nexus()
#http://en.wikipedia.org/wiki/Newick_format
#----The grammar nodes----
# Tree      : The full input Newick Format for a single tree
# Subtree   : an internal node (and its descendants) or a leaf node
# Leaf      : a node with no descendants
# Internal  : a node and its one or more descendants
# BranchSet : a set of one or more Branches
# Branch    : a tree edge and its descendant subtree.
# Name      : the name of a node
# Length    : the length of a tree edge.
# Each node is called a taxonomic unit. 
# Internal nodes are generally called hypothetical taxonomic units, as they cannot be directly observed.

a="(a:1,b:1);"
tr=read.tree(text=a)
str(tr)




#3.2.2 Molecular Sequences====


#read.dna() fasta , clustal , interleaved format ;retunr ojb de classe DNAbin
#read.nexus.data() return list of char vector
#read.aa() 
#read.GenBank() read seq in the web db GenBank
#seqinr: read.fasta()   file, seqtype
#read.alignment()    file, format(mase,clustal,phylip,fasta,msf) 
# choosebank() show the databanks available 
s=choosebank("genbank")
query("rampho","sp=Ramphocelus@")
rampho
rampho$req[[1]]

#x=getSequence(rampho)#pour récupérer les seq (ATTENTION !!  na pas marché)

y=read.GenBank("AF310048")
as.character(y[[1]])
y=read.GenBank("AB531656")
as.character(y[[1]])



ref <- c("U15717", "U15718", "U15719", "U15720","U15721", "U15722", "U15723", "U15724")
Rampho <- read.GenBank(ref)
attr(Rampho, "species")
cbind(attr(Rampho, "species"), names(Rampho))
cat(Rampho[[1]], "\n", sep = "") #2818181848488818....
as.character(Rampho[[1]])   #[1] "c" "t" "t" "t" "g" "g" "a"

#3.2.3 Allelic Data====
#read.loci

#3.2.4 Reading Data Over the Internet====
#library(BoSSA)
#read.PDB()


#3.3 Writing Data====
#save()
#save.image() SAVE ALL OBJ IN MEM IN THE FILE .RData
#write.tree() in newick format
write.tree(tr)
write.tree(tr,file="tr.tre")#enregistere dans un ficher
write.nexus(tr)

#3.4 Manipulating Data====
tr=read.tree(text="((a:1,b:1):1,(c:1,d:1):1);")
plot(tr)
write.tree(drop.tip(tr,c("a","b")))
write.tree(drop.tip(tr,3:4,trim.internal=FALSE))

#extract.clade
#drop.fossil
#bind.tree

#3.4.2 Rooted, Unrooted trees====
#is.rooted() True si vrai False si faux


#3.4.3  Graphical tree manipulation====
plot(ta=root(tr,interactive=TRUE))


#3.4.4 Dichotomous Versus Multichotomous Trees====
#multi2di
#do2multi

#3.4.5 Summarizing and Comparing Trees====
#is.ultrametric() test if in a trees all tips equally distant from the root
#balance()
#branching.times()
#coalescent.intervals() 
#all.equal() test si 2 obj sont approximativement égal
#phylo.diff()
#distinct.edges(ta,td)

#3.4.6 Manipulating Lists of Trees====
#class:multiPhylo
TR=rmtree(10,5)
attr(TR,"TipLabel")
TRcompr=.compressTipLabel(TR)#compresse
attr(TRcompr,"TipLabel")

tr=TR[[1]]  #extract one tree
tr=TR$A     #idem
tr=TR["A"]  #idem
TB=TR[1]    #idem but as a list
TB=TR[1:2]  #extract 2 tree
TR[[1]]=tr  #replace one tree
TR[1]= list(tr) #idem
TR[1:2]=c(tr,ts) #replace 2 trees
TR[[4]]=tr   #appends a tree to the list
TR[5:6]=c(tr,ts) #appendes 2 trees



#================================================================================
#                  Tuto Phylogenetics in R
#================================================================================

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
plot(tr1)
write.tree(tr1)#print tree in newick format

tr1$tip.label
tr1$edge.length
tr1$node.label#Null no node lable


#assign properties to tree
tr1$tip.label=c("sleepy","happy","grumpy","frumpy")#lable tips
tr1$tip.label 



# ==== GEt sequence date page5====
cotton_acc=c("U56806","U12712","U56810")
cotton=read.GenBank(cotton_acc,species.names=T)#get data from genbank
#name the seq with species names instread of access numbres
names_accs=data.frame(species=attr(cotton,"species"),accs=names(cotton))
names(cotton)=attr(cotton,"species")
cotton
write.dna(cotton,"cotton.fas",format="fasta")#write to file
#installer clustal et rouler la ligne suivante:
system(paste("//home//pascal//R//i686-pc-linux-gnu-library//3.1//clustalW2//clustalx2 cotton.fas"))
#Sequence format is Pearson
#Sequence 1: Gossypium_anomalum     683 bp
#Sequence 2: Gossypium_arboreum     668 bp
#Sequence 3: Gossypium_areysianum   684 bp
#Sequence format is Pearson
#Sequences assumed to be DNA

#read the aligment back in to R
cotton_clustalaligned=read.dna("cotton.aln",format="clustal")
str(cotton_clustalaligned)
fix(cotton_clustalaligned)
fix(cotton)
cotton_clustalaligned



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



#=====
dir()
a=read.fasta(".//a.fas")
a[1]
as.character(a[[1]])
str(a)
summary(a)
system(paste("//home//pascal//R//i686-pc-linux-gnu-library//3.1//clustalW2//clustalx2 a.fas"))



abcd=read.fasta(".//abcd.fas")
abcd[1]
as.character(abcd[[1]])
str(abcd)
summary(abcd)
system(paste("//home//pascal//R//i686-pc-linux-gnu-library//3.1//clustalW2//clustalx2 abcd.fas"))

#read the aligment back in to R
abcd_clustalaligned=read.dna("abcd.aln",format="clustal")
str(abcd_clustalaligned)
fix(abcd_clustalaligned)
fix(abcd)
abcd


