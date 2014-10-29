# Livre du R:::: =========
Mars 2014

> chemin des fichier de data pour le livre 
[1] "/home/pascal/Rcran/temp/"

dups=read.table("//home//pascal//Rcran//temp//dups.txt",header=T)

> wdPakages ou sont instal√© les pacages
[1] "/tmp/RtmpM5Mi2H/downloaded_packages"


# liens utiles ==========
  http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/
  
  http://w3.jouy.inra.fr/unites/miaj/public/matrisq/jbdenis/notes/notions/notions.html#proba
  
  http://doc.ubuntu-fr.org/r

into to R
 http://www.youtube.com/watch?v=6jT6Rit_5EQ

http://www.statsoft.com/Textbook/Statistics-Glossary/D/button/0#Data%20Mining


http://www.youtube.com/watch?v=s2oTUsAJfjI
pour sqldf la library sql pour r


MIT data miming Classification : http://www.youtube.com/watch?v=Bti0InzFXtY&list=PL9F65E2710F94EC73

rattel data miner vid?o:
  http://www.youtube.com/watch?v=x67SL5_L0QY


http://www.rstudio.com/ide/docs/
http://www.rstudio.com/ide/docs/using/source
http://www.rstudio.com/ide/docs/using/code_folding
  


example(lm)#

demo(graphics)

fix(x)#pour ouvrir l'?diteur graphique 

objects()#pour lister les obj cr?? pendant la session

search()# pour lister les packages actifs

rm(list=ls()) # pour effacer tous les objet en m?moire

Page 17 pour la liste des function match
Page 19 pour la liste des operateur
page 31 pour la liste des type object (is. as.)

class(x)
mode(x)
attributes(x)
levels(fac)
str(x)
identical(x,y)
all.equal(x,y)

geometric=function(x){
if(!is.numeric(x)) stop ("Input must be numeric")
if(min(x)<=0)      stop ("Input must be greater than zero")
exp(mean(log(x)))}

> geometric(c("a","b","c"))
Erreur dans geometric(c("a", "b", "c")) : Input must be numeric

3/0     In  # infini positif  
-12/0  -Inf # infin  n?gatif
is.finite(x)
is.infinite(x)


2.5.1 Missing values:NA 

#2.6 Vectors and subscript(indices)  ::::::::: ================
  class:numeric,logical,integer,real,complex,string,raw

peas=c(4,7,6,5,6,7)
> quantile(peas)
  0%  25%  50%  75% 100% 
4.00 5.25 6.00 6.75 7.00 

scan()#pour entre des valuer dans un vevteur avec une invite

> pods=c(2,3,6)
> peas[pods]
[1] 7 6 7
> peas[c(-1,-2)]
[1] 6 5 6 7
sort(peas)
[1] 4 5 6 6 7 7


> counts=c(25,12,7,4,6,2,1,0,2)
> names(counts) = 0:8    #names() permet de mettre des entete
> counts
 0  1  2  3  4  5  6  7  8 
25 12  7  4  6  2  1  0  2 

> as.vector(counts) # pour affichier sans les entetes
[1] 25 12  7  4  6  2  1  0  2


#2.6.4 logical subscripts=========

> x=0:10
> x
 [1]  0  1  2  3  4  5  6  7  8  9 10
> sum(x) #somme des ?l?ment de x
[1] 55
> sum(x<5)# combien d'?l?ment sont  plus petit que 5 dans le vector x
[1] 5
> sum(x[x<5])  # somme des ?l?ment qui sont plus petit que 5 dans le vector x # idem : sum(x*(x<5))
[1] 10
> (x[x<5])  # afficheer les ?l?ment qui sont plus petit que 5 dans le vector x
[1] 0 1 2 3 4
> x<5
 [1]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
> 1*(x<5)
 [1] 1 1 1 1 1 0 0 0 0 0 0
> x*(x<5)
 [1] 0 1 2 3 4 0 0 0 0 0 0


#obtenir la somme des 3 plus grande valeurs d'un vector y
#1-on sort le vecteur :....................................sort(y) 
#2-on inverse le sort avec rev() : ....................rev(sort(y))
#3-on va chercher les 3 premier ?l?ment avec [1:3]:....rev(sort(y))[1:3]
#4-on utilise sum():...............................sum(rev(sort(y))[1:3])
> y=c(8,3,5,7,6,6,8,9,2,3,9,4,10,4,11)
> sum(rev(sort(y))[1:3])
[1] 30

> which.max(y) #retourne l'indice du plus de l'?l?ment ayant la plus grande valeur
[1] 15
> which.min(y) #retourne l'indice du plus de l'?l?ment ayant la plus petite valeur
[1] 9




#2.7 Vector function :::::::::=====================================


P41.liste::
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

--table()---
> counts=rnbinom(10000,mu=0.92,size=1.1)
> counts[1:30]
 [1] 0 4 0 0 0 1 0 0 2 0 2 1 2 1 0 1 3 0 0 1 0 0 1 3 2 4 3 2 0 1
> table(counts)
counts
   0    1    2    3    4    5    6    7    8    9   10   11   12 
5178 2483 1227  587  259  141   80   24    9    5    4    1    2 


#2.7.1 Obtaining tables of means using tapply====================

data<-read.table("c:\\temp\\temperatures.txt",header=T)
attach(data)
names(data)
[1] "temperature" "lower" "rain" "month" "yr"
tapply(temperature,month,mean)
   1    2    3    4    5    6    7    8    9   10   11   12 
13.0 19.0 12.5 24.0 18.0 34.0 23.0 34.0 23.0 34.0 13.0 19.0 

> tapply(temperature,month,var)
    1     2     3     4     5     6     7     8     9    10    11    12 
200.0 450.0 220.5 200.0  50.0   0.0   0.0   0.0   0.0   0.0 200.0 450.0 
> tapply(temperature,month,min)
 1  2  3  4  5  6  7  8  9 10 11 12 
 3  4  2 14 13 34 23 34 23 34  3  4 
> tapply(temperature,month,max)
 1  2  3  4  5  6  7  8  9 10 11 12 
23 34 23 34 23 34 23 34 23 34 23 34 

tapply(temperature,month,function(x) sqrt(var(x)/length(x)))# une function comme param
tapply(temperature,list(yr,month),mean)[,1:6]
tapply(temperature,yr,mean,na.rm=TRUE)
tapply(temperature,yr,mean,trim=0.2)



#2.7.2 the aggregate function for grouped summary statistis==============
#GROUP BY

> data=read.table("c:\\temp\\pHDaphnia.txt",header=T)
> names(data)
[1] "Growth.rate" "Water"       "Detergent"   "Daphnia"     "pH"  

> aggregate(Growth.rate~Water,data,mean)
#?quivaleurn en sql
# SELECT avg(Growth.rate) 
# FROM phDaphnia
# GROUP BY Water
  Water Growth.rate
1  Tyne    132.6910
2  Wear    144.6461


> aggregate(Growth.rate~Water+Detergent,data,mean)
#?quivaleurn en sql
# SELECT avg(Growth.rate) 
# FROM phDaphnia
# GROUP BY Water, Detergent
  Water Detergent Growth.rate
1  Tyne    BrandA    3.661807
2  Wear    BrandA    4.107857
3  Tyne    BrandB    3.911116
4  Wear    BrandB    4.108972
5  Tyne    BrandC    3.814321
6  Wear    BrandC    4.094704
7  Tyne    BrandD    3.356203
8  Wear    BrandD    3.760259



>aggregate(cbind(pH,Growth.rate)~Water+Detergent,data,mean)
#?quivaleurn en sql
# SELECT avg(pH),avg(Growth.rate) 
# FROM phDaphnia
# GROUP BY Water, Detergent
  Water Detergent       pH Growth.rate
1  Tyne    BrandA 4.883908    3.661807
2  Wear    BrandA 5.054835    4.107857
3  Tyne    BrandB 5.043797    3.911116
4  Wear    BrandB 4.892346    4.108972
5  Tyne    BrandC 4.847069    3.814321
6  Wear    BrandC 4.912128    4.094704
7  Tyne    BrandD 4.809144    3.356203



#2.7.3 Parallel minima and maxima pmin pmax =======================
#min ou max des plusieurs vectors de m?me longeur
>pmin(v1,v2,v3)
>pmax(va,vb)


#2.7.4 Summary information from vertor by group======================

> data=read.table("c:\\temp\\daphnia.txt",header=T)
> attach(data)
> names(data)
[1] "Growth.rate" "Water"       "Detergent"   "Daphnia"    
> tapply(Growth.rate,Detergent,mean)
  BrandA   BrandB   BrandC   BrandD 
3.884832 4.010044 3.954512 3.558231

> tapply(Growth.rate,list(Water,Daphnia),median)
       Clone1   Clone2   Clone3
Tyne 2.874053 3.908644 4.618288
Wear 2.590373 5.532726 4.302642 


