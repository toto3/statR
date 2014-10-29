
#Corps des funttions ====


#Nom: central 
#Ca fait quoi:
#Ca recoit quoi:
#Ca retourne quoi:
#Date modif:
#Utilisation:
central <- function(y, measure) { switch(measure,
                                         Mean = mean(y),
                                         Geometric = exp(mean(log(y))),
                                         Harmonic = 1/mean(1/y),
                                         Median = median(y),
                                         stop("Measure not included")) }



#Nom: variance.ratio 
#Ca fait quoi:variance.ratio
#Ca recoit quoi:
#Ca retourne quoi:
#Date modif:
#Utilisation:
variance.ratio <- function(x,y) {
  v1 <- var(x)
  v2 <- var(y)
  if (var(x) > var(y)){ vr <- var(x)/var(y)
                        df1 <- length(x)-1
                        df2 <- length(y)-1} else { vr <- var(y)/var(x)
                                                   df1 <- length(y)-1
                                                   df2 <- length(x)-1}
  2*(1-pf(vr,df1,df2)) }



#Nom: variance ====
#Ca fait quoi:
#Ca recoit quoi:
#Ca retourne quoi:
#Date modif:
#Utilisation:
variance <- function(x) sum((x - mean(x))^2)/(length(x)-1)



#Nom: harmonic.mean ====
#Ca fait quoi:harmonic.mean
#Ca recoit quoi:
#Ca retourne quoi:
#Date modif:
#Utilisation:
harmonic.mean <- function (x) 1/mean(1/x)

#Nom:geometric.mean====
#Ca fait quoi:geometric.mean
#Ca recoit quoi:
#Ca retourne quoi:
#Date modif:
#Utilisation:
geometric.mean <- function (x) exp(mean(log(x)))

#Nom: med 
#Ca fait quoi:median après avoir décider entre 2 méthose selon que le 
#       nombre d'éléments du vector soit pair ou impair 
#Ca recoit quoi:un vector
#Ca retourne quoi:un number 
#Date modif:
#Utilisation:med(x)
med <- function(x) {
  odd.even <- length(x)%%2
  if (odd.even == 0) (sort(x)[length(x)/2]+sort(x)[1+ length(x)/2])/2
  else sort(x)[ceiling(length(x)/2)]
}


#Nom:arthmetic.mean ====
#Ca fait quoi: calcul la moyenne de x
#Ca recoit quoi: x un vector
#Ca retourne quoi: la moyenne de x
#Date modif:9 avril 2014
#Utilisation:arithmetic.mean(c(10,15,5))
arithmetic.mean <- function(x) sum(x)/length(x)

#Nom: model ====
#Ca fait quoi:
#Ca recoit quoi:
#Ca retourne quoi:
#Date modif:
#Utilisation: