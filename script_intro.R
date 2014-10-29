
http://www.youtube.com/watch?v=s2oTUsAJfjI
pour sqldf la library sql pour r

rattel data miner vid?o:
http://www.youtube.com/watch?v=x67SL5_L0QY

##Installation de R et rstudio sur Ubuntu
http://cran.r-project.org/bin/linux/ubuntu/README

editer /etc/apt/sources.list
pour ajouter la ligne suivante :
deb http://cran.skazkaforyou.com/bin/linux/ubuntu precise/
  
sudo apt-get update
sudo apt-get install r-base  
sudo apt-get install r-base-dev

pour rstudio jai chercher sur internet et t?l?charg?
un fichier aui a ?t? ex?cut? directement par le gestionnaire ubuntu
  donc j e nai pas utilis? le sinfo de la page 
http://livesoncoffee.wordpress.com/2012/12/09/installing-r-on-ubuntu-12-04/





## Chargement des extensions n?cessaires
library(questionr)
## Jeu de donn?es hdv2003
data(hdv2003)
d <- hdv2003

nrow(d)
ncol(d)
dim(d)
names(d)
str(d)

# Un facteur et une variable pouvant prendre un nombre limit? de modalit?s (levels). Ici notre variable
# a deux modalit?s possibles : Homme et Femme. Ce type de variable est d?crit plus en d?tail section 5.1.3
# page 50.

d$sexe

# Les fonctions head et tail permettent d'afficher seulement les premi?res (respectivement les derni?res)
# valeurs prises par la variable. On peut leur passer en argument le nombre d'?l?ments ? afficher :
head(d$sport)
tail(d$age, 10)

mean(d$heures.tv, na.rm = TRUE)


#Histogramme =====

hist(d$heures.tv, main = "Nombre d'heures pass?es devant la t?l? par jour", xlab = "Heures", ylab = "Effectif")
hist(d$heures.tv, main = "Heures de t?l? en 7 classes", breaks = 7, xlab = "Heures",ylab = "Proportion", probability = TRUE, col = "orange")
hist(d$heures.tv, main = "Heures de t?l? avec classes sp?cifi?es", breaks = c(0, 1, 4, 9, 12), xlab = "Heures", ylab = "Proportion", col = "red")
boxplot(d$heures.tv, main = "Nombre d'heures pass?es devant la t?l? par jour", ylab = "Heures")

#bloc de code pour un histogramme
boxplot(d$heures.tv, col = grey(0.8), main = "Nombre d'heures pass?es devant la t?l? par jour",ylab = "Heures")
abline(h = median(d$heures.tv, na.rm = TRUE), col = "navy", lty = 2)
text(1.35, median(d$heures.tv, na.rm = TRUE) + 0.15, "M?diane", col = "navy")
Q1 <- quantile(d$heures.tv, probs = 0.25, na.rm = TRUE)
abline(h = Q1, col = "darkred")
text(1.35, Q1 + 0.15, "Q1 : premier quartile", col = "darkred", lty = 2)
Q3 <- quantile(d$heures.tv, probs = 0.75, na.rm = TRUE)
abline(h = Q3, col = "darkred")
text(1.35, Q3 + 0.15, "Q3 : troisi?me quartile", col = "darkred", lty = 2)
arrows(x0 = 0.7, y0 = quantile(d$heures.tv, probs = 0.75, na.rm = TRUE), x1 = 0.7, y1 = quantile(d$heures.tv, probs = 0.25, na.rm = TRUE), length = 0.1, code = 3)
text(0.7, Q1 + (Q3 - Q1)/2 + 0.15, "h", pos = 2)
mtext("L'?cart inter-quartile h contient 50 % des individus", side = 1)
abline(h = Q1 - 1.5 * (Q3 - Q1), col = "darkgreen")
text(1.35, Q1 - 1.5 * (Q3 - Q1) + 0.15, "Q1 -1.5 h", col = "darkgreen", lty = 2)
abline(h = Q3 + 1.5 * (Q3 - Q1), col = "darkgreen")
text(1.35, Q3 + 1.5 * (Q3 - Q1) + 0.15, "Q3 +1.5 h", col = "darkgreen", lty = 2)


#un autre histe
boxplot(d$heures.tv, main = "Nombre d'heures pass?es devant la t?l? par\njour", ylab = "Heures")
rug(d$heures.tv, side = 2)

#donn?es qualitatives
table(d$sexe)
sort(table(d$occup), decreasing = TRUE)
table(d$trav.satisf, useNA = "ifany")
summary(d$trav.satisf)
freq(d$qualif)
freq(d$qualif, cum = TRUE, total = TRUE, sort = "inc", digits = 2, exclude = NA)
#Exemple de diagramme en b?tons
plot(table(d$freres.soeurs), main = "Nombre de fr?res, soeurs, demi-fr?res et demi-soeurs", ylab = "Effectif")
#Exemple de diagramme de Cleveland
dotchart(t(table(d$clso)), main = "Sentiment d'appartenance ? une classe sociale", pch = 19)
#Exemple de diagramme de Cleveland ordonn?
dotchart(sort(table(d$qualif)), main = "Niveau de qualification")



#Importation de donn?e de d,autre logiciel====
library(foreign)
#SAS
Les fichiers au format SAS se pr?sentent en g?n?ral sous deux format : format SAS export 
(extension  .xport ou .xpt) ou format SAS natif (extension .sas7bdat).
R peut lire directement les fichiers au format export via la fonction read.xport de l'extension foreign.
Celle-ci s'utilise tr?s simplement, en lui passant le nom du fichier en argument :
R> donnees <- read.xport("fichier.xpt")

#SPSS
R> donnees <- read.spss("fichier.sav", to.data.frame = TRUE)

#Stata
donnees <- read.data("fichier.dta", to.data.frame = TRUE)

#Fichiers dbf
L'Insee diffuse ses fichiers d?tails depuis son site Web au format dBase (extension .dbf).
Ceux-ci sont directement lisibles dans R avec la fonction read.dbf de l'extension foreign.
R> donnees <- read.dbf("fichier.dbf")

#mysql
se connecter
? un syst?me de base de donn?es relationelle type MySql, de lire des donn?es via ODBC ou des connexions
r?seau,



#sauver de s donn?es =====
R> save(d, tailles, poids, file = "export.RData")
R> load("export.RData")

R> save.image()


#exporter
write.table()
write.foreign()
write.dbf()


#chapitre 5 manipulation des donn?es ======

#nom des col ou variables d,un data frame

#pour sortir les nom de col dans un c() format?: dput()
> dput(names(d))
c("id", "age", "sexe", "nivetud", "poids", "occup", "qualif", 
  "freres.soeurs", "clso", "relig", "trav.imp", "trav.satisf", 
  "hard.rock", "lecture.bd", "peche.chasse", "cuisine", "bricol", 
  "cinema", "sport", "heures.tv")

On obtient en r?sultat la liste des variables sous forme de vecteur d?clar?. On n'a plus alors qu'?
copier/coller cette cha?ne, rajouter names(d) <- devant, et modifier un ? un les noms des variables.

#modifier le nom d'une variable, rename.variable()
> d <- rename.variable(d, "bricol", "bricolage")

#factor est un type de donn?e (liste limit? d'?l?ment)
> levels(d$sexe)
[1] "Homme" "Femme"
> levels(d$qualif)
[1] "Ouvrier specialise"       "Ouvrier qualifie"         "Technicien"               "Profession intermediaire"
[5] "Cadre"

> sqldf("select distinct qualif from d")
1                  Employe
2                     <NA>
3               Technicien
4         Ouvrier qualifie
5                    Autre
6                    Cadre
7       Ouvrier specialise
8 Profession intermediaire

> iorder(d, qualif) #ouvre un page web interactive poiur g?g?ner du code R
Listening on http://127.0.0.1:4602


#tableaux crois? entre 2 var
> table(d$qualif, d$cinema)
                         Non Oui
Ouvrier specialise       158  45
Ouvrier qualifie         219  73
Technicien                49  37
Profession intermediaire  87  73
Cadre                     90 170
Employe                  332 262
Autre                     31  27


#indexage -======
tout sauf -
> v <- c("a", "b", "c", "d", "e", "f", "g")
> v[-1]
[1] "b" "c" "d" "e" "f" "g"

> v[c(-1,-2)] #ou 
[1] "c" "d" "e" "f" "g"
> v[-c(1,2)]
[1] "c" "d" "e" "f" "g"

#indexation par nom
d$clso == d[, "clso"]
d[, c("id", "sexe", "age")]
d[, names(d) != "qualif"]
-pourl les row:
  row.names(rp99) <- rp99$nom
  rp99[c("VILLEURBANNE", "OULLINS"), ]


