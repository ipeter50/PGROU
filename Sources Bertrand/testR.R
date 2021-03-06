
# Chargement librairie => Foret arbre de d�cision
library(randomForest)

##############.

# G�n�ration de la foret pour les donn�es HOVON
modele<-read.table("D:\\Documents\\Centrale\\Ei2\\PGROU\\Pgrou\\resultat_GSE19784HOVON65.csv", row.names=1)
colnames(modele)[ncol(modele)]="HR"
ForetAleaHOVON<- randomForest(HR~.,data=modele, prox=TRUE, ntree=nrow(modele))

# G�n�ration de la foret pour les donn�es UAMS
modele<-read.table("D:\\Documents\\Centrale\\Ei2\\PGROU\\Pgrou\\resultat_GSE19784HOVON65.csv", row.names=1)
colnames(modele)[ncol(modele)]="HR"
ForetAleaUAMS<- randomForest(HR~.,data=modele, prox=TRUE, ntree=nrow(modele))


# Test du modele HOVON sur donn�es UAMS
validation=read.table("resultat_GSE24080UAMS.csv", row.names=1)
colnames(validation)[ncol(modele)]="HR"
prediction=predict(ForetAleaHOVON, validation)
prediction=prediction>0.5
matriceConfusion=table(validation$HR, prediction)
precision=sum(diag(matriceConfusion))/sum(matriceConfusion)
print(precision)