#2.7.5 Addresses within vectors =====================================
which(y>5) #comme un where en sql


#2.7.6 Finding closest values=======================================

closest = function(xv,sv){ xv[which(abs(xv-sv)==min(abs(xv-sv)))]}
closest(xv,108)

#2.7.7 Sorting, ranking and ordering ================================
#sort=tri
#rank=le rang
#order= indice de permutaiton pour ?tre sort?
> houses=read.table("c:\\temp\\houses.txt",header=T)
> attach(houses)
> names(houses)
[1] "Location" "Price"   
> ranks=rank(Price)
> sorted=sort(Price)
> ordered=order(Price)
> view=data.frame(Price,ranks,sorted,ordered)
> view
   Price ranks sorted ordered
1    325  12.0     95       9
2    201  10.0    101       6
3    157   5.0    117      10
4    162   6.0    121      12
5    164   7.0    157       3
6    101   2.0    162       4
7    211  11.0    164       5
8    188   8.5    188       8
9     95   1.0    188      11
10   117   3.0    201       2
11   188   8.5    211       7
12   121   4.0    325       1
Location[order(Price)]
 [1] Reading     Staines     Winkfield   Newbury     Bracknell   Camberley  
 [7] Bagshot     Maidenhead  Warfield    Sunninghill Windsor     Ascot  


#2.7.8 Unique() and duplicated()=======================================
salary=c(42,42,48,42,42,42)
> unique(salary)#liste des val diff?rente comme le distinct en sql
[1] 42 48
> duplicated(salary)
[1] FALSE  TRUE FALSE  TRUE  TRUE  TRUE
> salary[duplicated(salary)]
[1] 42 42 42 42
> salary[!duplicated(salary)]
[1] 42 48
> mean(salary[!duplicated(salary)])
[1] 45


#2.7.9 looking for runs of numbers witin vectors=====================
#longeur de s?quence du m?me chiffre
#rle(), sample(), numeric(), quantile()

> poisson=rpois(150,0.7)
> rle(poisson)
Run Length Encoding
  lengths: int [1:92] 1 1 1 3 1 1 1 1 1 3 ...
  values : int [1:92] 0 1 3 1 0 1 0 1 0 1 ...

> rle(poisson)[[1]]
 [1] 1 1 1 3 1 1 1 1 1 3 1 1 2 2 3 2 1 2 3 1 2 3 1 2 1 1 1 1 1 1 2 1 2 2 4 1 5 1
[39] 1 2 1 1 2 1 1 1 1 1 3 1 2 2 4 1 1 1 2 1 2 1 1 2 1 2 3 1 1 2 1 5 1 4 1 2 2 1
[77] 1 1 1 1 1 2 1 2 1 1 2 1 1 3 2 2
> rle(poisson)[[2]]
 [1] 0 1 3 1 0 1 0 1 0 1 0 2 0 1 0 2 1 0 1 2 0 1 0 1 0 3 1 0 1 2 3 1 0 2 1 4 1 0
[39] 2 1 0 1 0 2 0 1 2 1 0 1 0 1 0 1 2 1 0 1 0 2 1 0 1 0 1 3 2 1 5 0 2 0 2 0 1 0
[77] 1 2 3 0 1 0 1 0 1 2 1 0 2 1 2 1

return the max length of the run and its value for a vector
>run.and.value = function(x) {
a= max(rle(x)[[1]])
b=rle(x)[[2]][which(rle(x)[[1]] == a)]
cat("length = ",a," value = ",b, "\n")}run

> run.and.value(poisson)
length =  5  value =  1 0 


> y=c(rep(1,25),rep(0,30))
> len=numeric(10000)
> for(i in 1:10000) len[i]=length(rle(sample(y))[[2]])
> quantile(len,c(0.025,0.97))
2.5%  97% 
  21   35 


#2.7.10 Sets: union(),  intersect()  setdiff() setequal() %in% ==============

> setA=c("a","b","c","d","e")
> setB=c("d","e","f","g")
> union(setA,setB)
[1] "a" "b" "c" "d" "e" "f" "g"
> intersect(setA,setB)
[1] "d" "e"
> setdiff(setA,setB)
[1] "a" "b" "c"
> setdiff(setB,setA)
[1] "f" "g"
> setequal(setA,setB)
[1] FALSE
> setA %in% setB
[1] FALSE FALSE FALSE  TRUE  TRUE
> setB %in% setA
[1]  TRUE  TRUE FALSE FALSE
> setA[setA %in% setB] #meme chose que intersect(setA,setB)
[1] "d" "e"


#2.8  MATRICES  and ARRAYS ::::::::::: ====================================
#array:multy dimension object. La dimension des sett? par le function 
#dim() et doit refl?ter le nombre d'?l?ment de l'objet 

> y=1:24
> y
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
> dim(y)=c(2,4,3) # 2=rows 4=cols  3=dimension
> y
     [,1] [,2] [,3] [,4]
[1,]    1    3    5    7
[2,]    2    4    6    8

[1,]    9   11   13   15
[2,]   10   12   14   16

[1,]   17   19   21   23
[2,]   18   20   22   24
#ici on a 3 dimensions de 4col par 2 rows pour un total de 24 ?l?ments
> y[2,3,2] #retourne 14
> y[2,,2]
[1] 10 12 14 16



#2.8.1  MATRICE IS A 2 DIM ARRAY CONTAINING NUMBERS ===============

X=matrix(c(1,0,0,0,1,0,0,0,1),nrow=3) #col-wise
     [,1] [,2] [,3]
[1,]    1    0    0
[2,]    0    1    0
[3,]    0    0    1

> attributes(X)
$dim
[1] 3 3  #soit 3 rows et 3 cols

> vector=c(1,2,3,4,4,3,2,1)
> V=matrix(vector,byrow=T,nrow=2)
> V
     [,1] [,2] [,3] [,4]
[1,]    1    2    3    4
[2,]    4    3    2    1
X

> vector
[1] 1 2 3 4 4 3 2 1

> dim(vector)=c(4,2) #transformer un vector en matrice
     [,1] [,2]
[1,]    1    4
[2,]    2    3
[3,]    3    2
[4,]    4    1
> is.matrix(vector)
[1] TRUE
> (vector=t(vector)) # t() pour transposer les dimensions
     [,1] [,2] [,3] [,4]
[1,]    1    2    3    4
[2,]    4    3    2    1


#2.8.2  naming the rows and columns of matrices===========================
#rownames() colnames()  dimnames()

> X=matrix(rpois(20,1.5),nrow=4) ; X
     col1 col2 col3 col4 col5
[1,]    1    0    2    5    3
[2,]    1    1    3    1    3
[3,]    3    1    0    2    2
[4,]    1    0    2    1    0

> rownames(X)=rownames(X,do.NULL=FALSE,prefix="Trail.") ; X
        col1 col2 col3 col4 col5
Trail.1    1    0    2    5    3
Trail.2    1    1    3    1    3
Trail.3    3    1    0    2    2
Trail.4    1    0    2    1    0

> drug.names=c("aspirin","paracetamol","nurofen","hedex","placebo")
> colnames(X)=drug.names; X
        aspirin paracetamol nurofen hedex placebo
Trail.1       1           0       2     5       3
Trail.2       1           1       3     1       3
Trail.3       3           1       0     2       2
Trail.4       1           0       2     1       0

> dimnames(X)=list(NULL,paste("drug.",1:5,sep="")) ;X
     drug.1 drug.2 drug.3 drug.4 drug.5
[1,]      1      0      2      5      3
[2,]      1      1      3      1      3
[3,]      3      1      0      2      2
[4,]      1      0      2      1      0


#2.8.3 Calculation on rows or cols of the matrix=============================

> rowMeans(X) # ou apply(X,1,mean) 1=row
[1] 2.2 1.8 1.6 0.8
> colMeans(X) # ou apply(X,2,mean)  2=col
drug.1 drug.2 drug.3 drug.4 drug.5 
  1.50   0.50   1.75   2.25   2.00 

> rowsum(X,c("A","A","B","C"))
  drug.1 drug.2 drug.3 drug.4 drug.5
A      2      1      5      6      6  #regroupement des row 1 et 2 
B      3      1      0      2      2
C      1      0      2      1      0


#2.8.4 Adding rows and cols to hte matrix ===============================================
#rbind()= ajouter row 
#cbind()= ajouter col
> X
drug.1 drug.2 drug.3 drug.4 drug.5
[1,]      1      0      2      5      3
[2,]      1      1      3      1      3
[3,]      3      1      0      2      2
[4,]      1      0      2      1      0
> X=rbind(X,apply(X,2,mean))
> X=cbind(X,apply(X,1,mean))
> X
     drug.1 drug.2 drug.3 drug.4 drug.5    
