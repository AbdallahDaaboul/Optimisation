#------------------------------------------
#
# (c) Hacene Ouzia, Polytech'Paris UPMC
#
#------------------------------------------
# Exemple de modele avec gmpl
#------------------------------------------

#--- Nombre de variables
param N, integer, > 0;
param M, integer, > 0;


#--- Indices des colonnes
set I := 1..M;

#--- Indices des lignes
set J := 1..N;

#--- Coefficients de la fonc. objectif
param c{ i in I , j in J};

#--- Second membre des contraintes
param b{j in J};

#--- Coefficients de la matrice des contraintes
param A{i in I, j in J};

#--- Vecteur a
param a{i in I};

#--- Variables de decision
var x{i in I} >= 0;
var z, >=0;

#--- Contraintes du probleme
s.t. capacity{i in I}: sum{j in J}A[i,j]*x[i] <= b[i];
s.t. capacity2{i in I}: x[i]-a[i] >= -z;
s.t. capacity3{i in I}: x[i]-a[i] <= z;

#--- Critere a optimiser
minimize profit: z;

#--- Commande pour lancer la resolution du probleme ...
solve;

##------------------------------------
## Section pour generer un rapport apres resolution
##-------------------------------------------------

printf '\n\n';
printf '#########################################\n';
printf '##  REPORTING \n';
printf '##\n';

printf "   Optimium objective value : %.2f \n", profit;
printf "   Optimal solution found:\n\n";
for{i in I}{
 printf '%5s x(%s) = %.2f',' ',i,  x[i];
 printf "\n";
}

printf "\n";
printf "##\n";
printf "##########################################";
printf "\n\n";

end;
