
#exercice pour diff�rencier ====
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
  #conclusion: avec c() si une des �l�ment est un char tous les autres 
  #�l�ments sont transform� en char
  #avec list() les �l�ments peuvent �tre de type diff�rents
  
  