[1,]    1.0    0.0   2.00   5.00      3 2.2
[2,]    1.0    1.0   3.00   1.00      3 1.8
[3,]    3.0    1.0   0.00   2.00      2 1.6
[4,]    1.0    0.0   2.00   1.00      0 0.8
[5,]    1.5    0.5   1.75   2.25      2 1.6
#nommer les nouveaux col et row
> colnames(X)=c(1:5,"variance")
> rownames(X)=c(1:4,"mean")
> X
       1   2    3    4 5 variance
1    1.0 0.0 2.00 5.00 3      2.2
2    1.0 1.0 3.00 1.00 3      1.8
3    3.0 1.0 0.00 2.00 2      1.6
4    1.0 0.0 2.00 1.00 0      0.8
mean 1.5 0.5 1.75 2.25 2      1.6

#somerows=mat[index , , drop = FALSE]
#drop =FALSE voir livre page 59


#2.8.5 The sweep funciton ===========================================================
#soustraire une valeur a tous les donn?es d'un matrice
#soustraire des valeurs a un ensemble de donn?es d'un matrice

> matdata=read.table("c:\\temp\\sweepdata.txt")
> matdata
V1 V2  V3  V4
1   3 12 0.4 125
2   5 12 0.7 166
3   7 15 0.8 174
4   7 14 0.7 128
5   5 18 0.3 136
6   9 13 0.2 155
7   7 15 0.5 115
8   2 13 0.5 169
9   1 10 0.1 182
10  0 11 0.2 166

> (cols=apply(matdata,2,mean))
V1     V2     V3     V4 
4.60  13.30   0.44 151.60 
> sweep(matdata,2,cols)
V1   V2    V3    V4
1  -1.6 -1.3 -0.04 -26.6
2   0.4 -1.3  0.26  14.4
3   2.4  1.7  0.36  22.4
4   2.4  0.7  0.26 -23.6
5   0.4  4.7 -0.14 -15.6
6   4.4 -0.3 -0.24   3.4
7   2.4  1.7  0.06 -36.6
8  -2.6 -0.3  0.06  17.4
9  -3.6 -3.3 -0.34  30.4
10 -4.6 -2.3 -0.24  14.4


#2.8.6 Applying function with apply, sapply, lapply ================================
#the apply() for applying func to row or col of a matrice or dataframe
#the sapply() for applying func to vector
#optimize() ???
#margin=1=rows
#margin=2=clos

> X=matrix(1:24,nrow=4)
> X
[,1] [,2] [,3] [,4] [,5] [,6]
[1,]    1    5    9   13   17   21
[2,]    2    6   10   14   18   22
[3,]    3    7   11   15   19   23
[4,]    4    8   12   16   20   24
> (apply(X,1,sum)) #somme des rows car margin 1 donc rows 
#apply retourne un vector  
[1] 66 72 78 84

> apply(X,1,sqrt)
[,1]     [,2]     [,3]     [,4]
[1,] 1.000000 1.414214 1.732051 2.000000
[2,] 2.236068 2.449490 2.645751 2.828427
[3,] 3.000000 3.162278 3.316625 3.464102
[4,] 3.605551 3.741657 3.872983 4.000000
[5,] 4.123106 4.242641 4.358899 4.472136
[6,] 4.582576 4.690416 4.795832 4.898979

sumsq = function(a,xv=x,yv=y){ yf = exp(-a*xv)
  sum((yv-yf)^2) }


> f <- function (x, a) (x - a)^2
> xmin <- optimize(f, c(0, 1), tol = 0.0001, a = 1/3)
> xmin
$minimum
[1] 0.3333333

$objective
[1] 0


#2.8.7 Using the max.col function===============================
> data=read.table("c:\\temp\\pgfull.txt",header=T)
> species=data[,1:54]#54 premi?re col 
> max.col(species)#num?ro de la col du max pour chaque row
> names(species)[max.col(species)]#donne les nom de col en utilisant les num?ro de col
> table(names(species)[max.col(species)])
AC AE AO AP CN FR HL HS LH LP TP 
26 23  4  2  1 19  3  1  5  1  4 
> length(table(names(species)[max.col(species)]))
[1] 11

#2.8.8 Restructuring a multi-dimensional array using aperm()=====================
> data=array(1:24,2:4)#24 valeurs 3dim:  (2:4)=(2,3,4) soit 2row, 3col, 4dim
> dimnames(data)[[1]]=list("male","female") #nom pour les row
> dimnames(data)[[2]]=list("young","mid","old")#nom pour les col
> dimnames(data)[[3]]=list("A","B","C","D")#nom pour les groupe (sub-table)

> new.data=aperm(data,c(2,3,1))
> new.data
#les permutation (1,2,3) devenu (2,3,1) 
#(1,2,3)
#(2,3,1)
#row -> sub   1->2
#col -> row   2->3
#sub -> col   3->1


#2.9 Random numbers, sampling and shuffling  :::::::::===============
#pour avoir des nombre random identique d'une fois a l'autre
#utiliser set.seed()  
> set.seed(375)
> runif(3)
[1] 0.9613669 0.6918535 0.7302684
#ou garder en m?rore le seed actuel dans une variable 
> current=.Random.seed 
> runif(3)
[1] 0.96427987 0.52880907 0.08660864
> runif(3)
[1] 0.29075809 0.02590182 0.85520652 #diff?rent
> .Random.seed=current #reinitialiser la seed gard? dans la variable
> runif(3)
[1] 0.96427987 0.52880907 0.08660864 #m?me que le premier



#2.9.1 the sample() function ===========================================
#comme brasser des cartes a jouer ; les valeurs sont les m?me mais dans un autre ordre
#sampling without replacement
> y <- c(8,3,5,7,6,6,8,9,2,3,9,4,10,4,11)
> y
[1]  8  3  5  7  6  6  8  9  2  3  9  4 10  4 11
> sample(y)
[1]  6  8  4  7  8  3  4  2  9  5 10  3 11  9  6
> sample(y)
[1] 10 11  2  8  6  9  6  4  4  3  8  9  7  5  3

sample(y,5)#sous-ensemble de 5 
[1]  8  7 11  6  4

#sampling with replacement :: replace=T
> sample(y,replace=T) #des valeurs on chang?
[1]  5  8 10  4  5  5  4  8 11  3  6  2  6  3  8


#2.10 Loops and repeats :::::::::============================================
for(i in 1:5) print(i^2)

j=k=0
for(i in 1:5){
j=j+1
k=k+i*j
print(i+j+k)}
[1] 3
[1] 9
[1] 20
[1] 38
[1] 65

> fac1 <- function(x) {
  +   f <- 1
  +   if (x<2) return (1)
  +   for (i in 2:x) {
  +     f <- f*i}
  +     f }
> sapply(1:5,fac1)
[1]   1   2   6  24 120

#while  loop
> fac2=function(x){
  + f=1
  + t=x
  + while(t>1){
    + f=f*t
    + t=t-1}
  + return(f)}
> sapply(0:5,fac2)
[1]   1   1   2   6  24 120

#repeat
fac3 <- function(x) { f <- 1
                      t <- x
                      repeat { if (t<2) break
                               f <- f*t
                               t <- t-1 } 
                      return(f) }

> sapply(0:5,fac3)
[1]   1   1   2   6  24 120

> cumprod(1:5) #cumulative product function
[1]   1   2   6  24 120


#2.10.1 Ceation the binary representatin on a number=====================
voir le livre pour d?tail

#2.10.2 Loop avoidance ifelse()=======================================
#ifelse()  = iif()
> y=c(1,2,3,4,5,10,20,30,40,50,111,222,333,444)
> y
[1]   1   2   3   4   5  10  20  30  40  50 111 222 333 444
> ifelse(y<10,y+1000,y)
[1] 1001 1002 1003 1004 1005   10   20   30   40   50  111  222  333  444

#2.10.3 The slowness of loops   system.time and proc.time ====================================
#The functions system.time and proc.time produce a vector of three numbers, 
#showing the user, system, and total elapsed times
# for the currently running R process.
system.time(max(x)) # affiche le temps ex?cution
utilisateur     syst?me      ?coul? 
0.08        0.00        0.08 
pc <- proc.time()#info sur le temps 
proc.time()-pc


#2.11 Lists :::::::::::::================================
#une list est un bundle de vecteur de diff?rent type et de diff longeur

apples <- c(4,4.5,4.2,5.1,3.9)
oranges <- c(TRUE, TRUE, FALSE)
chalk <- c("limestone", "marl","oolite", "CaC03")
cheese <- c(3.2-4.5i,12.8+2.2i)
items <- list(apples,oranges,chalk,cheese)
> items[[3]][2] #bonne facon  [[3]][2]
[1] "marl"
> items[3][2]   #pas bon [3][2] il faut les  double [[]]
[[1]]
NULL

# avec le $  indexing tagged lists
#on donne des nom aux ?l?ment de la list a=apples
> items <- list(a=apples,b=oranges,c=chalk,d=cheese)
> items$a[2] # ?quivalent de >items[[1]][2]
[1] 4.5


#2.11.1  Lists and lapply()  str() summary() ===================================
> items <- list(first=apples,second=oranges,third=chalk,fourth=cheese)
> class(items)
[1] "list"
> mode(items)
[1] "list"
> is.numeric(items)
[1] FALSE
> is.list(items)
[1] TRUE
> length(items)
[1] 4

# lapply() 
> lapply(items,length)#longeur de chaque ?l?ment
$first
[1] 5
$second
[1] 3
$third
[1] 4
$fourth
[1] 2

> str(items)
List of 4
$ first : num [1:5] 4 4.5 4.2 5.1 3.9
$ second: logi [1:3] TRUE TRUE FALSE
$ third : chr [1:4] "limestone" "marl" "oolite" "CaC03"
$ fourth: cplx [1:2] 3.2-4.5i 12.8+2.2i

> summary(items)
Length Class  Mode     
first  5      -none- numeric  
second 3      -none- logical  
third  4      -none- character
fourth 2      -none- complex  


#2.11.2 Manipulating and saving lits ===================================
#voir livre page82 car exemple tr?s complex 
#stack() pour mettre a la verticale des colonnes d une matrice



#2.12 Text, character string , pattern matching ::::::=====
#When first defined characters string are not factors
#when put into dataframe character string are coerce to factor
letters
LETTERS
noquote(letters)
nchar(letters)

#2.12.1 Pasting character string together ======
> drive <- "c:"
> folder <- "temp"
> file <- "file"
> extension <- ".txt"
> paste(drive, "\\",folder, "\\",file, extension,sep="")
[1] "c:\\temp\\file.txt"

> d=c("un","deux","trois") #ici d est un vector 
> paste(d,"--texte ajoute")# ajouter le text a tous les ?l?ments du vector
[1] "un --texte ajoute"    "deux --texte ajoute"  "trois --texte ajoute"


#2.12.2 Extracting parts of string  substr(x,start,len)==========
> phrase="the quick brown fox jumps over the lazy dog"
> q=character(20)
> for(i in 1:20) q[i]=substr(phrase,1,i)
> q
[1] "t"                    "th"                   "the"                  "the "                 "the q"               
[6] "the qu"               "the qui"              "the quic"             "the quick"            "the quick "          
[11] "the quick b"          "the quick br"         "the quick bro"        "the quick brow"       "the quick brown"     
[16] "the quick brown "     "the quick brown f"    "the quick brown fo"   "the quick brown fox"  "the quick brown fox "
> 

  
#2.12.3 Counting things with strings ===================

phrase <- "the quick brown fox jumps over the lazy dog"
strsplit(phrase,split=character(0))
table(strsplit(phrase,split=character(0)))


#2.12.4 Upper- and lower-case text ===========
#It is easy to switch between upper and lower cases using the toupper and tolower functions:
toupper(phrase)
[1] THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG
tolower(toupper(phrase))
[1] the quick brown fox jumps over the lazy dog


#2.12.5 The match() function and relational databases =======
> subjects <- c("A", "B", "G", "M", "N", "S", "T", "V", "Z")
> suitable.patients <- c("E", "G", "S", "U", "Z")
> match(subjects, suitable.patients)
[1] NA NA  2 NA NA  3 NA NA  5
> drug <- c("new", "conventional")
> drug[ifelse(is.na(match(subjects, suitable.patients)),2,1)]
[1] "conventional" "conventional" "new"          "conventional" "conventional" "new"          "conventional"
[8] "conventional" "new"         


#2.12.6 Pattern matching grep()=====================================
#the start of the character string is denoted by ^ and the end of the character string is denoted by $.
as.vector(Country[grep("^ R",as.character(Country))])

> as.vector(Country[grep(" R",as.character(Country))])
[1] "Central African Republic" "Costa Rica"               "Dominican Republic"       "Puerto Rico"             
> as.vector(Country[grep("y$",as.character(Country))])
[1] "Hungary"  "Italy"    "Norway"   "Paraguay" "Sicily"   "Turkey"   "Uruguay"
as.vector(Country[-grep("[a-t]$",as.character(Country))])#negatif subscript



#2.12.7 Dot .as the anything character =============
#Countries with 'y' as their second letter are specified by ^.y. The ^ shows 'starting', then a single dot means
#one character of any kind, so y is the specified second character:


#2.12.8 Substituting text within character strings sub() gsub()==========
#sub() et gsub() comme strreplace()
> text <- c("arm", "leg", "head", "foot", "hand", "hindleg", "elbow")
> sub("o","O",text)
[1] "arm"     "leg"     "head"    "fOot"    "hand"    "hindleg" "elbOw"  
> gsub("o","O",text)
[1] "arm"     "leg"     "head"    "fOOt"    "hand"    "hindleg" "elbOw"
> gsub("(\\w*)(\\w*)", "\\U\\1\\L\\2",text, perl=TRUE)
[1] "ARM"     "LEG"     "HEAD"    "FOOT"    "HAND"    "HINDLEG" "ELBOW"  
> gsub("(\\w*)", "\\U\\1",text, perl=TRUE)
[1] "ARM"     "LEG"     "HEAD"    "FOOT"    "HAND"    "HINDLEG" "ELBOW"    


#2.12.9 Location of a pattern in e vector using regexpr()=======
#regexpr() un peu comme pos()
#retourne la position de la chaine de car trouv? dans la variable et -1 si pas trouv?
> text
[1] "arm"     "leg"     "head"    "foot"    "hand"    "hindleg" "elbow"
> as.vector(unlist(regexpr("o",text)))#ici on cherche o dans le vecteur text pour chauqe ?l?ment du vectour on a un r?sultat
[1] -1 -1 -1  2 -1 -1  4
> as.vector(unlist(gregexpr("o",text)))
[1] -1 -1 -1  2  3 -1 -1  4

> charmatch("m",c("mean","median","mode"))#retourne 0 quand plusieurs ?l?ment on le match
[1] 0
> charmatch("med",c("mean","median","mode"))#match unique retourne l'index de l'?l.ment du match
[1] 2


#2.12.10 Using %in% and witch ==========
> stock <- c("car","van")
> requests <- c("truck","suv","van","sports","car","waggon","car")

> which(requests %in% stock)#index des match
[1] 3 5 7
> requests [which(requests %in% stock)] #valeur des match
[1] "van" "car" "car"


#2.13 Date and time ========================
> class(Sys.time())
[1] "POSIXct" "POSIXt" 

> time.list=as.POSIXlt(Sys.time())
> unlist(time.list)
sec      min     hour     mday      mon     year     wday     yday    isdst 
19.3724   7.0000  14.0000   8.0000   3.0000 114.0000   2.0000  97.0000   1.0000 


#2.13.1 Reading time data form file ==========

#2.13.2  the strptime() funciton =========
Rdate=strptime(as.character(date),"%d/%m/%Y")

> y=strptime("01/02/2014",format="%d/%m/%Y")
> y
[1] "2014-02-01"
> weekdays(y)
[1] "samedi"
> str(y)
POSIXlt[1:1], format: "2014-02-01"





#2.13.8 Regression using dates and times=======
data <- read.table("c:\\temp\\timereg.txt",header=T)

  survivors date
1       100 01/01/2011
2        52 01/02/2011
3        28 01/03/2011
4        12 01/04/2011
5         6 01/05/2011
6         5 01/06/2011

#The first job, as usual, is to use strptime to convert the character string "01/01/2011" into a date-time
#object:
> dl <- strptime(date,"%d/%m/%Y")
[1] "2011-01-01" "2011-02-01" "2011-03-01" "2011-04-01" "2011-05-01" "2011-06-01" "2011-07-01" "2011-08-01"
[9] "2011-09-01" "2011-10-01" "2011-11-01" "2011-12-01" "2012-01-01"

class(dl)
[1] "POSIXlt" "POSIXt"
mode(dl)
[1] "list"

windows(7,4)
par(mfrow=c(1,2))
plot(dl,survivors,pch=16,xlab ="month")
plot(dl,log(survivors),pch=16,xlab ="month")


#2.14 Environement ======
#GlobalEnv
#with vs attach  ne pas utiliser attach


#2.15  Writing R functions====
arithmetic.mean <- function(x) sum(x)/length(x)


#2.15.2 Median of a single sample====
#valeur de l'?l?ment au centre d'un vecteur tri? 
#ou moyenne des 2 ?l?ment les plus au centre
med <- function(x) {
  odd.even <- length(x)%%2
  if (odd.even == 0) (sort(x)[length(x)/2]+sort(x)[1+ length(x)/2])/2
  else sort(x)[ceiling(length(x)/2)]
}

#2.15.3 Geometric mean====
geometric.mean <- function (x) exp(mean(log(x)))


#2.15.4 Harmonic mean====
harmonic.mean <- function (x) 1/mean(1/x)

#2.15.5 Variance =====
var()

