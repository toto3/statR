
#exercice pour différencier ====
#un vector d,avec une liste
#et c() d'avec  list()
> toto=list(3,4,5)
> toto
[[1]]
[1] 3

[[2]]
[1] 4

[[3]]
[1] 5

> as.vector(toto)
[[1]]
[1] 3

[[2]]
[1] 4

[[3]]
[1] 5

> toto=c(3,4,5)
> toto
[1] 3 4 5



> str(toto)
num [1:3] 3 4 5
> toto=list(3,4,5)
> str(toto)
List of 3
$ : num 3
$ : num 4
$ : num 5
> toto=list(3,"allo",5)
> str(toto)
List of 3
$ : num 3
$ : chr "allo"
$ : num 5


> toto=c(3,"gogo",5)
> str(toto)
chr [1:3] "3" "gogo" "5"
> 
  #conclusion: avec c() si une des élément est un char tous les autres 
  #éléments sont transformé en char
  #avec list() les éléments peuvent être de type différents
  
  