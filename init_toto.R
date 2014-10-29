toto=read.dna("a.fas",format="fasta")
toto=as.character(toto)

toto[,2:20] #[1] "t" "g" "t" "t" "g" "g" "g" "g" "a" "a" "a" "t" "g" "c" "t" "t" "g" "a" "c"


str(as.alignment(toto))
#List of 4
#$ nb : num [1:603] NA NA NA NA NA NA NA NA NA NA ...
#$ nam: NULL
#$ seq: NULL
#$ com: NULL
#- attr(*, "class")= chr "alignment"
#Warning message:
#  In as.alignment(toto) : NAs introduced by coercion


#======tree (list)de class phylo
tr <- rtree(10)
write.tree(tr)#print tree in newick format
plot(tr)
tr$edge  #2 col matrix : branche
tr$edge.length
tr$tip.label
tr$Nnode
tr$node.label #optional
tr$root.edge #optional
str(tr)