#2.15.6 Degrees of freedom====
> variance <- function(x) sum((x - mean(x))^2)/(length(x)-1)
> y <- c(13,7,5,12,9,15,6,11,9,7,12)
> variance(y)
[1] 10.25455


#2.15.7 Variance ratio test====

#2.15.8 Using variance====


#2.15.10 the switch function====
central <- function(y, measure) { switch(measure,
                                         Mean = mean(y),
                                         Geometric = exp(mean(log(y))),
                                         Harmonic = 1/mean(1/y),
                                         Median = median(y),
                                         stop("Measure not included")) }

> central(rnorm(100,10,2),"Harmonic")
[1] 9.886702
> central(rnorm(100,10,2),4)
[1] 9.991696



#2.15.13 Optiional argument====
> charplot=function(x,y,pc=16,co="red"){plot(y~x,pch=pc,col=co)}
> charplot(1:10,1:10)
> charplot(1:10,1:10,17)
> charplot(1:10,1:10,co="navy")
#si les lable des argument ne sont pas pr?snet il faut respecter l'ordre
#des arguments
> charplot(1:10,1:10,"green",15)#point en forme de lettre g
> charplot(1:10,1:10,co="green",pc=15)

#2.15.14 Variable numbers of arguments ( . . . )
# function ( ...)    data <- list( ...)   n <- length(data)
many.means <- function ( ...)
  { data <- list( ...)
   n <- length(data)
   means <- numeric(n)
   vars <- numeric(n)
   for (i in 1:n) { means[i] <- mean(data[[i]])
      vars[i] <- var(data[[i]])
   }print(means)
   print(vars)
   invisible(NULL)
}


#2.15.15 Returning values from a function===
#retourner une seule valeur : simply leave the last line of the function unassigned 
  parmax <- function (a,b) {
    c <- pmax(a,b)
    median(c) }

#retourner 2 et plus valeur: use return with a list containing the variables to be returned. 
  parboth <- function (a,b) { c <- pmax(a,b)
                              d <- pmin(a,b)
                              answer <- list(median(c),median(d))
                              names(answer)[[1]] <- "median of the parallel maxima"
                              names(answer)[[2]] <- "median of the parallel minima"
                              return(answer) }

  parboth(x,y)
$"median of the parallel maxima"
[1] 8
$"median of the parallel minima"
[1] 2


#2.15.16 Anonymous functions====
#Anonymous functions are used most frequently with apply, tapply, sapply and lapply
(function(x,y){ z <- 2* x^2 + y^2; x+y+z })(0:7, 1)
[1] 2 5 12 23 38 57 80 107


#2.16.4 Saving data produced whini R to disc====
To export the numbers I use write like this, specifying that the numbers are to be output in a single
column (i.e. with third argument 1 because the default is 5 columns):
write(nbnumbers,"c:\\temp\\nbnumbers.txt",1)


write.table pour les matrice 
nbtable <- table(nbnumbers)
nbtable
0 1 2 3 4 5 6 7 8 9 11 15
445 248 146 62 41 33 13 4 1 5 1 1
#If you want to save both the counts and their frequencies in adjacent columns, use
write.table(nbtable,"c:\\temp\\table.txt",col.names=F,row.names=F)
#if you only want to export a single column of frequencies (445, 248, . . . ) use
write.table(unclass(nbtable),"c:\\temp\\table.txt",col.names=F,row.names=F)


#2.16.5 Pasting into Excel====
> writeClipboard(as.character(x))

#2.16.6 writing an Excel readable file from R====
#copier une dataframe dans le clipboard avec des tab pour s?parer les colonnes
write.table(data,"clipboard",sep="\t",col.names=NA)



#3 DATA INPUT =========
#
#

dir()
data<-read.table(file.choose(),header=T)


for comma-separated fields use read.csv("c:\\temp\\file.csv");
for semicolon-separated fields read.csv2("c:\\temp\\file.csv");
for tab-delimited fields with decimal points as a commas, use read.delim2("c:\\temp\\file.txt").

#as.is pour empecher la convertion en factor du vector de string
murder <- read.table("c:\\temp\\murders.txt",header=T,as.is="region")

na.omit

file.exists()

#3.10 built-in data files====
data() #to see data set in pakages

#3.11 3.11 File paths====
file.path(A,B,C,D,E,F,fsep="\\")

#3.13 Reading data from an external database====
Marche a suivre pour connecter une bd access
a Rcran 
via ODBC:Open database connectivity 
 et DBMS:Database management system
Page:154 et suivantes


#Chapitre 4 Dataframe ====
#importation de donn?es .txt
#comment pr?rarer les donn?es dans EXCEL
worms=read.table("c:\\temp\\worms.txt",header=T)#importe les donn?es
attach(worms) #Ne pas utiliser (crr? des objets pour chaque colommes , comme des alias)
names(worms)  #affiche les nom de variables
head(worms)   # afficher les premiers rows
tail(worms)   #affiche les dernier rows
summary(worms)#affiche un rapport du dataframe

#4.1 Subscripts and indices====

worms[1:5,2:3]#sous ensemble des row 1a 5 et des col 2et3
worms[,3]#la row 3 au complet
worms[3,]#la col 3 au complet
worms[,c(1,5)]#les donn?es des var 1 et 5
          Field.Name Soil.pH
1        Nashs.Field     4.1
2     Silwood.Bottom     5.2
3      Nursery.Field     4.3
4        Rush.Meadow     4.9
...

#4.2 Selecting rows form the dataframe ar rsndom====
worms[sample(1:20,4),]#affiche 4 row au hazard entre les rows 1 et 20

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
worms[,sapply(worms,is.factor)]
worms[-(6:15),]#To drop a row or rows from the dataframe, use negative subscripts.(i.e. row numbers 6 to 15 inclusive) 
worms[!(Vegetation=="Grassland"),]

#4.5 Omitting rows containing missing values, NA====
na.fail(object, ...)# returns the object if it does not contain any missing values, and signals an error otherwise.
na.omit(object, ...)#sans les row avec des NA
na.exclude(object, ...)# differs from na.omit only in the class of the "na.action" attribute of the result, which is "exclude". This gives different behaviour in functions making use of naresid and napredict
na.pass(object, ...)#returns the object unchanged.
complete.cases(data)#return TRUE ou FLASE selon su'il y a des NA dans les row
data[complete.cases(data),]# equivalent de na.omit(data)
apply(apply(data,2,is.na),2,sum)#donne  pour chaque col le total des NA
Field.Name         Area        Slope   Vegetation      Soil.pH         Damp       Worm.density 
0                  1            1       0              1               1            1 



#4.5.1 Replacing NAs with zeros====
data[is.na(data)]<-0  #this is how to replace all the NAs by zeros:


#4.6 Using order and !duplicated to eliminate pseudoreplication====
# extract a single record for each vegetation type,
#and that record is to be the case within each vegetation type that has the greatest worm density. 
# 1- order all of the rows in a new dataframe using rev(order(Worm.density)),
# 2- select the subset of these rows which is not duplicated (!duplicated) within each vegetation type in the
#new dataframe (using new$Vegetation) :
new <- worms[rev(order(Worm.density)),]
new[!duplicated(new$Vegetation),]

Field.Name Area Slope Vegetation Soil.pH Damp Worm.density
9 The.Orchard 1.9 0 Orchard 5.7 FALSE 9
16 Water.Meadow 3.9 0 Meadow 4.9 TRUE 8
11 Garden.Wood 2.9 10 Scrub 5.2 FALSE 8
10 Rookery.Slope 1.5 4 Grassland 5.0 TRUE 7
2 Silwood.Bottom 5.1 2 Arable 5.2 FALSE 7


#4.7 Complex ordering with mixed directions====
worms[order(worms$Vegetation,-worms$Worm.density),]# minus sign (-) equivaut a desc, pour le num seulement
worms[order(-rank(worms$Vegetation),-worms$Worm.density),]# -rank() pour les champ factor


#4.8 A dataframe with row names instead of row numbers====
worms2 <- read.table("c:\\temp\\worms.txt",header=T,row.names=1)
head(worms2)
                 Area Slope Vegetation Soil.pH  Damp Worm.density
Nashs.Field      3.6    11  Grassland     4.1   FALSE            4
Silwood.Bottom   5.1     2     Arable     5.2   FALSE            7
Nursery.Field    2.8     3  Grassland     4.3   FALSE            2
Rush.Meadow      2.4     5     Meadow     4.9   TRUE             5
Gunness.Thicket  3.8     0      Scrub     4.2   FALSE            6
Oak.Mead         3.1     2  Grassland     3.9   FALSE            2
#Notice that the field names column is not now headed by a variable name, and that the row numbers, as
#intended, have been suppressed.


#4.9 Creating a dataframe from another kind of object====
x <- runif(10)
y <- letters[1:10]
z <- sample(c(rep(T,5),rep(F,5)))
new <- data.frame(y,z,x)
short<-as.data.frame(table(y))