#Indexation par conditions
> head(d$age)
[1] 28 23 59 34 71 35
> head(d$age > 40)
[1] FALSE FALSE  TRUE FALSE  TRUE FALSE
> d$sexe == "Femme" & (d$qualif == "Employe" | d$qualif == "Cadre")
[1]  TRUE    NA FALSE FALSE  TRUE  TRUE FALSE FALSE    NA FALSE  TRUE FALSE  TRUE    NA    NA  TRUE FALSE    NA
[19] FALSE FALSE  TRUE FALSE  TRUE    NA FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE

> table(d$sexe == "Homme")
FALSE  TRUE 
1101   899 
length(d[d$sexe == "Homme", ])

#L'exemple suivant, un peu compliqu?, s?lectionne uniquement les
#variables dont le nom commence par a ou s :
d[, substr(names(d), 0, 1) %in% c("a", "s")]
  age sexe sport
1 28 Femme Non
2 23 Femme Oui


#5.3 Sous-populations
#pas indexation avec critere
R> d.satisf <- d[d$trav.satisf == "Satisfaction" & !is.na(d$trav.satisf), ]

#par la func subset()
R> dh <- subset(d, sexe == "Homme")
R> df <- subset(d, sexe == "Femme")

R> d2 <- subset(d, select = c(sexe, sport))
R> d2 <- subset(d, age > 25, select = -c(id, age, bricol))

p67 les recodage

convertir du num en factor:
> d$fs.fac <- factor(d$freres.soeurs)
> levels(d$fs.fac)

d'une variable num?rique en variable caract?res
d$fs.char <- as.character(d$freres.soeurs)
d$qualif.char <- as.character(d$qualif)


de car vers num:
d$fs.num <- as.numeric(as.character(d$fs.fac))


#d?couper les donn?es en classe avec cut()
#  ( signifie que la fronti?re de laclasse est exclue, 
#  [ signifie qu'elle est incluse.
#Ainsi, (20,40] signifie ? strictement sup?rieur ? 20 et inf?rieur ou ?gal ? 40 ?.
#        21..40

> d$age5cl <- cut(d$age, 5) #cinq classes d'amplitudes ?gales.
> table(d$age5cl)
(17.9,33.8] (33.8,49.6] (49.6,65.4] (65.4,81.2] (81.2,97.1] 
454         628         556         319          43 

> summary(d$age)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
18.00   35.00   48.00   48.16   60.00   97.00 


> d$age20 <- cut(d$age, c(0, 20, 40, 60, 80, 100))#sp?cifier les bornes nous-m?me
> table(d$age20)
(0,20]  (20,40]  (40,60]  (60,80] (80,100] 
72      660      780      436       52 


#On aurait pu tenir compte des ?ges extr?mes pour la premi?re et la derni?re valeur :
R> range(d$age) #donne le min et le max
[1] 18 97
R> d$age20 <- cut(d$age, c(17, 20, 40, 60, 80, 93))
R> table(d$age20)
(17,20] (20,40] (40,60] (60,80] (80,93]


#modifier le sens des intervalles avec l'option right=FALSE, et indiquer les noms des modalit?s avec labels :
R> d$age20 <- cut(d$age, c(17, 20, 40, 60, 80, 93), include.lowest = TRUE, labels = c("<20ans",
                                                                                      + "21-40 ans", "41-60ans", "61-80ans", ">80ans"))
R> table(d$age20)
<20ans 21-40 ans 41-60ans 61-80ans >80ans
    72       660       780     436     50

#en mode interactive 
icut(d, age)#ouvre une page web
irec(d, qualif)


p72  5.4.4 Variables calcul?es

> range(d$heures.tv, na.rm = TRUE)
[1]  0 12
> mean(d$heures.tv, na.rm = TRUE)
[1] 2.246566
#calculer 2 col et stoker dans une nouvelle
> d$ecart.heures.tv <- d$heures.tv - mean(d$heures.tv, na.rm = TRUE)
> summary(d$ecart.heures.tv,na.rm=TRUE)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NAs 
-2.2470 -1.2470 -0.2466  0.0000  0.7534  9.7530       5 


#5.4.5 Combiner plusieurs variables====
d$act.manuelles <- NA #crer vouelle col et initialiser
d$act.manuelles[d$cuisine == "Oui" & d$bricol == "Oui"] <- "Cuisine et Bricolage"
d$act.manuelles[d$cuisine == "Oui" & d$bricol == "Non"] <- "Cuisine seulement"
d$act.manuelles[d$cuisine == "Non" & d$bricol == "Oui"] <- "Bricolage seulement"
d$act.manuelles[d$cuisine == "Non" & d$bricol == "Non"] <- "Ni cuisine ni bricolage"
table(d$act.manuelles)


#5.4.6 Variables scores====
#doner un socre selon le tye d'activit? ex: cinema=10 sport=20 peche=30
R> d$score.ext <- 0 #nouvelle col initialis? a z?ro
R> d$score.ext <- ifelse(d$cinema == "Oui", 10, 0) + ifelse(d$peche.chasse == "Oui",
                                + 30, 0) + ifelse(d$sport == "Oui", 20, 0)


#5.4.7 V?rification des recodages====
#pour f?vifier si les recodages ont bien fonctionn?
#c'est une bonne id?e de faire des tableux cros? afin de valider
#si les donn?es sont bine
#Les deux points les plus sensibles ?tant les valeurs manquantes et les erreurs dans
#les conditions.
#Pour v?rifier tout cela le plus simple est sans doute de faire des tableaux crois?s entre la variable
#recod?e et celles ayant servi au recodage, ? l'aide de la fonction table, et de v?rifier le nombre de valeurs
#3manquantes dans la variable recod?e avec summary, freq ou table.
R> d$act.manuelles <- NA
R> d$act.manuelles[d$cuisine == "Oui" & d$bricol == "Oui"] <- "Cuisine et Bricolage"
R> d$act.manuelles[d$cuisine == "Oui" & d$bricol == "Non"] <- "Cuisine seulement"
R> d$act.manuelles[d$cuisine == "Non" & d$bricol == "Oui"] <- "Bricolage seulement"
R> d$act.manuelles[d$cuisine == "Non" & d$bricol == "Non"] <- "Ni cuisine ni bricolage"
R> table(d$act.manuelles, d$cuisine)
Non Oui
Bricolage seulement 437 0
Cuisine et Bricolage 0 416
Cuisine seulement 0 465
Ni cuisine ni bricolage 682 0
R> table(d$act.manuelles, d$bricol)
Non Oui
Bricolage seulement 0 437
Cuisine et Bricolage 0 416
Cuisine seulement 465 0
Ni cuisine ni bricolage 682 0


#5.6 merge()====
#le merge fusionne avec un ou plusieurs champs grace au mot by=""
by="id"# si le champ id est dans les 2 tables
by=c("nom","prenom","date.naissance")# pour sp?cifier plusieurs champs combin?s
all.x=TRUE et all.y=TRUE. #server a sonserver des champ n'ayant aucune donn?es

> d1=subset(d,select=c("id","age","sexe"))
> d2=subset(d,select=c("id","clso"))
> dim(d1)
[1] 2000    3
> dim(d2)
[1] 2000    2
> d.complet=merge(d1,d2,by="id")
> head(d.complet)
id age  sexe clso
1  1  28 Femme  Oui


#5.7 Organiser ses scripts====
La func source() execute les code dun fichier de script
source("import.R")
source("recodages.R")



#6 statistique bivari?e : ?tude des relations entre deux variables, ====
#celles-ci pouvant ?tre quantitatives ou qualitatives.

data(hdv2003)
d <- hdv2003
data(rp99)


#6.1 Deux variables quantitatives====

R> plot(d$age, d$heures.tv, pch = 19, col = rgb(1, 0, 0, 0.1))


#supprimer les observations ayant au
#moins une valeur manquante ? l'aide de la fonction complete.cases, estimer la densit? locale ? l'aide de
#la fonction kde2d de l'extension MASS 1 et repr?senter le tout ? l'aide d'une des fonctions image, contour
#ou filled.contour. .
R> library(MASS)
R> tmp <- d[, c("age", "heures.tv")]
R> tmp <- tmp[complete.cases(tmp), ]
R> filled.contour(kde2d(tmp$age, tmp$heures.tv), color = terrain.colors)


#6.2 Une variable quantitative et une variable qualitative====
data(rp99)
reg <- lm(cadres ~ dipl.sup, data = rp99)
plot(rp99$dipl.sup, rp99$cadres, ylab = "Part des cadres", xlab = "Part des diplômés du supérieur")
abline(reg, col = "red")

d.hard <- subset(d, hard.rock == "Oui")
d.non.hard <- subset(d, hard.rock == "Non")
boxplot(d.hard$age, d.non.hard$age)
boxplot(age ~ hard.rock, data = d)
tapply(d$age, d$hard.rock, mean)
t.test(d$age ~ d$hard.rock)


par(mfrow = c(1, 2))
hist(d$age[d$hard.rock == "Oui"], main = "Hard rock", col = "red")
hist(d$age[d$hard.rock == "Non"], main = "Sans hard rock", col ="red")


p96