#4.10 Eliminating duplicate rows from a dataframe====

dups <- read.table("c:\\temp\\dups.txt",header=T)
unique(dups)#sans les row duplik? (distinct row)
dups[duplicated(dups),]#juste les row duplik?
cow dog cat bat
5   3   2   1   1

#4.11 Dates in dataframes====
nums <- read.table("c:\\temp\\sortdata.txt",header=T)
head(nums)
   name       date   response       treatment
1  albert 25/08/2003 0.05963704         A
2     ann 21/05/2003 1.46555993         A
3    john 12/10/2003 1.59406539         B
4     ian 02/12/2003 2.09505949         A
5 michael 18/10/2003 2.38330748         B
6     ann 02/07/2003 2.86983693         B

#In order to sort by date we need first to convert our variable into date-time format
#using the strptime function
dates <- strptime(nums$date,format="%d/%m/%Y")
transforme : 25/08/2003  en "2003-08-25"
nums <- cbind(nums,dates)# ajout des date bien format? 
nums[order(nums$dates),]#maintenant le tri sera bien fait



#4.12 Using the match function in dataframes====
unique(worms$Vegetation)
[1] Grassland Arable    Meadow    Scrub     Orchard  
Levels: Arable Grassland Meadow Orchard Scrub

 herbicides <- read.table("c:\\temp\\herbicides.txt",header=T)
> herbicides$Herbicide[match(worms$Vegetation,herbicides$Type)]
[1] Allclear Twinspan Allclear Propinol Weedwipe Allclear Allclear Twinspan Fusilade Allclear Weedwipe Allclear
[13] Allclear Allclear Propinol Propinol Weedwipe Twinspan Allclear Weedwipe
Levels: Allclear Fusilade Propinol Twinspan Vanquish Weedwipe
> worms$hb <- herbicides$Herbicide[match(worms$Vegetation,herbicides$Type)]

#4.13 Merging two dataframes====
merge()

#4.14 Adding margins to a dataframe====
#ajout de col  cdind()
frame <- read.table("//home//pascal//Rcran//temp//sales.txt",header=T)
people <- rowMeans(frame[,2:5])
people <- people-mean(people)
(new.frame <- cbind(frame,people))#ajout de la col avec cbind()
#ajout de row rdind()
seasons <- colMeans(frame[,2:5])
seasons <- seasons-mean(seasons)
new.row <- new.frame[1,]
new.row
        name spring summer autumn winter people
1 Jane.Smith     14     18     11     12    0.3

new.row[1] <- "seasonal effects"
new.row[2:5] <- seasons
new.row[6] <- 0
new.row
              name spring summer autumn winter people
1 seasonal effects   0.35   3.15  -3.05  -0.45      0
(new.frame <- rbind(new.frame,new.row))


#4.15 Summarizing the contents of dataframes====
aggregate(worms[,c(2,3,5,7)],by=list(veg=worms$Vegetation),mean)




========================================================================
========================================================================
========================================================================
========================================================================
      GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS
      GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS
      GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS
      GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS
      GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS
      GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS  GRAPHICS
========================================================================
========================================================================
========================================================================
========================================================================
#5.1 Plots with two variables
plot(x,y) #scatterplot of y against x;
plot(factor, y) #box-and-whisker plot of y at each factor level;
barplot(y) #heights from a vector of y values (one bar per factor level).


#5.2 Plotting with two continuous explanatory variables: Scatterplots====
plot, points and lines

Cartesian... plot(x,y)
formula..... plot(y~x)

data1 <- read.table("c:\\temp\\scatter1.txt",header=T)
attach(data1)
names(data1)
plot(xv,ys,col="red")
plot(xv,ys,col="red",xlab="Explanatory variable",ylab="Response variable")
abline(lm(ys~xv))#ajoute au graph une ligne de regression
#add more points
data2 <- read.table("c:\\temp\\scatter2.txt",header=T)
attach(data2)
names(data2)
points(xv2,ys2,col="blue",pch=16)#ajoute les point de data2 au graph
abline(lm(ys2~xv2))#ajoute au graph une ligne de regression les donnÈe de data2

#pour avoir tout les donnÈe dans le graph
plot(c(xv,xv2),c(ys,ys2),xlab="Explanatory variable",ylab="Response variable",type="n")
points(xv,ys,col="red")
points(xv2,ys2,col="blue",pch=16)
abline(lm(ys~xv))
abline(lm(ys2~xv2))

range(c(xv,xv2))
range(c(ys,ys2))
plot(c(xv,xv2),c(ys,ys2),xlim=c(0,100),ylim=c(0,70),xlab="Explanatory variable",ylab="Response variable",type="n")
points(xv,ys,col="red")
points(xv2,ys2,col="blue",pch=16)
abline(lm(ys~xv))
abline(lm(ys2~xv2))
legend(locator(1),c("treatment","control"),pch=c(1,16), col=c("red","blue"))#cliquer dans le graph pour ajouter

#5.2.2 Colour for symbols in plots====
plot(0:9,0:9,pch=16,type="n",xaxt="n",yaxt="n",ylab="col",xlab="bg")
axis(1,at=1:8)
#axis(2,at=1:8)
for (i in 1:8) points(1:8,rep(i,8),pch=c(21,22,24),bg=1:8,col=i)



#5.2.3 Adding text to scatterplots====
map.places <- read.csv("c:\\temp\\map.places.csv",header=T)
attach(map.places)
names(map.places)
map.data <- read.csv("c:\\temp\\bowens.csv",header=T)
attach(map.data)
names(map.data)
nn <- ifelse(north<60,north+100,north)
windows(9,7)
plot(c(20,100),c(60,110),type="n",xlab="",ylab="",xaxt="n", yaxt="n")
for (i in 1:length(wanted)){ ii <- which(place == as.character(wanted[i]))
                             text(east[ii], nn[ii], as.character(place[ii]), cex = 0.6) }



#5.2.4 Identifying individuals in scatterplots====
data <- read.table("c:\\temp\\sleep.txt",header=T)
attach(data)
plot(Days,Reaction)
head(data)
s <- as.numeric(factor(Subject))
plot(Days,Reaction,type="n")
#faire des lignes pour relier chaque point appartenant au mÍme subject
for (k in 1:max(s)){ x <- Days[s==k]
                     y <- Reaction[s==k]
                     lines(x,y,type="b",col="gray")
}
sym <- rep(c(21,22,24),c(7,7,4))
bcol <- c(2:8,2:8,2:5)
#colorer les point
for (k in 1:max(s)){ points(Days[s==k],Reaction[s==k],pch=sym[k],bg=bcol[k],col=1)}


#5.2.5 Using a third variable to label a scatterplot====
data <- read.table("c:\\temp\\pgr.txt",header=T)
attach(data)
names(data)
head(data)
plot(hay,pH)
text(hay, pH, labels=round(FR, 2), pos=4, offset=0.5,cex=0.5)
#You can also use a third variable to choose the colour of the points in your scatterplot. Here the points
#with FR above median are shown in red, the others in black:
plot(hay,pH,pch=16,col=ifelse(FR>median(FR),"red","black"))
legend(locator(1),c("FR>median","FR<=median"),pch=16,col=c("red","black"))

#5.2.6 Joining the dots=====
smooth <- read.table("c:\\temp\\smoothing.txt",header=T)
attach(smooth)
names(smooth)
#Begin by producing a vector of subscripts representing the ordered values of the explanatory variable.
#Then draw lines with this vector as subscripts to both the x and y variables:
plot(x,y,pch=16)
sequence <- order(x)
lines(x[sequence],y[sequence])
#If you do not order the x values, and just use the lines function, this is what happens:
plot(x,y,pch=16)
lines(x,y)


#5.2.7 Plotting stepped lines====
x<-0:10
y<-0:10
plot(x,y)
lines(x,y,col="red")#There are three ways we can join the dots: with a straight line
lines(x,y,col="blue",type="s")#with a stepped line going across first then up, using lower-case 's'
lines(x,y,col="green",type="S")#or with a stepped green line going up first, then across using upper-case 'S' ('upper case, up first' is the way to remember it):


#5.3 Adding other shapes to a plot====
plot(0:10,0:10,xlab="",ylab="")
plot(0:10,0:10,xlab="",ylab="",xaxt="n",yaxt="n")#sans les xant:info pour l'axe x  yaxt:info pour axe y
plot(0:10,0:10,xlab="",ylab="",xaxt="n",yaxt="n",type="n")#sans les points dessinÈ

You can easily add extra graphical objects to plots:
 rect rectangles
 arrows arrows and headed bars
 polygon more complicated filled shapes, including objects with curved sides

rect(6,6,9,9)#rect(xleft, ybottom, xright, ytop)
rect(6,6,9,9,col="green",border="blue")

#5.3.1 Placing items on a plot with the cursor, using the locator function====
corners <- function(){ coos <- c(unlist(locator(1)),unlist(locator(1)))
                       rect(coos[1],coos[2],coos[3],coos[4])
}
corners()#cliquer avec la sourie pour dessiner la forme

arrows(1,1,3,8)#arrows(x0, y0, x1, y1)
arrows(1,9,5,9,code=3)
arrows(4,1,4,6,code=3,angle=90)
#draws an arrow from the cursor position
click.arrows <- function(){ coos <- c(unlist(locator(1)),unlist(locator(1)))
                            arrows(coos[1],coos[2],coos[3],coos[4])
}
click.arrows()#draws an arrow from the cursor position

#Polygon dessinÈ grace a la sourie
locations <- locator(6)#enregistrer les clik de sourie double clik quand terminÈ
locations
polygon(locations,col="lavender")

#5.3.2 Drawing more complex shapes with polygon====
z <- seq(-3,3,0.01)
pd <- dnorm(z)
plot(z,pd,type="l")
polygon(c(z[z<=-1],-1),c(pd[z<=-1],pd[z==-3]),col="red")

#5.4 Drawing mathematical functions====
curve(x^3-3*x, -4, 4)

x <- seq(-2,2,0.01)
y <- x^3-3*x
plot(x,y,type="l")


#5.4.1 Adding smooth parametric curves to a scatterplot====
xv <- 0:100
yA <- 482*xv*exp(-0.045*xv)
yB <- 518*xv*exp(-0.055*xv)
plot(c(xv,xv),c(yA,yB),xlab="stock",ylab="recruits",type="n")
lines(xv,yA,lty=2,col="blue")
lines(xv,yB,lty=1,col="red")
info <- read.table("c:\\temp\\plotfit.txt",header=T)
attach(info)
names(info)
points(info$x,info$y,pch=12)


#5.4.2 Fitting non-parametric curves through a scatterplot====
  lowess (a non-parametric curve fitter);
 loess (a modelling tool);
 gam (fits generalized additive models; p. 666);
 lm for polynomial regression (fit a linear model involving powers of x).

data <- read.table("c:\\temp\\jaws.txt",header=T)
attach(data)
names(data)
par(mfrow=c(2,2))
plot(age,bone,pch=16,main="lowess")
lines(lowess(age,bone),col="red")

plot(age,bone,pch=16,main="loess")
model <- loess(bone~age)
xv <- 0:50
yv <- predict(model,data.frame(age=xv))
lines(xv,yv,col="red")

library(mgcv)
plot(age,bone,pch=16,main="gam")
model <- gam(bone~s(age))
xv <- 0:50
yv <- predict(model,list(age=xv))
lines(xv,yv,col="red")


plot(age,bone,pch=16,main="cubic polynomial")
model <- lm(bone~age+I(age^2)+I(age^3))
xv <- 0:50
yv <- predict(model,list(age=xv))
lines(xv,yv,col="red")


#5.5 Shape and size of the graphics window====
data <- read.table("c:\\temp\\pollute.txt",header=T)
attach(data)
par(mfrow=c(1,2))
plot(Population,Pollution)
plot(Temp,Pollution)


windows(7,4)
par(mfrow=c(1,2))
plot(Population,Pollution)
plot(Temp,Pollution)


#5.6 Plotting with a categorical explanatory variable :boxplot====
#Pour faire des boxplot
weather <- read.table("c:\\temp\\SilwoodWeather.txt",header=T)
attach(weather)
names(weather)
str(weather)
str(month)
month <- factor(month)#transformer en factor
str(weather)
str(month)
#Now we can plot using a categorical explanatory variable (month) and, because the first variable is a
#factor, we get a boxplot rather than a scatterplot:
plot(month,upper,ylab="daily maximum temperature",xlab="month")


#5.6.1 Boxplots with notches to indicate significant differences====p235



trial <- read.table("c:\\temp\\compexpt.txt",header=T)
attach(trial)
names(trial)
means <- tapply(biomass,clipping,mean)
barplot(means,xlab="treatment",ylab="mean yield",col="green")


seBars <- function(x,y){ model <- lm(y~factor(x))
                         reps <- length(y)/length(levels(x))
                         sem <- summary(model)$sigma/sqrt(reps)
                         m <- as.vector(tapply(y,x,mean))
                         upper <- max(m)+sem
                         nn <- as.character(levels(x))
                         xs <- barplot(m,ylim=c(0,upper),names=nn,
                                       ylab=deparse(substitute(y)),xlab=deparse(substitute(x)))
                         for (i in 1:length(xs)) { arrows(xs[i],m[i]+sem,xs[i],m[i]-sem,angle=90,code=3,length=0.1) }
}

seBars(clipping,biomass)


windows(7,4)
par(mfrow=c(1,2))
plot(clipping,biomass)
plot(clipping,biomass,notch=T)


#5.6.3 Plots for multiple comparisons====p239
data <- read.table("c:\\temp\\box.txt",header=T)
attach(data)
names(data)
plot(response~factor(fact),notch=TRUE)

index <- order(tapply(response,fact,mean))
ordered <- factor(rep(index,rep(20,8)))
boxplot(response~ordered,notch=T,names=as.character(index), xlab="ranked treatments",ylab="response")

model <- aov(response~factor(fact))
summary(model)
plot(TukeyHSD(model))


#5.6.4 Using colour palettes with categorical explanatory variables====
data <- read.table("c:\\temp\\silwoodweather.txt",header=T)
attach(data)
month <- factor(month)
season <- heat.colors(12)
temp <- c(11,10,8,5,3,1,2,3,5,8,10,11)
plot(month,upper,col=season[temp],notch=T)





#5.7 Plots for single samples====
When we have a just one variable, the choice of plots is more restricted:
 hist(y) histograms to show a frequency distribution
 plot(y) index plots to show the values of y in sequence
 plot.ts(y) time series plots
 pie(x) compositional plots like pie diagrams

#5.7.1 Histograms and bar charts====
data<-read.table("c:\\temp\\daphnia.txt",header=T)
attach(data)
names(data)
par(mfrow=c(1,2))
hist(Growth.rate,seq(0,8,0.5),col="green",main="")
y <- as.vector(tapply(Growth.rate,list(Daphnia,Detergent),mean))
barplot(y,col="green",ylab="Growth rate",xlab="Treatment")


#5.7.2 Histograms====
par(mfrow=c(2,2))
hist(Growth.rate,seq(0,8,0.25),col="green",main="1")
hist(Growth.rate,seq(0,8,0.5),col="green",main="2")
hist(Growth.rate,seq(0,8,2),col="green",main="3")
hist(Growth.rate,c(0,3,4,8),col="green",main="4")
range(Growth.rate)
edges <- c(0,3,4,8)
bin <- cut(Growth.rate,edges)

#5.7.3 Histograms of integers====
par(mfrow=c(1,1))
values <- rpois(1000,1.70)
hist(values,main="",xlab="random numbers from a Poisson with mean 1.7")
hist(values,main="",xlab="random numbers from a Poisson with mean 1.7",breaks=(-0.5:8.5))


#5.7.4 Overlaying histograms with smooth density functions====
y <- rnbinom(158,mu=1.5,size=1)
bks <- -0.5:(max(y)+0.5)
hist(y,bks,main="")
xs <- 0:11
ys <- dnbinom(xs,size=1.2788,mu=1.772)
lines(xs,ys*158)


#5.7.5 Density estimation for continuous variables====p248
library(MASS)
attach(faithful)
#The rule of thumb for bandwidth gives:
  (max(eruptions)-min(eruptions))/(2*(1+log(length(eruptions),base=2)))
head(faithful)
faithful
summary(faithful)

windows(7,4)
par(mfrow=c(1,2))
hist(eruptions,15,freq=FALSE,main="",col=27)
lines(density(eruptions,width=0.6,n=200))
truehist(eruptions,nbins=15,col=27)
lines(density(eruptions,n=200))


#5.7.6 Index plots====
response <- read.table("c:\\temp\\das.txt",header=T)
plot(response$y)
response$y[50] <- 2.179386


#5.7.7 Time series plots====
data(UKLungDeaths)
ts.plot(ldeaths, mdeaths, fdeaths, xlab="year", ylab="deaths", lty=c(1:3))


data(sunspots)
plot(sunspots)

#5.7.8 Pie charts====p252
data <- read.csv("c:\\temp\\piedata.csv")
pie(data$amounts,labels=as.character(data$names))


#35.7.9 The stripchart function====
data(OrchardSprays)
with(OrchardSprays,stripchart(decrease ~ treatment,ylab = "decrease", vertical = TRUE, log = "y"))


#5.7.10 A plot to test for normality====
normal.plot <- function(y) { s <- sd(y)
                             plot(c(0,3),c(min(0,mean(y)-s * 4*
                                                 qnorm(0.75)),max(y)),xaxt="n",xlab="",type="n",ylab="")
                             # for your data's boxes and whiskers, centred at x = 1
                             top <- quantile(y,0.75)
                             bottom <- quantile(y,0.25)
                             w1u <- quantile(y,0.91)
                             w2u <- quantile(y,0.98)
                             w1d <- quantile(y,0.09)
                             w2d <- quantile(y,0.02)
                             rect(0.8,bottom,1.2,top)
                             lines(c(0.8,1.2),c(mean(y),mean(y)),lty=3)
                             lines(c(0.8,1.2),c(median(y),median(y)))
                             lines(c(1,1),c(top,w1u))
                             lines(c(0.9,1.1),c(w1u,w1u))
                             lines(c(1,1),c(w2u,w1u),lty=3)
                             lines(c(0.9,1.1),c(w2u,w2u),lty=3)
                             nou <- length(y[y>w2u])
                             points(rep(1,nou),jitter(y[y>w2u]))
                             lines(c(1,1),c(bottom,w1d))
                             lines(c(0.9,1.1),c(w1d,w1d))
                             lines(c(1,1),c(w2d,w1d),lty=3)
                             lines(c(0.9,1.1),c(w2d,w2d),lty=3)
                             nod <- length(y[y<w2d])
                             points(rep(1,nod),jitter(y[y<w2d]))
                             #for the normal box and whiskers, centred at x = 2
                             n75 <- mean(y)+ s * qnorm(0.75)
                             n25 <- mean(y)- s * qnorm(0.75)
                             n91 <- mean(y)+ s * 2* qnorm(0.75)
                             n98 <- mean(y)+ s * 3* qnorm(0.75)
                             n9 <- mean(y)- s * 2* qnorm(0.75)
                             n2 <- mean(y)- s * 3* qnorm(0.75)
                             rect(1.8,n25,2.2,n75)
                             lines(c(1.8,2.2),c(mean(y),mean(y)),lty=3)
                             lines(c(2,2),c(n75,n91))
                             lines(c(1.9,2.1),c(n91,n91))
                             lines(c(2,2),c(n98,n91),lty=3)
                             lines(c(1.9,2.1),c(n98,n98),lty=3)
                             lines(c(2,2),c(n25,n9))
                             lines(c(1.9,2.1),c(n9,n9))
                             lines(c(2,2),c(n9,n2),lty=3)
                             lines(c(1.9,2.1),c(n2,n2),lty=3)
                             lines(c(1.2,1.8),c(top,n75),lty=3,col="gray")
                             lines(c(1.1,1.9),c(w1u,n91),lty=3,col="gray")
                             lines(c(1.1,1.9),c(w2u,n98),lty=3,col="gray")
                             lines(c(1.2,1.8),c(bottom,n25),lty=3,col="gray")
                             lines(c(1.1,1.9),c(w1d,n9),lty=3,col="gray")
                             lines(c(1.1,1.9),c(w2d,n2),lty=3,col="gray")
                             # label the two boxes
                             axis(1,c(1,2),c("data","normal")) }


y <- rnbinom(100,1,0.2)
normal.plot(y)


#5.8 Plots with multiple variables====
Initial data inspection using plots is even more important when there are many variables, any one of which
might contain mistakes or omissions. The principal plot functions when there are multiple variables are:
 pairs for a matrix of scatterplots of every variable against every other;
 coplot for conditioning plots where y is plotted against x for different values of z;
 xyplot where a set of panel plots is produced.
We illustrate these functions with the ozone data.


#5.8.1 The pairs function====
ozonedata <- read.table("c:\\temp\\ozone.data.txt",header=T)
attach(ozonedata)
names(ozonedata)
pairs(ozonedata,panel=panel.smooth)

#5.8.2 The coplot function====
coplot(ozone~wind|temp,panel = panel.smooth)


#5.8.3 Interaction plots====
yields <- read.table("c:\\temp\\splityield.txt",header=T)
attach(yields)
names(yields)
interaction.plot(fertilizer,irrigation,yield)


#5.9.1 Design plots====p260
plot.design(Growth.rate~Water*Detergent*Daphnia)

#5.9.2 Bubble plots====
bubble.plot <- function(xv,yv,rv,bs=0.1)
  { r <- rv/max(rv)
    yscale <- max(yv)-min(yv)
    xscale <- max(xv)-min(xv)
    plot(xv,yv,type="n", xlab=deparse(substitute(xv)),ylab=deparse(substitute(yv)))
    for (i in 1:length(xv)) 
      bubble(xv[i],yv[i],r[i],bs,xscale,yscale) 
    } 
    bubble <- function (x,y,r,bubble.size,xscale,yscale) 
     { theta <- seq(0,2*pi,pi/200)
       yv <- r*sin(theta)*bubble.size*yscale
       xv <- r*cos(theta)* bubble.size*xscale
       lines(x+xv,y+yv) }

ddd <- read.table("c:\\temp\\pgr.txt",header=T)
attach(ddd)
names(ddd)
bubble.plot(hay,pH,FR)


#5.9.3 Plots with many identical values====
numbers <- read.table("c:\\temp\\longdata.txt",header=T)
attach(numbers)
names(numbers)
plot(jitter(xlong,amount=1),jitter(ylong,amount=1),xlab="input",ylab="count")
sunflowerplot(xlong,ylong)



#5.10 Saving graphics to file====
data <- read.table("c:\\temp\\pollute.txt",header=T)
attach(data)
pdf("c:\\temp\\pollution.pdf",width=7,height=4)
par(mfrow=c(1,2))
plot(Population,Pollution)
plot(Temp,Pollution)
dev.off()


#6 Table====
counts<-rpois(1000,0.6)
table(counts)

data<-read.table("c:\\temp\\Daphnia.txt",header=T)
attach(data)
head(data)
tapply(Growth.rate,Detergent,mean)
tapply(Growth.rate,Water,mean)
tapply(Growth.rate,Daphnia,mean)
tapply(Growth.rate,list(Daphnia,Detergent),mean)
tapply(Growth.rate,list(Daphnia,Detergent),median)
tapply(Growth.rate,list(Daphnia,Detergent), function(x) sqrt(var(x)/length(x)))
tapply(Growth.rate,list(Daphnia,Detergent,Water),mean)
ftable(tapply(Growth.rate,list(Daphnia,Detergent,Water),mean))
water<-factor(Water,levels=c("Wear","Tyne"))
ftable(tapply(Growth.rate,list(Daphnia,Detergent,water),mean))
tapply(Growth.rate,Detergent,mean)
tapply(Growth.rate,Detergent,mean,trim=0.1)



#6.3 Expanding a table into a dataframe====
count.table<-read.table("c:\\temp\\tabledata.txt",header=T)
attach(count.table)
head(count.table)
dbtable<-as.data.frame(lapply(count.table,function(x) rep(x, count.table$count)))
head(dbtable)
dbtable<-dbtable[,-1]#enlever la col count
head(dbtable)

#6.4 Converting from a dataframe to a table====
table(dbtable)
as.data.frame(table(dbtable))


#6.5 Calculating tables of proportions with prop.table====
counts<-matrix(c(2,2,4,3,1,4,2,0,1,5,3,3),nrow=4)
counts
prop.table(counts,1)#row
prop.table(counts,2)#col
colSums(prop.table(counts,2))#To check that the column proportions sum to 1
prop.table(counts)
sum(prop.table(counts))


#6.6 The scale function====
scale(counts)
apply(counts,2,sd)


#6.7 The expand.grid function====
#This is a useful function for generating tables from factorial combinations of factor levels.
expand.grid(height = seq(60, 80, 5), weight = seq(100, 300, 50), sex = c("Male","Female"))

#6.8 The model.matrix function
data<-read.table("c:\\temp\\parasites.txt")
names(data)<-"parasite"
attach(data)
head(data)
levels(parasite)
model.matrix(~parasite-1)


#6.9 Comparing table and tabulate====
table(c(2,2,2,7,7,11))
tabulate(c(2,2,2,7,7,11))


#7 7.1 Mathematics

#7.1 Mathematical functions====
x <- seq(0,10,0.1)
windows(7,4)
par(mfrow=c(1,2))
y <- exp(x)
plot(y~x,type="l",main="Exponential")
y <- log(x)
plot(y~x,type="l",main="Logarithmic")

#7.1.2 Trigonometric functions====
#cosine  (base/hypotenuse), 
#sine    (perpendicular/hypotenuse) 
#tangent (perpendicular/base)
#functions of x (measured in radians) over the range 0 to 2??. 
#Recall that the full circle is 2?? radians, so 1
#radian = 360/2?? = 57.295 78 degrees.
windows(7,7)
par(mfrow=c(2,2))
x <- seq(0,2*pi,2*pi/100)
y1 <- cos(x)
y2 <- sin(x)
y3 <- tan(x)
plot(y1~x,type="l",main="cosine")
plot(y2~x,type="l",main="sine")
plot(y3~x,type="l",ylim=c(-3,3),main="tangent")




